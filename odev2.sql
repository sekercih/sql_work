CREATE TABLE calisanlar
 (
 id CHAR(4),
 isim VARCHAR2(50),
 maas NUMBER(5),
 CONSTRAINT id_pk PRIMARY KEY (id)
 );
 INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000);
 INSERT INTO calisanlar VALUES( '1002', 'Mehmet Yýlmaz' ,12000);
 INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
 INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);
 
 CREATE TABLE aileler
 (
 id CHAR(4),
 cocuk_sayisi VARCHAR2(50),
 ek_gelir NUMBER(5),
 CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
 );
 
 INSERT INTO aileler VALUES('1001', 4, 2000);
 INSERT INTO aileler VALUES('1002', 2, 1500);
 INSERT INTO aileler VALUES('1003', 1, 2200);
 INSERT INTO aileler VALUES('1004', 3, 2400);
 
 SELECT * FROM calisanlar;
 
 SELECT *  FROM aileler;
 
/*) Veli Han'ýn maaþýna %20 zam yapacak update komutunu yazýnýz.
Güncellemeden sonra calisanlar tablosu aþaðýda görüldüðü gibi olmalýdýr.*/
 
 UPDATE calisanlar SET maas =maas*1.20
 WHERE isim='Veli Han';
 /*Maaþý ortalamanýn altýnda olan çalýþanlarýn maaþýna %20 zam yapýnýz.
Komut sonrasý görünüm aþaðýdaki gibidir*/
 
 SELECT * FROM calisanlar;
SELECT * FROM aileler;
 UPDATE calisanlar set maas=maas*1.20
  where maas<( SELECT  ROUND(AVG(maas)) as ortalama FROM calisanlar);
 
 /*4-) Çalýþanlarýn isim ve cocuk_sayisi'ni listeleyen bir sorgu yazýnýz. Komut 
sonrasý görünüm aþaðýdaki gibidir.*/

SELECT isim,(SELECT cocuk_sayisi From aileler
               where id=calisanlar.id) cocuk_sayisi
FROM calisanlar;

/*5-) calisanlar' ýn id, isim ve toplam_gelir'lerini gösteren bir sorgu yazýnýz. 
 toplam_gelir = calisanlar.maas + aileler.ek_gelir */
  SELECT id,isim,(SELECT Sum(calisanlar.maas+ek_gelir)From aileler Where id=calisanlar.id )as toplamGelir
  From calisanlar;
 
/*6-) Eðer bir ailenin kiþi baþý geliri 2000 TL den daha az ise o çalýþanýn
 -- maaþýna ek %10 aile yardým zammý yapýnýz. 
 -- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)*/
 

 UPDATE calisanlar SET maas = maas*1.10
WHERE 2000>  (Select (SELECT Sum(calisanlar.maas+ek_gelir)From aileler Where id=calisanlar.id )/((Select cocuk_sayisi from aileler Where id=calisanlar.id)+2) as ortalamagelir
From calisanlar);

UPDATE calisanlar
SET maas=maas*1.10
WHERE 2000>((SELECT (ek_gelir+maas)/(cocuk_sayisi+2) FROM aileler  WHERE calisanlar.id=aileler.id));

 SELECT * FROM calisanlar;
 
(( SELECT  (ek_gelir+maas)/(cocuk_sayisi+2)  FROM aileler  WHERE calisanlar.id=aileler.id));



Select id,(SELECT Sum(calisanlar.maas+ek_gelir)From aileler Where id=calisanlar.id )/((Select cocuk_sayisi from aileler Where id=calisanlar.id)+2) as ortalamagelir
From calisanlar;
  






 
 Select id, (Select cocuk_sayisi from aileler Where id=calisanlar.id)as cocuklar from calisanlar;
 
 
 SELECT isim, (Select Sum(calisanlar.maas+ek_gelir)From aileler Where id=aileler.id) toplam 
from calisanlar;

Select isim,(SELECT Sum(calisanlar.maas+ek_gelir)From aileler Where id=calisanlar.id )as toplamGelir
From calisanlar;
 
 
 



 SELECT * FROM calisanlar;
SELECT * FROM aileler;


 
 
 
 