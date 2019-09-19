#include<stdio.h>
#include<string.h>
int main()
{char s1[2000][100],s2[2000][100],s[100];
int i,n1=0,n2=0;
FILE *in1,*in2;
in1=fopen("cpu.txt","r");
while(fgets(s1[n1],100,in1)!=NULL)
	n1++;
in2=fopen("mars.txt","r");
while(fgets(s2[n2],100,in2)!=NULL)
	n2++;
for(i=0;i<n1||i<n2;i++)
	{if(strstr(s1[i],s2[i]))
	     { printf("match %s",s2[i]);
		  continue;}
	 else
		{printf("!!!wrong!!!%s",s1[i]);
	    }
	}
return 0;
}
