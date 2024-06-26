//COMPIMAP JOB CARLOS,'CARLOS GONZALEZ',NOTIFY=&SYSUID, 
//          MSGCLASS=Q,CLASS=A,MSGLEVEL=(1,1),REGION=0M,TIME=(0,7) 
//*================================================================
//* HACER:    C XXXXXX (NOMBRE FUENTE MAPA) 
//*           Y SALIR CON:  CAN
//*================================================================
//* 
//*            COMPILA MAPA BMS 
//* 
//COMPIL  EXEC PGM=ASMA90,REGION=2000K,PARM='SYSPARM(MAP)'         
//SYSLIB   DD  DSN=CICSTS13.CICS.SDFHMAC,DISP=SHR
//         DD  DSN=SYS1.MACLIB,DISP=SHR
//SYSUT1   DD  SPACE=(1700,(999,999)),UNIT=SYSDA
//SYSUT2   DD  SPACE=(1700,(300,50)),UNIT=SYSDA
//SYSUT3   DD  SPACE=(1700,(300,50)),UNIT=SYSDA
//SYSLIN   DD  DSN=&&LOADSET,DISP=(MOD,PASS),UNIT=SYSDA,
//             SPACE=(800,(500,500))
//SYSIN    DD  DSN=CARLOS.CICS.MAPS(XXXXXX),DISP=SHR
//SYSPRINT DD  SYSOUT=* 
//SYSUDUMP DD  SYSOUT=*
//*
//*            LINKEDITA SI COMPILACION 
//*            DA COD. RETORNO MENOR O IGUAL A 4
//* 
//LKED    EXEC PGM=IEWL,PARM='LIST,XREF,LET',REGION=2000K, 
//             COND=(4,LT,COMPIL) 
//SYSLIN   DD  DSN=&&LOADSET,DISP=(OLD,DELETE) 
//         DD  DDNAME=SYSIN 
//SYSLMOD  DD  DISP=SHR,DSN=CARLOS.CICS.LOAD(XXXXXX)
//SYSUT1   DD  SPACE=(1024,(50,50)),UNIT=SYSDA 
//SYSPRINT DD  SYSOUT=* 
//SYSUDUMP DD  SYSOUT=* 
//* 
//*            GENERA LA COPY DEL MAPA (SIMBOLICA) 
//* 
//ASMDSECT EXEC PGM=ASMA90,REGION=2000K, 
//  PARM='SYSPARM(A.DSECT),DECK,NOOBJECT'
//SYSPRINT DD SYSOUT=* 
//SYSLIB   DD DSN=CICSTS13.CICS.SDFHMAC,DISP=SHR
//         DD DSN=SYS1.MACLIB,DISP=SHR 
//SYSUT1   DD UNIT=SYSDA,SPACE=(TRK,(5,5))
//SYSUT2   DD UNIT=SYSDA,SPACE=(TRK,(5,5))
//SYSUT3   DD UNIT=SYSDA,SPACE=(TRK,(5,5))
//SYSPUNCH DD DSN=CARLOS.CICS.SOURCE(XXXXXXCP),DISP=SHR
//SYSIN    DD DSN=CARLOS.CICS.MAPS(XXXXXX),DISP=SHR
