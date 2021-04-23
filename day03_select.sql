                    
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
                    
                    
        