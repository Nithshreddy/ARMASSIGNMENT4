AREA appcode,CODE,READONLY
    EXPORT __main
		ENTRY 
		;main logic here is looping the ith term (-1)^(i+1) * x^i /i
		;log(1+x) =summation of((-1)^(i+1) * x^i /i) from i =0 to i = n
__main  FUNCTION
          MOV R1,#10;n value (no of iterations)
          MOV R0,#0 ;i value (present iteration)
          VLDR.F32 S0,=0.25;sum of all the terms till its iteration
          VLDR.F32 S1,=0.25;Ti
          VLDR.F32 S2,=0.25;x value(-1<x<1)
          VLDR.F32 S3,=1;for incrementing
          VLDR.F32 S4,=-1;multiplication factor
          VLDR.F32 S5,=1 ;i value (i=0)
exp       CMP R1,R0;Compare 'n' and 'i'
          BLE exp1;if i < n goto exp1
          B STOP;else goto stop
exp1      VMUL.F32 S1,S1,S2;t = t*x
          VMUL.F32 S1,S1,S4;t=-1*t*x
          VADD.F32 S5,S5,S3;i=i+1
          VDIV.F32 S7,S3,S5;k=1/i+1
          VFMA.F32 S0,S1,S7;sum=sum+(-t*x*i)/(i+1)
          ADD R0,#1 ;adding i after every iteration
          B exp
STOP      B STOP  ; stop program
     ENDFUNC
	 END
