*=============================== ALTER TABLE ==================================
   
    ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS islemleri icin
    kullanilir.
   
    ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de
    kullanilir.
  
==============================================================================*/

CREATE TABLE personel 
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20),
        CONSTRAINT personel_pk PRIMARY KEY (id)
    );


    INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
    
    SELECT
        *
    FROM personel;
    
    Alter table personel
    add ulke_isim varchar2(20) default 'Turkiye';
    
    alter table personel
    add (cinsiyet varchar2(20) ,yas number(3));
    
    
    alter table personel
    drop COLUMN yas;
    
    Alter table personel
    rename COLUMN ulke_isim TO ulke_adi;
    
    Alter table personel
    RENAME to isciler;

    select * from isciler;    
    
    
    DELETE FROM isciler WHERE isim='Veli Sahin';
    
    
    Alter table isciler
    modify ulke_adi VARCHAR2(30) NOT NULL;
    
    ALTER TABLE isciler
    MODIFY isim char(100);
    
    
	