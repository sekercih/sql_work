--Konu ozeti
 /*
===========================================================
                        DAY01                  
============================================================


Kullanici olusturma*/

ALTER SESSION SET "_ORACLE_SCRIPT"=true; 
CREATE USER murat_cakir IDENTIFIED BY "1234";
GRANT CONNECT TO murat_cakir;
GRANT ALL PRIVILEGES TO murat_cakir; 
/* ========================================================= 
                        TABLO OLUÞTURMA  (CRUD - Create)                  
============================================================*/
CREATE TABLE student 
(   
    std_id VARCHAR(4),
    std_name VARCHAR(20),
    std_age NUMBER
);
/* ========================================================= 
                     VERÝ GÝRÝÞÝ 
===========================================================*/
INSERT INTO student VALUES('1001', 'MEHMET ALÝ', 25);
INSERT INTO student VALUES('1002', 'AYÞE YILMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR', 56);
INSERT INTO student VALUES('1004', 'MARY BROWN', 17);
/* ========================================================= 
                    PARÇALI VERÝ GÝRÝÞÝ 
===========================================================*/
-- NOT: Veri giriþi yapýlmayan deðiþkenlere NULL atanýr.
INSERT INTO student(std_id,std_name) VALUES('1005','MUSTAFA KARAR');
/* ========================================================= 
                    TABLODAN VERÝ SORGULAMA  (CRUD - Read)  
===========================================================*/
SELECT * FROM student;
/* ========================================================= 
                    TABLO SÝLME  (CRUD - Drop )
===========================================================*/
DROP TABLE student;
/*========================================================= 
                         CRUD ÖRNEK  
 ===========================================================
             
 Veritabanýmýzda urunler adýnda bir Tablo oluþturalým.
 urun_id  => NUMBER
 urun_adý => VARCHAR2(50)
 fiyat => NUMBER(5,2)
 tett => DATE,      
 stok_adedi => NUMBER(10)  
 Tabloya, Ürün giriþi yapalým.
        Örneðin CÝPS, KOLA, AYRAN, BÝSKÜVÝ,  
 (100, ‘CÝPS’, 5.50, ‘01-05-2022’, 500)
 Verilerimizi çekelim.
 ===========================================================*/
 /* ===========================================================*/




/*
===========================================================
                        DAY02                  
============================================================
 */
/*======================= CONSTRAINTS - KISITLAMALAR ======================================
               
    NOT NULL - Bir Sütunun  NULL içermemesini garanti eder. 
    UNIQUE - Bir sütundaki tüm deðerlerin BENZERSÝZ olmasýný garanti eder.  
    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
                  BENZERSÝZ olmasýný garanti eder.(NOT NULL ve UNIQUE birleþimi gibi)
    FOREIGN KEY - Baþka bir tablodaki Primary Key’i referans göstermek için kullanýlýr. 
                  Böylelikle, tablolar arasýnda iliþki kurulmuþ olur. 
    CHECK - Bir sutundaki tüm verilerin belirlenen özel bir þartý saðlamasýný garanti eder. 
    DEFAULT - Herhangi bir deðer atanamadýðýnda Baþlangýç deðerinin atanmasýný saðlar.
 ========================================================================================*/
   
----------------------------------------------------------------
-- KISITLAMALAR (ORNEK1 - PRIMARY KEY)
----------------------------------------------------------------
   
    CREATE TABLE calisanlar
    (
        id CHAR(5) PRIMARY KEY,
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
    INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yýlmaz' ,12000, '14-04-18');
    INSERT INTO calisanlar VALUES('10003', '', 5000, '14-04-18');
    INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '14-04-18');
    INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14-04-18'); 
    INSERT INTO calisanlar VALUES('10006', 'Canan Yaþ', NULL, '12-04-19');
    
    SELECT * FROM calisanlar;
    
    DROP TABLE calisanlar;
    
    -- 10001 id'li calisani silme (Ýleride bu konuyu göreceðiz).
    DELETE calisanlar
    WHERE id='10001';
----------------------------------------------------------------
-- KISITLAMALAR (ORNEK2 - PRIMARY KEY ALTERNATÝF YÖNTEM)
----------------------------------------------------------------
-- Bu yöntemde Kýsýtlamaya istediðimiz ismi atayabiliriz 
-- ve DISABLE komutuyla istediðimizde pasif hale getirebiliriz. 
    
    CREATE TABLE calisanlar
    (
        id CHAR(5), 
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE,
        CONSTRAINT id_pk PRIMARY KEY(id) --DISABLE
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
    INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yýlmaz' ,12000, '14-04-18');
    INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '14-04-18');
----------------------------------------------------------------
-- KISITLAMALAR (ORNEK3 - FOREIGN KEY)
----------------------------------------------------------------
      
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
    INSERT INTO adresler VALUES('10002','Aða Sok', '30.Cad.','Antep');
    -- FK'ye null deðeri atanabilir. 
    INSERT INTO adresler VALUES('','Aða Sok', '30.Cad.','Antep');
    INSERT INTO adresler VALUES('','Aða Sok', '30.Cad.','Antep');
    -- Parent tabloda olmayan bir id ile ekleme yapýlamaz.
    INSERT INTO adresler VALUES('10004','Gel Sok', '60.Cad.','Van');
    
    SELECT * FROM adresler;
    SELECT * FROM calisanlar;
    
    -- Child tablo silinmeden parent tablo silinemez.
    DROP TABLE calisanlar;
    DROP TABLE adresler;
    
    -- FK ile birleþtirilen tablolardaki tüm verileri çekmek için 
    -- JOIN Ýþlemi yapmak gerekir. Bu konuyu sonra göreceðiz.
    SELECT * FROM calisanlar, adresler WHERE calisanlar.id = adresler.adres_id;



--===========================================================
     --                 DAY04                  
--============================================================





/* ============================== UPDATE SET ===================================    
    
   Aþaðýdaki gibi tedarikciler adýnda bir tablo oluþturunuz ve vergi_no
   sutununu primary key yapýnýz. Ayrýca aþaðýdaki verileri tabloya giriniz.
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonrasýnda aþaðýdaki gibi urunler adýnda bir baþka tablo oluþturunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutunu
    iliþkilendiriniz. Verileri giriniz.
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');
    
==============================================================================*/  
    CREATE TABLE tedarikciler
    (
        vergi_no NUMBER(3),
        firma_ismi VARCHAR2(50),
        irtibat_ismi VARCHAR2(50),
        CONSTRAINT pk_ted PRIMARY KEY (vergi_no)
    ); 
    
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    
    CREATE TABLE urunler
    (
        ted_vergino NUMBER(3), 
        urun_id NUMBER(11), 
        urun_isim VARCHAR2(50), 
        musteri_isim VARCHAR2(50),
        CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no) 
    );    
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
    -- SYNTAX
    ----------
    -- UPDATE tablo_adý
    -- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
    -- WHERE koþul;
      
/* -----------------------------------------------------------------------------
  ORNEK1: vergi_no’su 101 olan tedarikcinin ismini 'LG' olarak güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
 
    UPDATE tedarikciler
    SET firma_ismi = 'LG'
    WHERE vergi_no = 101;
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
/* -----------------------------------------------------------------------------
  ORNEK2: Tedarikciler tablosundak tüm firma isimlerini 'Samsung' olarak 
  güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
    UPDATE tedarikciler
    SET firma_ismi = 'SAMSUNG';
    
    -- Tablonun içeriðini siler..
    DELETE FROM tedarikciler;  -- DROP TABLE tabloyu siler.
    
/* -----------------------------------------------------------------------------
  ORNEK3: vergi_no’su 102 olan tedarikcinin ismini 'Samsung' ve irtibat_ismi’ni 
  'Ali Veli' olarak güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
    
    UPDATE tedarikciler
    SET firma_ismi = 'Samsung', irtibat_ismi =' Ali Veli'
    WHERE vergi_no = 102;
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
/* -----------------------------------------------------------------------------
  ORNEK4: firma_ismi Samsung olan tedarikcinin irtibat_ismini 'Ayþe Yýlmaz' 
  olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/ 
    UPDATE tedarikciler
    SET irtibat_ismi = 'Ayse Yilmaz'
    WHERE firma_ismi = 'Samsung';
    
/* -----------------------------------------------------------------------------
  ORNEK5: urunler tablosundaki 'Phone' deðerlerini Telefon olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/
    UPDATE urunler
    SET urun_isim='Telefon'
    WHERE urun_isim='Phone';
 
/* -----------------------------------------------------------------------------
  ORNEK6: urunler tablosundaki urun_id deðeri 1004'ten büyük olanlarýn urun_id
  deðerlerini bir arttýrýnýz
 -----------------------------------------------------------------------------*/ 
     UPDATE urunler
     SET urun_id = urun_id + 1
     WHERE urun_id > 1004 ;
  
 /* ----------------------------------------------------------------------------
  ORNEK7: urunler tablosundaki tüm ürünlerin urun_id deðerini ted_vergino 
  sutun deðerleri ile toplayarak güncelleyiniz.
 -----------------------------------------------------------------------------*/  
    UPDATE urunler
    SET urun_id = urun_id + ted_vergino;
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    
/*-----------------------------------------------------------------------------
 ORNEK8: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci 
 tablosunda irtibat_ismi 'Adam Eve' olan firmanýn ismi (firma_ismi) ile 
 degistiriniz.
 -----------------------------------------------------------------------------*/
    UPDATE urunler
    SET urun_isim = (SELECT firma_ismi FROM tedarikciler 
                     WHERE irtibat_ismi = 'Adam Eve')
    WHERE musteri_isim = 'Ali Bak';
  
/*------------------------------------------------------------------------------
 ORNEK9: Laptop satin alan musterilerin ismini, Apple’in irtibat_isim'i ile 
 degistirin
 -----------------------------------------------------------------------------*/
    UPDATE urunler
    SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler
                        WHERE firma_ismi ='Apple')
    WHERE urun_isim = 'Laptop';

--===========================================================
   --                     DAY03                  
--============================================================
 
/* ======================= SELECT - WHERE ==================================*/
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );    CREATE TABLE ogrenciler
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        adres VARCHAR2(100),
        sinav_notu NUMBER(3)
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
    
    SELECT * FROM ogrenciler;
    
/* ============================================================================
   Verileri SELECT komutu ile veritabanýndan çekerken filtreleme yapmak için 
   
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanýlabilir. 
   
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adý
WHERE koþul;
==============================================================================*/
  
/* -----------------------------------------------------------------------------
  ORNEK1: Sýnav notu 80'den büyük olan öðrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/  
    SELECT * FROM ogrenciler 
    WHERE sinav_notu>80;
    
    -- notu 80 den büyük olanlarýn sadece isim ve not bilgilerini listeleme
    SELECT isim,sinav_notu
    FROM ogrenciler 
    WHERE sinav_notu>80;
    
 /* -----------------------------------------------------------------------------
  ORNEK2: Adresi Ankara olan öðrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM ogrenciler
    WHERE adres = 'Ankara';
    
    
 /* ----------------------------------------------------------------------------
  ORNEK3: id'si 124 olan öðrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
    SELECT * FROM ogrenciler
    WHERE id = 124;
    
            
/* ======================= SELECT - BETWEEN ==================================*/ 
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yýlmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayþe Can', 4000);
    SELECT * FROM personel;
    
    -- NOT:BETWEEN iki mantýksal ifade ile tanýmlayabileceðimiz durumlarý 
    -- tek komutla yazabilme imkâný verir. Yazdýðýmýz 2 sýnýr da aralýða dahildir.
    
/*============================================================================*/
   
/* -----------------------------------------------------------------------------
  ORNEK4: id'si 10002 ile 10005 arasýnda olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
    --1.Yöntem (AND) 
    SELECT * FROM personel
    WHERE id>='10002' AND id <='10005'; 
    
   --2.Yöntem (BETWEEN)
    SELECT id, isim,maas 
    FROM personel
    WHERE id BETWEEN '10002' AND '10005'; -- ALT VE ÜST LÝMÝTLER DAHÝLDÝR.
    
     
/* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yýlmaz ile Veli Han arasýndaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
   
    SELECT * FROM  personel
    WHERE isim BETWEEN 'Mehmet Yýlmaz' AND 'Veli Han';
    
/* -----------------------------------------------------------------------------
  ORNEK6: id’si 10002 - 10004 arasýnda olmayan personelin bilgilerini listele
-------------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE id NOT BETWEEN '10002' AND '10004';
    
              
/* ======================= SELECT - IN ======================================
    IN birden fazla mantýksal ifade ile tanýmlayabileceðimiz durumlarý 
    tek komutla yazabilme imkâný verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adý
    WHERE sutun_adý IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
    --1.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id = 10001 OR id = 10002 OR id = 10004;
    
     --2.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id IN(10001, 10002, 10004);   
    
/* -----------------------------------------------------------------------------
  ORNEK8: Maaþý sadece 7000  ve 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas IN(7000,12000);
    
/* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak saðlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adý
WHERE sütunN LIKE pattern
    
    PATTERN ÝÇÝN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir. 
    _    ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK9:  ismi A harfi ile baþlayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE isim LIKE 'A%';
/* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '%n';
 /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanlarý listeleyiniz
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE isim LIKE '_e%';
/* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diðer harflerinde y olanlarý listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '_e%y%';
/* -----------------------------------------------------------------------------
  ORNEK13:  ismi A ile baþlamayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';
/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';
/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%a%';
 /* -----------------------------------------------------------------------------
  ORNEK16:  maaþýnýn son 2 hanesi 00 olmayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE '%00';
/* -----------------------------------------------------------------------------
  ORNEK17:  maaþýnýn 4000 olmayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE 4000;
    
 /* -----------------------------------------------------------------------------
  ORNEK18: maaþý 5 haneli olanlarý listeleyiniz
 -----------------------------------------------------------------------------*/     
    SELECT * FROM personel
    WHERE maas LIKE '_____';
    
  /* -----------------------------------------------------------------------------
  ORNEK19: maaþýnýn  5 haneli olmayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas NOT LIKE '_____';
      
/* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan perspneli listeleyiniz.
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE isim LIKE 'A_____a%';
    
       
/* ======================= SELECT - REGEXP_LIKE ================================
    Daha karmaþýk pattern ile sorgulama iþlemi için REGEXP_LIKE kullanýlabilir.  
    Syntax:
    --------
    REGEXP_LIKE(sutun_adý, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    
    DROP TABLE kelimeler;
   
/* -----------------------------------------------------------------------------
  ORNEK21: Ýçerisinde 'hi' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, 'hi');
    
/* -----------------------------------------------------------------------------
  ORNEK22: Ýçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
    -- VEYA iþlemi için | karakteri kullanýlýr.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, 'at|ot');
   
/* -----------------------------------------------------------------------------
  ORNEK23: Ýçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
     -- 'c' => case-sentisitive demektir ve default case-sensitive aktiftir.
     -- 'i' => incase-sentisitive demektir.
   
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, 'at|ot', 'i');    
   
 /* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile baþlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Baþlangýcý göstermek için ^ karakteri kullanýlýr.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, '^hi|^ho', 'i');   
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Bitiþi göstermek için $ karakteri kullanýlýr.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, 't$|m$', 'i');   
/* -----------------------------------------------------------------------------
  ORNEK26: h ile baþlayýp t ile biten 3 harfli kelimeleri büyük-küçük harfe 
  dikkat etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]t');   
/* -----------------------------------------------------------------------------
  ORNEK27: Ýlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalým.
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[ai]t');
/* -----------------------------------------------------------------------------
  ORNEK28: Ýçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/     
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[mie](*)');
 
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile baþlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^[as]');
/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo barýdýran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 
    SELECT *  FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[o]{2}');