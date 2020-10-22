AREA log,CODE,READONLY
    EXPORT __main
		ENTRY 
__main  FUNCTION
          MOV R0,#100;(i value)
          MOV R1,#0
          VLDR.F32 S0,=0;Holding the sum of series elements 's'
          VLDR.F32 S1,=0.75;Temp Variable to hold the intermediate series elements 't'
          VLDR.F32 S2,=0.75;Holding 'x' Value(to converge x<1)
          VLDR.F32 S3,=1;addition faactor
          VLDR.F32 S4,=-1;multiplication factor
          VLDR.F32 S5,=0 ;i value (i=0)
exp      CMP R1,R0;Compare 'i' and 'n'
          BLE exp1;if i < n goto LOOP
          B stop;else goto stop
exp1      VMUL.F32 S1,S1,S2;t = t*x
          VMUL.F32 S1,S1,S4;t=-1*t*x
          VADD.F32 S6,S5,S3;i=i+1
          VDIV.F32 S7,S6,S5;k=i/i+1
          VFMA.F32 S0,S1,S7;sum=sum+(-t*x*i)/(i+1)
          VADD.F32 S5,S5,S3;i=i+1
          SUB R0,#1
          B exp
stop    B stop                          ; stop program
     ENDFUNC
	 END