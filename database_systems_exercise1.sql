CREATE DATABASE havalimani;

--tablo olusturma ve primary key atama
CREATE TABLE yolcu
(
    yolcu_id INT,
    yolcu_ad VARCHAR(50),
    yolcu_soyad VARCHAR(50),
    yolcu_ulke VARCHAR(50),
    yolcu_sehir VARCHAR(50),
    yolcu_tel_no VARCHAR(11),
    PRIMARY KEY (yolcu_id)
);

--unique alan atama
CREATE TABLE adres
(
    adres_no INT,
    adres_cadde VARCHAR(50),
    adres_sokak VARCHAR(50),
    adres_ulke VARCHAR(50),
    adres_sehir VARCHAR(50),
    adres_posta_no VARCHAR(11),
    PRIMARY KEY (adres_no),
    UNIQUE (adres_posta_no)
);

--Deger ekleme
INSERT INTO yolcu
VALUES
    (1, 'Dogukan', 'YILDIZ', 'TURKEY', 'ADANA', '5551234567'),
    (2, 'Blair', 'WALDORF', 'USA', 'NEW YORK', '2221236524'),
    (3, 'Chuck', 'BASS', 'USA', 'NEW YORK', '5301238569');

INSERT INTO adres
VALUES
    (01, 'Zambak', 'Menekse', 'TURKEY', 'IZMIR', '35000'),
    (02, '5the Ave', 'E 95th', 'USA', 'NEW YORK', '10454' ),
    (03, 'Columbus Ave', 'W 63rd', 'USA', 'NEW YORK', '10451');

--foreign key atama
CREATE TABLE bilet
(
    bilet_no INT,
    bilet_tarihi DATETIME,
    bilet_yolcuNo INT,
    bilet_id INT,
    bilet_gate INT,
    bilet_sehir VARCHAR(50),
    FOREIGN KEY (bilet_yolcuNo) REFERENCES yolcu(yolcu_id),
    --birden fazla alan olusturulabilir!!
    FOREIGN KEY (bilet_sehir) REFERENCES yolcu(yolcu_sehir),
    PRIMARY KEY (bilet_id, bilet_gate),
    CONSTRAINT pk_bilet PRIMARY KEY (bilet_no)
    --CONSTRAINT fk_bilet FOREIGN KEY (bilet_yolcuNo) REFERENCES yolcu(yolcu_id)
);

CREATE TABLE ulke
(
    ulke_ad VARCHAR(55) DEFAULT 'TURKEY',
    ulke_kod VARCHAR(3),
    ulke_tel_kod VARCHAR(11),
    PRIMARY KEY (ulke_kod, ulke_tel_kod),
    FOREIGN KEY (ulke_ad) REFERENCES yolcu(yolcu_ulke) ON DELETE CASCADE
);

CREATE TABLE weather
(
    weather_degree INT CHECK(weather_degree <=50 AND weather_degree >=0),
);

--Tablo icindeki verileri siler
TRUNCATE TABLE adres;
--Tabloyu siler
DROP TABLE yolcu;

--Kosula gore listeleme
SELECT adres_ulke
FROM adres
WHERE adres_ulke = 'USA';

SELECT yolcu_ulke
FROM yolcu
WHERE yolcu_ulke = 'USA' OR yolcu_ulke = 'TURKEY';

--Tersi yonde siralama
SELECT yolcu_id
FROM yolcu
WHERE yolcu_id > 0
ORDER BY yolcu_id DESC;

--Eldeki veriyi guncelleme
UPDATE yolcu SET yolcu_ad = 'Serena', yolcu_soyad = 'Van der Woodsen', yolcu_ulke = 'USA' yolcu_sehir = 'NEW YORK' WHERE yolcu_ad ='Dogukan';