/*======================================================================================
               
    NOT NULL - Bir S�tunun  NULL i�ermemesini garanti eder. 

    UNIQUE - Bir s�tundaki t�m de�erlerin BENZERS�Z olmas�n� garanti eder.  

    PRIMARY KEY - Bir s�t�n�n NULL i�ermemesini ve s�tundaki verilerin 
                  BENZERS�Z olmas�n� garanti eder.(NOT NULL ve UNIQUE birle�imi gibi)

    FOREIGN KEY - Ba�ka bir tablodaki Primary Key�i referans g�stermek i�in kullan�l�r. 
                  B�ylelikle, tablolar aras�nda ili�ki kurulmu� olur. 

    CHECK - Bir sutundaki t�m verilerin belirlenen �zel bir �art� sa�lamas�n� garanti eder. 

    DEFAULT - Herhangi bir de�er atanamad���nda Ba�lang�� de�erinin atanmas�n� sa�lar.
 ========================================================================================*/
    CREATE TABLE calisanlar
    (
        id CHAR(5) PRIMARY KEY,
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
    INSERT INTO calisanlar VALUES( '10002', 'Mehmet Y�lmaz' ,12000, '14-04-18');
    INSERT INTO calisanlar VALUES('10003', '', 5000, '14-04-18');
    INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '14-04-18');
    INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14-04-18'); 
    INSERT INTO calisanlar VALUES('10006', 'Canan Ya�', NULL, '12-04-19');
    
    SELECT * FROM calisanlar;
    
    DROP TABLE calisanlar;
    
    DELETE calisanlar
    WHERE id='10001';
    
    
    
    
    ----------------------------------------------
    -- alternatif prmiary tan�mlama y�ntemi
    
    CREATE TABLE calisanlar
    (
        id CHAR(5), 
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE,
        CONSTRAINT id_pk PRIMARY KEY(id) 
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
    INSERT INTO calisanlar VALUES( '10002', 'Mehmet Y�lmaz' ,12000, '14-04-18');
    INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '14-04-18');
    
      
    CREATE TABLE adresler
    (
        adres_id CHAR(5),     -- REFERENCES calisanlar(id),
        sokak VARCHAR2(50),
        cadde VARCHAR2(30),
        sehir VARCHAR2(15),
        CONSTRAINT id_fk FOREIGN KEY(adres_id) REFERENCES calisanlar(id) 
    );
    
    INSERT INTO adresler VALUES('10001','Mutlu Sok', '40.Cad.','IST');
    INSERT INTO adresler VALUES('10001','Can Sok', '50.Cad.','Ankara');
    INSERT INTO adresler VALUES('10002','A�a Sok', '30.Cad.','Antep');
    INSERT INTO adresler VALUES('','A�a Sok', '30.Cad.','Antep');
    INSERT INTO adresler VALUES('','A�a Sok', '30.Cad.','Antep');
    
    -- Parent ta olmatyan bir id ye chiled da ekleme yap�lamz.
   -- INSERT INTO adresler VALUES('10004','Gel Sok', '60.Cad.','Van');
    
    SELECT * FROM adresler;
    SELECT * FROM calisanlar;
    
    SELECT * FROM calisanlar,  adresler
    WHERE id = '10001'; 
    
    DROP TABLE calisanlar;
    DROP TABLE adresler;
    
    
    
    /*1) CHECK ile bir alana girilebilecek degerleri sinirlayabiliriz.
Ornegin yas sutuna negatif sayi girilmesinin engellenmesi gibi.
2) DEFAULT kisitlamasi ile de veri girisi sirasinda bos birakilan kisimlara null girilmesi yerine belirledigimiz
bir degerin girilmesi saglanabilir. 
-- Bos birakildigi zaman SQL diyor ki burasi doldurulacak demek ki ben buraya default atamayayim der.
-- AMA parcali giris yaparsak bos birakilan yerler DEFAULT yerlerle doldurulur. (Not : Create asamasinda 
Default deger atamazsak SQL'in default'u NULL'dur)
    */
    
CREATE TABLE sehirler(
alan_kodu NUMBER(3)DEFAULT 00,
isim VARCHAR2(20) DEFAULT 'nonname',
nufus NUMBER(8) CHECK(nufus>0)
);
 INSERT INTO sehirler VALUES(67,'zonguldak',680123);
  INSERT INTO sehirler VALUES(78   ,'karabuk',450004);
  
  
  SELECT
      *
  FROM sehirler;
  
  INSERT INTO sehirler (isim) VALUES ('ankara');
    INSERT INTO sehirler (nufus) VALUES (15000);
  
 DROP TABLE sehirler;
  