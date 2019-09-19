   package mars.mips.hardware;
   import mars.*;
   import mars.util.*;
   import mars.simulator.*;
   import mars.mips.instructions.*;
   import java.util.*;

	/*
Copyright (c) 2003-2009,  Pete Sanderson and Kenneth Vollmar

Developed by Pete Sanderson (psanderson@otterbein.edu)
and Kenneth Vollmar (kenvollmar@missouristate.edu)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject
to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(MIT license, http://www.opensource.org/licenses/mit-license.html)
 */

/**
 * Represents MIPS memory.  Different segments are represented by different data structs.
 *
 * @author Pete Sanderson
 * @version August 2003
 */

/////////////////////////////////////////////////////////////////////
// NOTE: This implementation is purely big-endian.  MIPS can handle either one.
/////////////////////////////////////////////////////////////////////

    public class Memory extends Observable  {

    /** base address for (user) text segment: 0x00400000 **/
      public static int textBaseAddress = MemoryConfigurations.getDefaultTextBaseAddress(); //0x00400000;
    /** base address for (user) data segment: 0x10000000 **/
      public static int dataSegmentBaseAddress = MemoryConfigurations.getDefaultDataSegmentBaseAddress(); //0x10000000;
    /** base address for .extern directive: 0x10000000 **/
      public static int externBaseAddress = MemoryConfigurations.getDefaultExternBaseAddress(); //0x10000000;
    /** base address for storing globals **/
      public static int globalPointer = MemoryConfigurations.getDefaultGlobalPointer(); //0x10008000;
    /** base address for storage of non-global static data in data segment: 0x10010000 (from SPIM) **/
      public static int dataBaseAddress = MemoryConfigurations.getDefaultDataBaseAddress(); //0x10010000; // from SPIM not MIPS
    /** base address for heap: 0x10040000 (I think from SPIM not MIPS) **/
      public static int heapBaseAddress = MemoryConfigurations.getDefaultHeapBaseAddress(); //0x10040000; // I think from SPIM not MIPS
    /** starting address for stack: 0x7fffeffc (this is from SPIM not MIPS) **/
      public static int stackPointer = MemoryConfigurations.getDefaultStackPointer(); //0x7fffeffc;
    /** base address for stack: 0x7ffffffc (this is mine - start of highest word below kernel space) **/
      public static int stackBaseAddress = MemoryConfigurations.getDefaultStackBaseAddress(); //0x7ffffffc;
    /** highest address accessible in user (not kernel) mode. **/
      public static int userHighAddress = MemoryConfigurations.getDefaultUserHighAddress(); //0x7fffffff;
    /** kernel boundary.  Only OS can access this or higher address **/
      public static int kernelBaseAddress = MemoryConfigurations.getDefaultKernelBaseAddress(); //0x80000000;
    /** base address for kernel text segment: 0x80000000 **/
      public static int kernelTextBaseAddress = MemoryConfigurations.getDefaultKernelTextBaseAddress(); //0x80000000;
    /** starting address for exception handlers: 0x80000180 **/
      public static int exceptionHandlerAddress = MemoryConfigurations.getDefaultExceptionHandlerAddress(); //0x80000180;
    /** base address for kernel data segment: 0x90000000 **/
      public static int kernelDataBaseAddress = MemoryConfigurations.getDefaultKernelDataBaseAddress(); //0x90000000;
    /** starting address for memory mapped I/O: 0xffff0000 (-65536) **/
      public static int memoryMapBaseAddress = MemoryConfigurations.getDefaultMemoryMapBaseAddress(); //0xffff0000;
    /** highest address acessible in kernel mode. **/
      public static int kernelHighAddress = MemoryConfigurations.getDefaultKernelHighAddress(); //0xffffffff;

    /** MIPS word length in bytes. **/
    // NOTE:  Much of the code is hardwired for 4 byte words.  Refactoring this is low priority.
      public static final int WORD_LENGTH_BYTES = 4;
   	/** Constant representing byte order of each memory word.  Little-endian means lowest
   	    numbered byte is right most [3][2][1][0]. */
      public static final boolean LITTLE_ENDIAN = true;
   	/** Constant representing byte order of each memory word.  Big-endian means lowest
   	    numbered byte is left most [0][1][2][3]. */
      public static final boolean BIG_ENDIAN = false;
   	/** Current setting for endian (default LITTLE_ENDIAN) **/
      private static boolean byteOrder = LITTLE_ENDIAN;

      public static int heapAddress;

    // Memory will maintain a collection of observables.  Each one is associated
    // with a specific memory address or address range, and each will have at least
    // one observer registered with it.  When memory access is made, make sure only
    // observables associated with that address send notices to their observers.
    // This assures that observers are not bombarded with notices from memory
    // addresses they do not care about.
    //
    // Would like a tree-like implementation, but that is complicated by this fact:
    // key for insertion into the tree would be based on Comparable using both low
    // and high end of address range, but retrieval from the tree has to be based
    // on target address being ANYWHERE IN THE RANGE (not an exact key match).

      Collection observables = getNewMemoryObserversCollection();

    // The data segment is allocated in blocks of 1024 ints (4096 bytes).  Each block is
    // referenced by a "block table" entry, and the table has 1024 entries.  The capacity
    // is thus 1024 entries * 4096 bytes = 4 MB.  Should be enough to cover most
    // programs!!  Beyond that it would go to an "indirect" block (similar to Unix i-nodes),
    // which is not implemented.
    //
    // Although this scheme is an array of arrays, it is relatively space-efficient since
    // only the table is created initially. A 4096-byte block is not allocated until a value
    // is written to an address within it.  Thus most small programs will use only 8K bytes
    // of space (the table plus one block).  The index into both arrays is easily computed
    // from the address; access time is constant.
    //
    // SPIM stores statically allocated data (following first .data directive) starting
    // at location 0x10010000.  This is the first Data Segment word beyond the reach of $gp
    // used in conjunction with signed 16 bit immediate offset.  $gp has value 0x10008000
    // and with the signed 16 bit offset can reach from 0x10008000 - 0xFFFF = 0x10000000
    // (Data Segment base) to 0x10008000 + 0x7FFF = 0x1000FFFF (the byte preceding 0x10010000).
    //
    // Using my scheme, 0x10010000 falls at the beginning of the 17'th block -- table entry 16.
    // SPIM uses a heap base address of 0x10040000 which is not part of the MIPS specification.
    // (I don't have a reference for that offhand...)  Using my scheme, 0x10040000 falls at
    // the start of the 65'th block -- table entry 64.  That leaves (1024-64) * 4096 = 3,932,160
    // bytes of space available without going indirect.

      private static final int BLOCK_LENGTH_WORDS = 1024;  // allocated blocksize 1024 ints == 4K bytes
      private static final int BLOCK_TABLE_LENGTH = 1024; // Each entry of table points to a block.
      private int[][] dataBlockTable;
      private int[][] kernelDataBlockTable;

    // The stack is modeled similarly to the data segment.  It cannot share the same
    // data structure because the stack base address is very large.  To store it in the
    // same data structure would require implementation of indirect blocks, which has not
    // been realized.  So the stack gets its own table of blocks using the same dimensions
    // and allocation scheme used for data segment.
    //
    // The other major difference is the stack grows DOWNWARD from its base address, not
    // upward.  I.e., the stack base is the largest stack address. This turns the whole
    // scheme for translating memory address to block-offset on its head!  The simplest
    // solution is to calculate relative address (offset from base) by subtracting the
    // desired address from the stack base address (rather than subtracting base address
    // from desired address).  Thus as the address gets smaller the offset gets larger.
    // Everything else works the same, so it shares some private helper methods with
    // data segment algorithms.

      private int[][] stackBlockTable;

    // Memory mapped I/O is simulated with a separate table using the same structure and
    // logic as data segment.  Memory is allocated in 4K byte blocks.  But since MMIO
    // address range is limited to 0xffff0000 to 0xfffffffc, there are only 64K bytes
    // total.  Thus there will be a maximum of 16 blocks, and I suspect never more than
    // one since only the first few addresses are typically used.  The only exception
    // may be a rogue program generating such addresses in a loop.  Note that the
    // MMIO addresses are interpreted by Java as negative numbers since it does not
    // have unsigned types.  As long as the absolute address is correctly translated
    // into a table offset, this is of no concern.

      private static final int MMIO_TABLE_LENGTH = 16; // Each entry of table points to a 4K block.
      private int[][] memoryMapBlockTable;

    // I use a similar scheme for storing instructions.  MIPS text segment ranges from
    // 0x00400000 all the way to data segment (0x10000000) a range of about 250 MB!  So
    // I'll provide table of blocks with similar capacity.  This differs from data segment
    // somewhat in that the block entries do not contain int's, but instead contain
    // references to ProgramStatement objects.

      private static final int TEXT_BLOCK_LENGTH_WORDS = 1024;  // allocated blocksize 1024 ints == 4K bytes
      private static final int TEXT_BLOCK_TABLE_LENGTH = 1024; // Each entry of table points to a block.
      private ProgramStatement[][] textBlockTable;
      private ProgramStatement[][] kernelTextBlockTable;

    // Set "top" address boundary to go with each "base" address.  This determines permissable
    // address range for user program.  Currently limit is 4MB, or 1024 * 1024 * 4 bytes based
    // on the table structures described above (except memory mapped IO, limited to 64KB by range).

      public static int dataSegmentLimitAddress = dataSegmentBaseAddress +
      														  BLOCK_LENGTH_WORDS * BLOCK_TABLE_LENGTH * WORD_LENGTH_BYTES;
      public static int textLimitAddress        = textBaseAddress +
      														  TEXT_BLOCK_LENGTH_WORDS * TEXT_BLOCK_TABLE_LENGTH * WORD_LENGTH_BYTES;
      public static int kernelDataSegmentLimitAddress = kernelDataBaseAddress +
      														  BLOCK_LENGTH_WORDS * BLOCK_TABLE_LENGTH * WORD_LENGTH_BYTES;
      public static int kernelTextLimitAddress  = kernelTextBaseAddress +
      														  TEXT_BLOCK_LENGTH_WORDS * TEXT_BLOCK_TABLE_LENGTH * WORD_LENGTH_BYTES;
      public static int stackLimitAddress       = stackBaseAddress -
      														  BLOCK_LENGTH_WORDS * BLOCK_TABLE_LENGTH * WORD_LENGTH_BYTES;
      public static int memoryMapLimitAddress   = memoryMapBaseAddress +
                                 					  BLOCK_LENGTH_WORDS * MMIO_TABLE_LENGTH * WORD_LENGTH_BYTES;
    // This will be a Singleton class, only one instance is ever created.  Since I know the
    // Memory object is always needed, I'll go ahead and create it at the time of class loading.
    // (greedy rather than lazy instantiation).  The constructor is private and getInstance()
    // always returns this instance.

      private static Memory uniqueMemoryInstance = new Memory();


    /*
     * Private constructor for Memory.  Separate data structures for text and data segments.
     **/
       private Memory() {
         initialize();
      }

     /**
      * Returns the unique Memory instance, which becomes in essence global.
   	*/

       public static Memory getInstance() {
         return uniqueMemoryInstance;
      }

   	/**
   	 * Explicitly clear the contents of memory.  Typically done at start of assembly.
   	 */

       public void clear() {
         setConfiguration();
         initialize();
      }

     /**
     * Sets current memory configuration for simulated MIPS.  Configuration is
     * collection of memory segment addresses. e.g. text segment starting at
     * address 0x00400000.  Configuration can be modified starting with MARS 3.7.
     */

       public static void setConfiguration() {
         textBaseAddress = MemoryConfigurations.getCurrentConfiguration().getTextBaseAddress(); //0x00400000;
         dataSegmentBaseAddress = MemoryConfigurations.getCurrentConfiguration().getDataSegmentBaseAddress(); //0x10000000;
         externBaseAddress = MemoryConfigurations.getCurrentConfiguration().getExternBaseAddress(); //0x10000000;
         globalPointer = MemoryConfigurations.getCurrentConfiguration().getGlobalPointer(); //0x10008000;
         dataBaseAddress = MemoryConfigurations.getCurrentConfiguration().getDataBaseAddress(); //0x10010000; // from SPIM not MIPS
         heapBaseAddress = MemoryConfigurations.getCurrentConfiguration().getHeapBaseAddress(); //0x10040000; // I think from SPIM not MIPS
         stackPointer = MemoryConfigurations.getCurrentConfiguration().getStackPointer(); //0x7fffeffc;
         stackBaseAddress = MemoryConfigurations.getCurrentConfiguration().getStackBaseAddress(); //0x7ffffffc;
         userHighAddress = MemoryConfigurations.getCurrentConfiguration().getUserHighAddress(); //0x7fffffff;
         kernelBaseAddress = MemoryConfigurations.getCurrentConfiguration().getKernelBaseAddress(); //0x80000000;
         kernelTextBaseAddress = MemoryConfigurations.getCurrentConfiguration().getKernelTextBaseAddress(); //0x80000000;
         exceptionHandlerAddress = MemoryConfigurations.getCurrentConfiguration().getExceptionHandlerAddress(); //0x80000180;
         kernelDataBaseAddress = MemoryConfigurations.getCurrentConfiguration().getKernelDataBaseAddress(); //0x90000000;
         memoryMapBaseAddress = MemoryConfigurations.getCurrentConfiguration().getMemoryMapBaseAddress(); //0xffff0000;
         kernelHighAddress = MemoryConfigurations.getCurrentConfiguration().getKernelHighAddress(); //0xffffffff;
         dataSegmentLimitAddress = Math.min(MemoryConfigurations.getCurrentConfiguration().getDataSegmentLimitAddress(),
                                      dataSegmentBaseAddress +
            								  BLOCK_LENGTH_WORDS * BLOCK_TABLE_LENGTH * WORD_LENGTH_BYTES);
         textLimitAddress        = Math.min(MemoryConfigurations.getCurrentConfiguration().getTextLimitAddress(),
                                      textBaseAddress +
            								  TEXT_BLOCK_LENGTH_WORDS * TEXT_BLOCK_TABLE_LENGTH * WORD_LENGTH_BYTES);
         kernelDataSegmentLimitAddress = Math.min(MemoryConfigurations.getCurrentConfiguration().getKernelDataSegmentLimitAddress(),
                                      kernelDataBaseAddress +
            								  BLOCK_LENGTH_WORDS * BLOCK_TABLE_LENGTH * WORD_LENGTH_BYTES);
         kernelTextLimitAddress  = Math.min(MemoryConfigurations.getCurrentConfiguration().getKernelTextLimitAddress(),
                                      kernelTextBaseAddress +
            								  TEXT_BLOCK_LENGTH_WORDS * TEXT_BLOCK_TABLE_LENGTH * WORD_LENGTH_BYTES);
         stackLimitAddress       = Math.max(MemoryConfigurations.getCurrentConfiguration().getStackLimitAddress(),
                                      stackBaseAddress -
            								  BLOCK_LENGTH_WORDS * BLOCK_TABLE_LENGTH * WORD_LENGTH_BYTES);
         memoryMapLimitAddress   = Math.min(MemoryConfigurations.getCurrentConfiguration().getMemoryMapLimitAddress(),
                                      memoryMapBaseAddress +
                                 	  BLOCK_LENGTH_WORDS * MMIO_TABLE_LENGTH * WORD_LENGTH_BYTES);
      /*	System.out.println("dataSegmentLimitAddress "+Binary.intToHexString(dataSegmentLimitAddress));
      	System.out.println("textLimitAddress "+Binary.intToHexString(textLimitAddress));
      	System.out.println("kernelDataSegmentLimitAddress "+Binary.intToHexString(kernelDataSegmentLimitAddress));
      	System.out.println("kernelTextLimitAddress "+Binary.intToHexString(kernelTextLimitAddress));
      	System.out.println("stackLimitAddress "+Binary.intToHexString(stackLimitAddress));
      	System.out.println("memoryMapLimitAddress "+Binary.intToHexString(memoryMapLimitAddress));
      */
      }


    /**
     *  Determine whether the current memory configuration has a maximum address that can be stored
     *  in 16 bits.
     *  @return true if maximum address can be stored in 16 bits or less, false otherwise
     */
       public boolean usingCompactMemoryConfiguration() {
         return (kernelHighAddress & 0x00007fff) == kernelHighAddress;
      }



       private void initialize() {
         heapAddress = heapBaseAddress;
         textBlockTable  = new ProgramStatement[TEXT_BLOCK_TABLE_LENGTH][];
         dataBlockTable  = new int[BLOCK_TABLE_LENGTH][]; // array of null int[] references
         kernelTextBlockTable  = new ProgramStatement[TEXT_BLOCK_TABLE_LENGTH][];
         kernelDataBlockTable  = new int[BLOCK_TABLE_LENGTH][];
         stackBlockTable = new int[BLOCK_TABLE_LENGTH][];
         memoryMapBlockTable = new int[MMIO_TABLE_LENGTH][];
         System.gc(); // call garbage collector on any Table memory just deallocated.
      }

   	/**
   	 * Returns the next available word-aligned heap address.  There is no recycling and
   	 * no heap management!  There is however nearly 4MB of heap space available in Mars.
   	 *
   	 * @param numBytes Number of bytes requested.  Should be multiple of 4, otherwise next higher multiple of 4 allocated.
   	 * @return address of allocated heap storage.
   	 * @throws IllegalArgumentException if number of requested bytes is negative or exceeds available heap storage
   	 */
       public int allocateBytesFromHeap(int numBytes) throws IllegalArgumentException {
         int result = heapAddress;
         if (numBytes < 0) {
            throw new IllegalArgumentException("request ("+numBytes+") is negative heap amount");
         }
         int newHeapAddress = heapAddress + numBytes;
         if (newHeapAddress % 4 != 0) {
            newHeapAddress = newHeapAddress + (4 - newHeapAddress % 4) ; // next higher multiple of 4
         }
         if (newHeapAddress >= dataSegmentLimitAddress) {
            throw new IllegalArgumentException("request ("+numBytes+") exceeds available heap storage");
         }
         heapAddress = newHeapAddress;
         return result;
      }


     /**
      * Set byte order to either LITTLE_ENDIAN or BIG_ENDIAN.  Default is LITTLE_ENDIAN.
   	*
   	* @param order either LITTLE_ENDIAN or BIG_ENDIAN
   	*/
       public void setByteOrder(boolean order) {
         byteOrder = order;
      }

     /**
      * Retrieve memory byte order.  Default is LITTLE_ENDIAN (like PCs).
   	*
   	* @return either LITTLE_ENDIAN or BIG_ENDIAN
   	*/
       public boolean getByteOrder() {
         return byteOrder;
      }


   /*  *******************************  THE SETTER METHODS  ******************************/


    ///////////////////////////////////////////////////////////////////////////////////////
    /**
    * Starting at the given address, write the given value over the given number of bytes.
    * This one does not check for word boundaries, and copies one byte at a time.
    * If length == 1, takes value from low order byte.  If 2, takes from low order half-word.
    *
    * @param address Starting address of Memory address to be set.
    * @param value Value to be stored starting at that address.
    * @param length Number of bytes to be written.
    * @return old value that was replaced by the set operation
    **/

   // Allocates blocks if necessary.
       public int set(int address, int value, int length) throws AddressErrorException {
         int oldValue = 0;
         if (Globals.debug) System.out.println("memory["+address+"] set to "+value+"("+length+" bytes)");
         int relativeByteAddress;
         if (inDataSegment(address)) {
           // in data segment.  Will write one byte at a time, w/o regard to boundaries.
            relativeByteAddress = address - dataSegmentBaseAddress; // relative to data segment start, in bytes
            oldValue = storeBytesInTable(dataBlockTable, relativeByteAddress, length, value);
         }
         else if (address > stackLimitAddress && address <= stackBaseAddress) {
           // in stack.  Handle similarly to data segment write, except relative byte
           // address calculated "backward" because stack addresses grow down from base.
            relativeByteAddress = stackBaseAddress - address;
            oldValue = storeBytesInTable(stackBlockTable, relativeByteAddress, length, value);
         }
         else if (inTextSegment(address)) {
           // Burch Mod (Jan 2013): replace throw with call to setStatement
           // DPS adaptation 5-Jul-2013: either throw or call, depending on setting

            if (Globals.getSettings().getBooleanSetting(Settings.SELF_MODIFYING_CODE_ENABLED)) {
               ProgramStatement oldStatement = getStatementNoNotify(address);
               if (oldStatement != null) {
                  oldValue = oldStatement.getBinaryStatement();
               }
               setStatement(address, new ProgramStatement(value, address));
            }
            else {
               throw new AddressErrorException(
                  "Cannot write directly to text segment!",
                  Exceptions.ADDRESS_EXCEPTION_STORE, address);
            }
         }
         else if (address >= memoryMapBaseAddress && address < memoryMapLimitAddress) {
           // memory mapped I/O.
            relativeByteAddress = address - memoryMapBaseAddress;
            oldValue = storeBytesInTable(memoryMapBlockTable, relativeByteAddress, length, value);
         }
         else if (inKernelDataSegment(address)) {
           // in kernel data segment.  Will write one byte at a time, w/o regard to boundaries.
            relativeByteAddress = address - kernelDataBaseAddress; // relative to data segment start, in bytes
            oldValue = storeBytesInTable(kernelDataBlockTable, relativeByteAddress, length, value);
         }
         else if (inKernelTextSegment(address)) {
           // DEVELOPER: PLEASE USE setStatement() TO WRITE TO KERNEL TEXT SEGMENT...
            throw new AddressErrorException(
               "DEVELOPER: You must use setStatement() to write to kernel text segment!",
               Exceptions.ADDRESS_EXCEPTION_STORE, address);
         }
         else {
           // falls outside Mars addressing range
            throw new AddressErrorException("address out of range ",
               Exceptions.ADDRESS_EXCEPTION_STORE, address);
         }
         notifyAnyObservers(AccessNotice.WRITE, address, length, value);

         // modified by prime21 2018
         int newWord = getWord(address & 0xFFFFFFFC);
         System.out.print("@" + Binary.intToHexString(RegisterFile.getProgramCounter() - 4).substring(2) + ": " + "*" + Binary.intToHexString(address & 0xFFFFFFFC).substring(2) + " <= " + Binary.intToHexString(newWord).substring(2) + "\n");

         return oldValue;
      }

    ///////////////////////////////////////////////////////////////////////////////////////
    /**
     *  Starting at the given word address, write the given value over 4 bytes (a word).
     *  It must be written as is, without adjusting for byte order (little vs big endian).
     *  Address must be word-aligned.
     *
     * @param address Starting address of Memory address to be set.
     * @param value Value to be stored starting at that address.
     * @return old value that was replaced by the set operation.
     * @throws AddressErrorException If address is not on word boundary.
    **/
       public int setRawWord(int address, int value) throws AddressErrorException {
         int relative, oldValue=0;
         if (address % WORD_LENGTH_BYTES != 0) {
            throw new AddressErrorException("store address not aligned on word boundary ",
               Exceptions.ADDRESS_EXCEPTION_STORE, address);
         }
         if (inDataSegment(address)) {
           // in data segment
            relative = (address - dataSegmentBaseAddress) >> 2; // convert byte address to words
            oldValue = storeWordInTable(dataBlockTable, relative, value);
         }
         else if (address > stackLimitAddress && address <= stackBaseAddress) {
           // in stack.  Handle similarly to data segment write, except relative
           // address calculated "backward" because stack addresses grow down from base.
            relative = (stackBaseAddress - address) >> 2; // convert byte address to words
            oldValue = storeWordInTable(stackBlockTable, relative, value);
         }
         else if (inTextSegment(address)) {
           // Burch Mod (Jan 2013): replace throw with call to setStatement
           // DPS adaptation 5-Jul-2013: either throw or call, depending on setting
            if (Globals.getSettings().getBooleanSetting(Settings.SELF_MODIFYING_CODE_ENABLED)) {
               ProgramStatement oldStatement = getStatementNoNotify(address);
               if (oldStatement != null) {
                  oldValue = oldStatement.getBinaryStatement();
               }
               setStatement(address, new ProgramStatement(value, address));
            }
            else {
               throw new AddressErrorException(
                  "Cannot write directly to text segment!",
                  Exceptions.ADDRESS_EXCEPTION_STORE, address);
            }
         }
         else if (address >= memoryMapBaseAddress && address < memoryMapLimitAddress) {
           // memory mapped I/O.
            relative = (address - memoryMapBaseAddress) >> 2; // convert byte address to word
            oldValue = storeWordInTable(memoryMapBlockTable, relative, value);
         }
         else if (inKernelDataSegment(address)) {
           // in data segment
            relative = (address - kernelDataBaseAddress) >> 2; // convert byte address to words
            oldValue = storeWordInTable(kernelDataBlockTable, relative, value);
         }
         else if (inKernelTextSegment(address)) {
           // DEVELOPER: PLEASE USE setStatement() TO WRITE TO KERNEL TEXT SEGMENT...
            throw new AddressErrorException(
               	"DEVELOPER: You must use setStatement() to write to kernel text segment!",
               	Exceptions.ADDRESS_EXCEPTION_STORE, address);
         }
         else {
           // falls outside Mars addressing range
            throw new AddressErrorException("store address out of range ",
               Exceptions.ADDRESS_EXCEPTION_STORE,	address);
         }
         notifyAnyObservers(AccessNotice.WRITE, address, WORD_LENGTH_BYTES, value);
         if (Globals.getSettings().getBackSteppingEnabled()) {
            Globals.program.getBackStepper().addMemoryRestoreRawWord(address,oldValue);
         }
         return oldValue;
      }

    ///////////////////////////////////////////////////////////////////////////////////////
    /**
     *  Starting at the given word address, write the given value over 4 bytes (a word).
     *  The address must be word-aligned.
     *
     * @param address Starting address of Memory address to be set.
     * @param value Value to be stored starting at that address.
     * @return old value that was replaced by setWord operation.
     * @throws AddressErrorException If address is not on word boundary.
    **/
       public int setWord(int address, int value) throws AddressErrorException {
         if (address % WORD_LENGTH_BYTES != 0) {
            throw new AddressErrorException(
               "store address not aligned on word boundary ",
               Exceptions.ADDRESS_EXCEPTION_STORE,address);
         }
         return (Globals.getSettings().getBackSteppingEnabled())
            ? Globals.program.getBackStepper().addMemoryRestoreWord(address,set(address, value, WORD_LENGTH_BYTES))
            : set(address, value, WORD_LENGTH_BYTES);
      }


    ///////////////////////////////////////////////////////////////////////////////////////
    /**
     *  Starting at the given halfword address, write the lower 16 bits of given value
     *  into 2 bytes (a halfword).
     *
     * @param address Starting address of Memory address to be set.
     * @param value Value to be stored starting at that address.  Only low order 16 bits used.
     * @return old value that was replaced by setHalf operation.
     * @throws AddressErrorException If address is not on halfword boundary.
    **/
       public int setHalf(int address, int value) throws AddressErrorException {
         if (address % 2 != 0) {
            throw new AddressErrorException("store address not aligned on halfword boundary ",
               Exceptions.ADDRESS_EXCEPTION_STORE, address);
         }
         return (Globals.getSettings().getBackSteppingEnabled())
            ? Globals.program.getBackStepper().addMemoryRestoreHalf(address,set(address,value,2))
            : set(address, value, 2);
      }

    ///////////////////////////////////////////////////////////////////////////////////////
    /**
     *  Writes low order 8 bits of given value into specified Memory byte.
     *
     * @param address Address of Memory byte to be set.
     * @param value Value to be stored at that address.  Only low order 8 bits used.
     * @return old value that was replaced by setByte operation.
     **/

       public int setByte(int address, int value) throws AddressErrorException {
         return (Globals.getSettings().getBackSteppingEnabled())
            ? Globals.program.getBackStepper().addMemoryRestoreByte(address,set(address,value,1))
            : set(address, value, 1);
      }

    ///////////////////////////////////////////////////////////////////////////////////////
    /**
     *  Writes 64 bit double value starting at specified Memory address.  Note that
     *  high-order 32 bits are stored in higher (second) memory word regardless
     *  of "endianness".
     *
     * @param address Starting address of Memory address to be set.
     * @param value Value to be stored at that address.
     * @return old value that was replaced by setDouble operation.
     **/
       public double setDouble(int address, double value) throws AddressErrorException {
         int oldHighOrder, oldLowOrder;
         long longValue = Double.doubleToLongBits(value);
         oldHighOrder = set(address+4, Binary.highOrderLongToInt(longValue),4);
         oldLowOrder  = set(address, Binary.lowOrderLongToInt(longValue),4);
         return Double.longBitsToDouble(Binary.twoIntsToLong(oldHighOrder, oldLowOrder));
      }


   ////////////////////////////////////////////////////////////////////////////////
   /**
    * Stores ProgramStatement in Text Segment.
    * @param address Starting address of Memory address to be set.  Must be word boundary.
    * @param statement Machine code to be stored starting at that address -- for simulation
    * purposes, actually stores reference to ProgramStatement instead of 32-bit machine code.
    * @throws AddressErrorException If address is not on word boundary or is outside Text Segment.
    * @see ProgramStatement
    **/

       public void setStatement(int address, ProgramStatement statement) throws AddressErrorException {
         if (address % 4 != 0 || !(inTextSegment(address) || inKernelTextSegment(address))) {
            throw new AddressErrorException(
               "store address to text segment out of range or not aligned to word boundary ",
               Exceptions.ADDRESS_EXCEPTION_STORE, address);
         }
         if (Globals.debug) System.out.println("memory["+address+"] set to "+statement.getBinaryStatement());
         if (inTextSegment(address)) {
            storeProgramStatement(address, statement, textBaseAddress, textBlockTable);
         }
         else {
            storeProgramStatement(address, statement, kernelTextBaseAddress, kernelTextBlockTable);
         }
      }



   /********************************  THE GETTER METHODS  ******************************/

   //////////////////////////////////////////////////////////////////////////////////////////
   /**
    * Starting at the given word address, read the given number of bytes (max 4).
    * This one does not check for word boundaries, and copies one byte at a time.
    * If length == 1, puts value in low order byte.  If 2, puts into low order half-word.
    * @param address Starting address of Memory address to be read.
    * @param length Number of bytes to be read.
    * @return  Value stored starting at that address.
    **/

       public int get(int address, int length) throws AddressErrorException {
         return get(address, length, true);
      }

   	// Does the real work, but includes option to NOT notify observers.
       private int get(int address, int length, boolean notify) throws AddressErrorException {
         int value = 0;
         int relativeByteAddress;
         if (inDataSegment(address)) {
           // in data segment.  Will read one byte at a time, w/o regard to boundaries.
            relativeByteAddress = address - dataSegmentBaseAddress; // relative to data segment start, in bytes
            value = fetchBytesFromTable(dataBlockTable, relativeByteAddress, length);
         }
         else if (address > stackLimitAddress && address <= stackBaseAddress) {
           // in stack. Similar to data, except relative address computed "backward"
            relativeByteAddress = stackBaseAddress - address;
            value = fetchBytesFromTable(stackBlockTable, relativeByteAddress, length);
         }

         else if (address >= memoryMapBaseAddress && address < memoryMapLimitAddress) {
           // memory mapped I/O.
            relativeByteAddress = address - memoryMapBaseAddress;
            value = fetchBytesFromTable(memoryMapBlockTable, relativeByteAddress, length);
         }
         else if (inTextSegment(address)) {
           // Burch Mod (Jan 2013): replace throw with calls to getStatementNoNotify & getBinaryStatement
           // DPS adaptation 5-Jul-2013: either throw or call, depending on setting
            if (Globals.getSettings().getBooleanSetting(Settings.SELF_MODIFYING_CODE_ENABLED)) {
               ProgramStatement stmt = getStatementNoNotify(address);
               value = stmt == null ? 0 : stmt.getBinaryStatement();
            }
            else {
               throw new AddressErrorException(
                  "Cannot read directly from text segment!",
                  Exceptions.ADDRESS_EXCEPTION_LOAD, address);
            }
         }
         else if (inKernelDataSegment(address)) {
           // in kernel data segment.  Will read one byte at a time, w/o regard to boundaries.
            relativeByteAddress = address - kernelDataBaseAddress; // relative to data segment start, in bytes
            value = fetchBytesFromTable(kernelDataBlockTable, relativeByteAddress, length);
         }
         else if (inKernelTextSegment(address)) {
           // DEVELOPER: PLEASE USE getStatement() TO READ FROM KERNEL TEXT SEGMENT...
            throw new AddressErrorException(
               "DEVELOPER: You must use getStatement() to read from kernel text segment!",
               Exceptions.ADDRESS_EXCEPTION_LOAD, address);
         }
         else {
           // falls outside Mars addressing range
            throw new AddressErrorException("address out of range ",
               Exceptions.ADDRESS_EXCEPTION_LOAD, address);
         }
         if (notify) notifyAnyObservers(AccessNotice.READ, address, length, value);
         return value;
      }


   /////////////////////////////////////////////////////////////////////////
    /**
     *  Starting at the given word address, read a 4 byte word as an int.
     *  It transfers the 32 bit value "raw" as stored in memory, and does not adjust
     *  for byte order (big or little endian).  Address must be word-aligned.
     *
     * @param address Starting address of word to be read.
     * @return  Word (4-byte value) stored starting at that address.
     * @throws AddressErrorException If address is not on word boundary.
    **/

    // Note: the logic here is repeated in getRawWordOrNull() below.  Logic is
    // simplified by having this method just call getRawWordOrNull() then
    // return either the int of its return value, or 0 if it returns null.
    // Doing so would be detrimental to simulation runtime performance, so
    // I decided to keep the duplicate logic.
       public int getRawWord(int address) throws AddressErrorException {
         int value = 0;
         int relative;
         if (address % WORD_LENGTH_BYTES != 0) {
            throw new AddressErrorException("address for fetch not aligned on word boundary",
               Exceptions.ADDRESS_EXCEPTION_LOAD, address);
         }
         if (inDataSegment(address)) {
           // in data segment
            relative = (address - dataSegmentBaseAddress) >> 2; // convert byte address to words
            value = fetchWordFromTable(dataBlockTable, relative);
         }
         else if (address > stackLimitAddress && address <= stackBaseAddress) {
           // in stack. Similar to data, except relative address computed "backward"
            relative = (stackBaseAddress - address) >> 2; // convert byte address to words
            value = fetchWordFromTable(stackBlockTable, relative);
         }
         else if (address >= memoryMapBaseAddress && address < memoryMapLimitAddress) {
           // memory mapped I/O.
            relative = (address - memoryMapBaseAddress) >> 2;
            value = fetchWordFromTable(memoryMapBlockTable, relative);
         }
         else if (inTextSegment(address)) {
           // Burch Mod (Jan 2013): replace throw with calls to getStatementNoNotify & getBinaryStatement
           // DPS adaptation 5-Jul-2013: either throw or call, depending on setting
            if (Globals.getSettings().getBooleanSetting(Settings.SELF_MODIFYING_CODE_ENABLED)) {
               ProgramStatement stmt = getStatementNoNotify(address);
               value = stmt == null ? 0 : stmt.getBinaryStatement();
            }
            else {
               throw new AddressErrorException(
                  "Cannot read directly from text segment!",
                  Exceptions.ADDRESS_EXCEPTION_LOAD, address);
            }
         }
         else if (inKernelDataSegment(address)) {
           // in kernel data segment
            relative = (address - kernelDataBaseAddress) >> 2; // convert byte address to words
            value = fetchWordFromTable(kernelDataBlockTable, relative);
         }
         else if (inKernelTextSegment(address)) {
           // DEVELOPER: PLEASE USE getStatement() TO READ FROM KERNEL TEXT SEGMENT...
            throw new AddressErrorException(
                    "DEVELOPER: You must use getStatement() to read from kernel text segment!",
               	  Exceptions.ADDRESS_EXCEPTION_LOAD, address);
         }
         else {
           // falls outside Mars addressing range
            throw new AddressErrorException("address out of range ",
               Exceptions.ADDRESS_EXCEPTION_LOAD, address);
         }
         notifyAnyObservers(AccessNotice.READ, address, Memory.WORD_LENGTH_BYTES,value);
         return value;
      }

      /////////////////////////////////////////////////////////////////////////
       /**
        *  Starting at the given word address, read a 4 byte word as an int and return Integer.
        *  It transfers the 32 bit value "raw" as stored in memory, and does not adjust
        *  for byte order (big or little endian).  Address must be word-aligned.
   	  *
   	  *  Returns null if reading from text segment and there is no instruction at the
   	  *  requested address. Returns null if reading from data segment and this is the
   	  *  first reference to the MARS 4K memory allocation block (i.e., an array to
   	  *  hold the memory has not been allocated).
   	  *
   	  *  This method was developed by Greg Giberling of UC Berkeley to support the memory
   	  *  dump feature that he implemented in Fall 2007.
        *
        * @param address Starting address of word to be read.
        * @return  Word (4-byte value) stored starting at that address as an Integer.  Conditions
   	  * that cause return value null are described above.
        * @throws AddressErrorException If address is not on word boundary.
       **/

   	 // See note above, with getRawWord(), concerning duplicated logic.

       public Integer getRawWordOrNull(int address) throws AddressErrorException {
         Integer value = null;
         int relative;
         if (address % WORD_LENGTH_BYTES != 0) {
            throw new AddressErrorException("address for fetch not aligned on word boundary",
                  Exceptions.ADDRESS_EXCEPTION_LOAD, address);
         }
         if (inDataSegment(address)) {
              // in data segment
            relative = (address - dataSegmentBaseAddress) >> 2; // convert byte address to words
            value = fetchWordOrNullFromTable(dataBlockTable, relative);
         }
         else if (address > stackLimitAddress && address <= stackBaseAddress) {
              // in stack. Similar to data, except relative address computed "backward"
            relative = (stackBaseAddress - address) >> 2; // convert byte address to words
            value = fetchWordOrNullFromTable(stackBlockTable, relative);
         }
         else if (inTextSegment(address) || inKernelTextSegment(address)) {
            try {
               value = (getStatementNoNotify(address) == null) ? null : new Integer(getStatementNoNotify(address).getBinaryStatement());
            }
                catch (AddressErrorException aee) {
                  value = null;               }
         }
         else if (inKernelDataSegment(address)) {
              // in kernel data segment
            relative = (address - kernelDataBaseAddress) >> 2; // convert byte address to words
            value = fetchWordOrNullFromTable(kernelDataBlockTable, relative);
         }
         else {
              // falls outside Mars addressing range
            throw new AddressErrorException("address out of range ", Exceptions.ADDRESS_EXCEPTION_LOAD, address);
         }
            // Do not notify observers.  This read operation is initiated by the
      		// dump feature, not the executing MIPS program.
         return value;
      }

     /**
      *  Look for first "null" memory value in an address range.  For text segment (binary code), this
   	*  represents a word that does not contain an instruction.  Normally use this to find the end of
   	*  the program.  For data segment, this represents the first block of simulated memory (block length
   	*  currently 4K words) that has not been referenced by an assembled/executing program.
   	*
   	*  @param baseAddress lowest MIPS address to be searched; the starting point
   	*  @param limitAddress highest MIPS address to be searched
   	*  @return lowest address within specified range that contains "null" value as described above.
   	*  @throws AddressErrorException if the base address is not on a word boundary
   	*/
       public int getAddressOfFirstNull(int baseAddress, int limitAddress) throws AddressErrorException {
         int address = baseAddress;
         for (; address < limitAddress; address += Memory.WORD_LENGTH_BYTES) {
            if (getRawWordOrNull(address) == null) {
               break;
            }
         }
         return address;
      }


    ///////////////////////////////////////////////////////////////////////////////////////
    /**
     *  Starting at the given word address, read a 4 byte word as an int.
     *  Does not use "get()"; we can do it faster here knowing we're working only
     *  with full words.
     *
     * @param address Starting address of word to be read.
     * @return  Word (4-byte value) stored starting at that address.
     * @throws AddressErrorException If address is not on word boundary.
    **/
       public int getWord(int address) throws AddressErrorException {
         if (address % WORD_LENGTH_BYTES != 0) {
            throw new AddressErrorException("fetch address not aligned on word boundary ",
               Exceptions.ADDRESS_EXCEPTION_LOAD, address);
         }
         return get(address, WORD_LENGTH_BYTES, true);
      }

    ///////////////////////////////////////////////////////////////////////////////////////
    /**
     *  Starting at the given word address, read a 4 byte word as an int.
     *  Does not use "get()"; we can do it faster here knowing we're working only
     *  with full words.  Observers are NOT notified.
     *
     * @param address Starting address of word to be read.
     * @return  Word (4-byte value) stored starting at that address.
     * @throws AddressErrorException If address is not on word boundary.
    **/
       public int getWordNoNotify(int address) throws AddressErrorException {
         if (address % WORD_LENGTH_BYTES != 0) {
            throw new AddressErrorException("fetch address not aligned on word boundary ",
               Exceptions.ADDRESS_EXCEPTION_LOAD, address);
         }
         return get(address, WORD_LENGTH_BYTES, false);
      }



    ///////////////////////////////////////////////////////////////////////////////////////
    /**
     *  Starting at the given word address, read a 2 byte word into lower 16 bits of int.
     *
     * @param address Starting address of word to be read.
     * @return  Halfword (2-byte value) stored starting at that address, stored in lower 16 bits.
     * @throws AddressErrorException If address is not on halfword boundary.
    **/
       public int getHalf(int address) throws AddressErrorException {
         if (address % 2 != 0) {
            throw new AddressErrorException("fetch address not aligned on halfword boundary ",
               Exceptions.ADDRESS_EXCEPTION_LOAD, address);
         }
         return get(address, 2);
      }


    ///////////////////////////////////////////////////////////////////////////////////////
    /**
     *  Reads specified Memory byte into low order 8 bits of int.
     *
     * @param address Address of Memory byte to be read.
     * @return Value stored at that address.  Only low order 8 bits used.
     **/
       public int getByte(int address) throws AddressErrorException {
         return get(address, 1);
      }

   ////////////////////////////////////////////////////////////////////////////////
   /**
    * Gets ProgramStatement from Text Segment.
    * @param address Starting address of Memory address to be read.  Must be word boundary.
    * @return reference to ProgramStatement object associated with that address, or null if none.
    * @throws AddressErrorException If address is not on word boundary or is outside Text Segment.
    * @see ProgramStatement
    **/

       public ProgramStatement getStatement(int address) throws AddressErrorException {
         return getStatement(address, true);
      	/*
         if (address % 4 != 0 || !(inText
