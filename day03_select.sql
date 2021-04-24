                    
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
                        INSERT INTO personel VALUES( '10002', 'Mehmet Yýlmaz' ,12000);
                        INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
                        INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
                        INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
                        INSERT INTO personel VALUES('10006', 'Ayþe Can', 4000);
                        
                        DROP TABLE personel;
                    
                        SELECT * FROM personel;
                    
                    
                    SELECT 
                        *
                    FROM personel
                    WHERE id>='10002' AND id<='10005';
                    
                    
                    SELECT
                        *
                    FROM personel
                    
                    WHERE isim BETWEEN 'Mehmet Yýlmaz'  AND 'Veli Han'
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
    
    SELECT * FROM kelimeler;
    
    -- içerisinde 'hi' harfleri geçen kelimeleri sorgulaynýz.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    -- içerisinde herhangi bir yerde h veya i bulunan kelimeler
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]');
    
    --içerisinde ot veya at harfleri olan kelimeleri sorgulayýnýz.
    -- veya ilemi | karakteri ile yapýlýr. 
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
    
    -- hi veya ho ile baþlayan kelimeleri sorgulayýnýz.
    -- Baþlama için ^ karakteri kullanýlýr.
    SELECT * FROM  kelimeler
    WHERE REGEXP_LIKE(kelime, '^hi|^ho','i');
    
    -- t veya m ile biten kelimeleri Büyük-Küçük harf duyarsýz þekilde listeyeniz.
    --bitiþ için $ ilareti kullanýlýr.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'t$|m$','i');
    
    -- h ile baþlayýp t ile biten 3 harfli kelimeleri büyük-küçük harfe 
    -- dikkat etmeksizin listeleyeniz.
    -- - (tire) karakteri bir aralýk verir.
    -- köþeli parantez tek bir karakter gösterir.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[a-z0-9]t','i');
    
    -- Ýlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
    -- kelimelerin tüm bilgilerini sorgulayalým.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[ai]t','i');
    
    -- Ýçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'h[mie](*)');
    
    
    -- içerisinde en az 2 adet oo barýndýran kelimelerin tüm bilgilerini 
    -- listeleyiniz.
    
    -- {2}
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[o]{2}','i'); 
  
    SELECT  *  FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[a]{3}','i'); 