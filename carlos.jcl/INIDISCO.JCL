//* INICIA Y FORMATEA DISCOS EN MAINFRAME OS/390
//INIDISCO JOB CARLOS,JOSE,CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1),   
//             NOTIFY=&SYSUID,REGION=0M                         
//PASO0001   EXEC   PGM=ICKDSF,PARM=NOREPLYU                    
//SYSPRINT DD    SYSOUT=*                                       
 INIT UNITADDRESS(0A8D) NOVERIFY VOLID(ZVOL01) OWNER(IBMUSER) - 
     VTOC(0,1,15)                                               
/*                                                              