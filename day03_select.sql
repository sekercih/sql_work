                    
                    CREATE TABLE ogrenciler
                    (
                    id NUMBER(9),
                    isim VARCHAR2(50),
                    adres VARCHAR2(100),
                    sinav_notu NUMBER(3)
                    );
                    
                    
                    
                    
                    
                    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
                    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
                    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
                    
                    SELECT isim,sinav_notu
                    FROM ogrenciler
                    WHERE sinav_notu<80;
                    
                    CREATE TABLE personel
                        (   
                            id CHAR(5),
                            isim VARCHAR2(50),
                            maas NUMBER(5)
                        );
                    
                        INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
                        INSERT INTO personel VALUES( '10002', 'Mehmet Y�lmaz' ,12000);
                        INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
                        INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
                        INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
                        INSERT INTO personel VALUES('10006', 'Ay�e Can', 4000);
                        
                        DROP TABLE personel;
                    
                        SELECT * FROM personel;
                    
                    
                    SELECT 
                        *
                    FROM personel
                    WHERE id>='10002' AND id<='10005';
                    
                    
                    SELECT
                        *
                    FROM personel
                    
                    WHERE isim BETWEEN 'Mehmet Y�lmaz'  AND 'Veli Han'
                    ORDER BY maas;
                    
                    SELECT
                        *
                    FROM personel
                    WHERE id not BETWEEN '10002' AND '10004';
                    
                    SELECT
                        *
                    FROM personel
                    WHERE id  ='10001' OR id= '10002' OR id=10004;
        
        
        SELECT
                        *
                    FROM personel
                    WHERE id  IN('10001','10002','10004');
        
        
            SELECT * FROM personel;
        SELECT
                        *
                    FROM personel
                    WHERE maas  IN(7000,12000);
                    
     SELECT
         *
     FROM personel
     WHERE isim LIKE 'A%';
     
     SELECT
         *
     FROM personel
     WHERE isim LIKE '%an%';
     
     SELECT
         *
     FROM personel
     WHERE maas NOT LIKE 5000;
     
                    SELECT
                        *
                    FROM personel
                    WHERE isim LIKE '________';
                    
                    SELECT
                        *
                    FROM personel
                    WHERE isim LIKE  '_e%';
                    
                    
                     SELECT
                        *
                    FROM personel
                    WHERE maas LIKE  '%00';
                    
                    SELECT
                        *
                    FROM personel
                    WHERE isim LIKE  'A_____A%';
                    
                              
                    SELECT
                        *
                    FROM personel
                    WHERE isim   LIKE  '%an%';
                    
                   
/* ======================= SELECT - REGEXP_LIKE ================================
    Daha karma��k pattern ile sorgulama i�lemi i�in REGEXP_LIKE kullan�labilir.  

    Syntax:
    --------
    REGEXP_LIKE(sutun_ad�, �pattern[] �, �c� ] ) 
            
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
    
    SELECT * FROM kelimeler;
    
    -- i�erisinde 'hi' harfleri ge�en kelimeleri sorgulayn�z.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    -- i�erisinde herhangi bir yerde h veya i bulunan kelimeler
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]');
    
    --i�erisinde ot veya at harfleri olan kelimeleri sorgulay�n�z.
    -- veya ilemi | karakteri ile yap�l�r. 
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
    
    -- hi veya ho ile ba�layan kelimeleri sorgulay�n�z.
    -- Ba�lama i�in ^ karakteri kullan�l�r.
    SELECT * FROM  kelimeler
    WHERE REGEXP_LIKE(kelime, '^hi|^ho','i');
    
    -- t veya m ile biten kelimeleri B�y�k-K���k harf duyars�z �ekilde listeyeniz.
    --biti� i�in $ ilareti kullan�l�r.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'t$|m$','i');
    
    -- h ile ba�lay�p t ile biten 3 harfli kelimeleri b�y�k-k���k harfe 
    -- dikkat etmeksizin listeleyeniz.
    -- - (tire) karakteri bir aral�k verir.
    -- k��eli parantez tek bir karakter g�sterir.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[a-z0-9]t','i');
    
    -- �lk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
    -- kelimelerin t�m bilgilerini sorgulayal�m.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[ai]t','i');
    
    -- ��inde m veya i veya e olan kelimelerin t�m bilgilerini listeleyiniz.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'h[mie](*)');
    
    
    -- i�erisinde en az 2 adet oo bar�nd�ran kelimelerin t�m bilgilerini 
    -- listeleyiniz.
    
    -- {2}
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[o]{2}','i'); 
  
    SELECT  *  FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[a]{3}','i'); 