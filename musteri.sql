 CREATE TABLE CUSTOMERS
    (
        id CHAR(5) PRIMARY KEY ,
        CUSTOMERNAME VARCHAR2(100) ,
          CITY VARCHAR2(50) ,
             DISTRICT varchar(50),
             BIRTHDATE TIMESTAMP(3),
                   GENDER varchar(10)
                  
    );
INSERT INTO CUSTOMERS(id,CUSTOMERNAME,CITY,DISTRICT,BIRTHDATE,GENDER) VALUES ('1001','Volkan �EK�P','Bart�n','Kuruca�ile','1997-10-24 00:00:00.000','E');,
INSERT INTO CUSTOMERS(id,CUSTOMERNAME,CITY,DISTRICT,BIRTHDATE,GENDER) VALUES (''1002','Serhat G�NDO�AN','Rize','Pazar / Rize','1966-02-03 00:00:00.000','E')
INSERT INTO CUSTOMERS(CUSTOMERNAME,CITY,DISTRICT,BIRTHDATE,GENDER) VALUES ('Irmak TAHS�NO�LU','Erzincan','�ay�rl�','1940-06-23 00:00:00.000','K');
                                                                                                                                                                                                                    --DD/MM/RRRR HH24:MI:SSXFF
                                                                                                                                                                                                                    --YYYY-MM-DD HH24:MI:SSXFF
DROP TABLE CUSTOMERS;

    select * from
    customers;




