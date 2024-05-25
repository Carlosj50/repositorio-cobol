//*lIMPIA REGISTRO DEL LOG DEL MAIIN FRAMA OS/390
//IFCDIP00 JOB CLASS=A,MSGLEVEL=(1,1),MSGCLASS=X,NOTIFY=&SYSUID       
//********************************************************************
//* CLEAR AND INITIALIZE HARDWARE EVENT RECORDER DATASET             *
//********************************************************************
//IFCDIP00 EXEC PGM=IFCDIP00                                          
//SERERDS  DD  DSN=SYS1.LOGREC,DISP=OLD,                              
//             VOL=SER=OS39M1,                                        
//             UNIT=3390                                              