/*
Navicat Oracle Data Transfer
Oracle Client Version : 10.2.0.5.0

Source Server         : Merlin
Source Server Version : 120100
Source Host           : gort.fit.vutbr.cz:1521
Source Schema         : XBALVI00

Target Server Type    : ORACLE
Target Server Version : 120100
File Encoding         : 65001

Date: 2015-05-04 21:15:32
*/


-- ----------------------------
-- Table structure for Chovna_stanice
-- ----------------------------
DROP TABLE IF EXISTS Chovna_stanice;
CREATE TABLE Chovna_stanice (
ID INT(10),
Nazev VARCHAR(100),
Ulice VARCHAR(30),
Mesto VARCHAR(30),
PSC INT(5),
Zeme VARCHAR(3)
);

-- ----------------------------
-- Records of Chovna_stanice
-- ----------------------------
INSERT INTO Chovna_stanice VALUES ('1', 'Utulek kamaradu', 'Prazska', 'Praha', '12364', 'CZE');

-- ----------------------------
-- Table structure for Objednavka
-- ----------------------------
DROP TABLE IF EXISTS Objednavka;
CREATE TABLE Objednavka (
ID INT(10) NOT NULL ,
Stav INT(2) NULL ,
Datum DATE NULL ,
Castka INT(10) NULL ,
Pes_ID INT(10) NOT NULL ,
Uzivatel_Login VARCHAR(8) NOT NULL
);

-- ----------------------------
-- Records of Objednavka
-- ----------------------------
INSERT INTO Objednavka VALUES ('1', '1', STR_TO_DATE('2015-04-10 23:14:15', 'YYYY-MM-DD HH24:MI:SS'), '5000', '4', 'zkunca07');
INSERT INTO Objednavka VALUES ('2', '1', STR_TO_DATE('2013-06-18 23:14:56', 'YYYY-MM-DD HH24:MI:SS'), '10000', '3', 'xlehne01');

-- ----------------------------
-- Table structure for Pes
-- ----------------------------
DROP TABLE IF EXISTS Pes;
CREATE TABLE Pes (
ID INT(10) NOT NULL ,
Jmeno VARCHAR(20) DEFAULT ''  NULL ,
Pohlavi CHAR(1) DEFAULT NULL  NULL ,
Datum_narozeni DATE NULL ,
Cislo_cipu INT NULL ,
Barva_srsti VARCHAR(20) NULL ,
Druh_srsti VARCHAR(20) NULL ,
Chovna_stanice_ID INT(10) DEFAULT NULL  NULL ,
Plemeno_ID INT(10) NULL ,
Matka_ID INT(10) NULL ,
Otec_ID INT(10) NULL
);

-- ----------------------------
-- Records of Pes
-- ----------------------------
INSERT INTO Pes VALUES ('3', 'Lajka', 'F', STR_TO_DATE('2013-12-18 22:52:04', 'YYYY-MM-DD HH24:MI:SS'), '123433690123456', 'Cernobila', 'Rex', null, '1', '2', '1');
INSERT INTO Pes VALUES ('4', 'Colin', 'M', STR_TO_DATE('2015-01-14 22:52:04', 'YYYY-MM-DD HH24:MI:SS'), '123333789123456', 'Seda', 'Bez', '1', '2', null, null);
INSERT INTO Pes VALUES ('1', 'Rex', 'M', STR_TO_DATE('2012-03-12 22:52:04', 'YYYY-MM-DD HH24:MI:SS'), '123929652976738', 'Bila', 'Rex', null, '1', null, null);
INSERT INTO Pes VALUES ('2', 'Rita', 'F', STR_TO_DATE('2012-04-12 22:52:04', 'YYYY-MM-DD HH24:MI:SS'), '123456755234574', 'Cerna', 'Bez', null, '1', null, null);
INSERT INTO Pes VALUES ('5', 'Colina', 'F', STR_TO_DATE('2015-04-12 10:10:10', 'YYYY-MM-DD HH24:MI:SS'), '165655646546546', 'Cerna', 'Bez', null, '2', '2', '4');
INSERT INTO Pes VALUES ('10', 'COl', 'F', null, null, null, null, null, null, null, null);
INSERT INTO Pes VALUES ('11', 'ADA', 'M', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for Pes_mereni
-- ----------------------------
DROP TABLE IF EXISTS Pes_mereni;
CREATE TABLE Pes_mereni (
 ID INT(10) NOT NULL ,
Pes_ID INT(10) NULL ,
Uzivatel_Login VARCHAR(8) NULL ,
Datum DATE NULL ,
Vyska INT(3) NULL ,
Delka INT(3) NULL ,
Obvod INT(3) NULL
);

-- ----------------------------
-- Records of Pes_mereni
-- ----------------------------
INSERT INTO Pes_mereni VALUES ('1', '1', 'zbalvi00', STR_TO_DATE('2015-04-11 23:09:51', 'YYYY-MM-DD HH24:MI:SS'), '30', '50', '20');
INSERT INTO Pes_mereni VALUES ('2', '2', 'zbalvi00', STR_TO_DATE('2015-04-11 23:09:51', 'YYYY-MM-DD HH24:MI:SS'), '32', '48', '20');
INSERT INTO Pes_mereni VALUES ('3', '2', 'zbalvi00', STR_TO_DATE('2015-04-11 23:09:51', 'YYYY-MM-DD HH24:MI:SS'), '31', '48', '20');

-- ----------------------------
-- Table structure for Pes_oceneni
-- ----------------------------
DROP TABLE IF EXISTS Pes_oceneni;
CREATE TABLE Pes_oceneni (
ID INT(10) NOT NULL ,
Pes_ID INT(10) NULL ,
Datum DATE NULL ,
Nazev NVARCHAR(255) NULL ,
Popis NVARCHAR(255) NULL
);

-- ----------------------------
-- Records of Pes_oceneni
-- ----------------------------
INSERT INTO Pes_oceneni VALUES ('1', '4', STR_TO_DATE('2015-02-14 23:06:53', 'YYYY-MM-DD HH24:MI:SS'), 'Krasne mlade', 'Oceceni za nejkrasnejsi stenatko');
INSERT INTO Pes_oceneni VALUES ('2', '4', STR_TO_DATE('2015-02-14 23:06:53', 'YYYY-MM-DD HH24:MI:SS'), 'Vonave nohy', 'Oceneni za vonave nohy');
INSERT INTO Pes_oceneni VALUES ('3', '4', STR_TO_DATE('2013-12-18 23:06:53', 'YYYY-MM-DD HH24:MI:SS'), 'Redundantni oceneni', 'Koupene za penize');
INSERT INTO Pes_oceneni VALUES ('4', '2', STR_TO_DATE('2014-09-10 23:06:53', 'YYYY-MM-DD HH24:MI:SS'), 'Nejlepsi rodicka', null);

-- ----------------------------
-- Table structure for Pes_plemeno
-- ----------------------------
DROP TABLE IF EXISTS Pes_plemeno;
CREATE TABLE Pes_plemeno (
ID INT(10) NOT NULL ,
Nazev NVARCHAR(30) NULL ,
Prumerna_vyska INT(3) NULL ,
Prumerna_vaha INT(3) NULL ,
Zeme_puvodu NVARCHAR(3) NULL ,
Popis NVARCHAR(255) NULL
);

-- ----------------------------
-- Records of Pes_plemeno
-- ----------------------------
INSERT INTO Pes_plemeno VALUES ('1', 'Jack Russel Terier', '30', '5', 'UK', 'Pratelsky pes');
INSERT INTO Pes_plemeno VALUES ('2', 'Border Kolie', '50', '17', 'UK', 'Aktivni pes');

-- ----------------------------
-- Table structure for Pes_vakcinace
-- ----------------------------
DROP TABLE IF EXISTS Pes_vakcinace;
CREATE TABLE Pes_vakcinace (
Pes_ID INT(10) NULL ,
Vakcina_ID INT(10) NULL ,
Uzivatel_Login VARCHAR(8) NULL ,
Datum DATE NULL
);

-- ----------------------------
-- Records of Pes_vakcinace
-- ----------------------------
INSERT INTO Pes_vakcinace VALUES ('1', '1', 'zbalvi00', STR_TO_DATE('2015-04-11 23:05:03', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Pes_vakcinace VALUES ('1', '4', 'zbalvi00', STR_TO_DATE('2015-04-11 23:05:19', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Pes_vakcinace VALUES ('4', '3', 'zbedna55', STR_TO_DATE('2015-04-09 23:05:34', 'YYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for Pes_vazeni
-- ----------------------------
DROP TABLE IF EXISTS Pes_vazeni;
CREATE TABLE Pes_vazeni (
ID INT(10) NOT NULL ,
Pes_ID INT(10) NULL ,
Uzivatel_Login VARCHAR(8) NULL ,
Datum DATE NULL ,
Vaha INT(3) NULL
);

-- ----------------------------
-- Records of Pes_vazeni
-- ----------------------------
INSERT INTO Pes_vazeni VALUES ('1', '1', 'zbalvi00', STR_TO_DATE('2015-04-11 23:09:51', 'YYYY-MM-DD HH24:MI:SS'), '30');
INSERT INTO Pes_vazeni VALUES ('2', '2', 'zbalvi00', STR_TO_DATE('2015-04-11 23:09:51', 'YYYY-MM-DD HH24:MI:SS'), '30');
INSERT INTO Pes_vazeni VALUES ('3', '2', 'zbalvi00', STR_TO_DATE('2015-04-11 23:09:51', 'YYYY-MM-DD HH24:MI:SS'), '31');

-- ----------------------------
-- Table structure for Uzivatel
-- ----------------------------
DROP TABLE IF EXISTS `uzivatel`;
CREATE TABLE `uzivatel` (
  `Login` varchar(8) NOT NULL,
  `Heslo` blob,
  `Jmeno` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `Prijmeni` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `K_Ulice` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `K_Mesto` varchar(30) DEFAULT NULL,
  `K_PSKC` int(5) DEFAULT NULL,
  `K_Telefon` int(12) DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Login`)
);

-- ----------------------------
-- Records of Uzivatel
-- ----------------------------
INSERT INTO Uzivatel VALUES ('zkunca07', '1', 'Jiri', 'Kuncak', 'Brnenska', 'Brno', '61215', '135125744', 'Kunik@mejl.cz', 'chovatel');
INSERT INTO Uzivatel VALUES ('xlehne01', '2', 'Pavla', 'Lehnertova', 'Dedinska', 'Dedina', '32154', '134784124', 'lehnehne@provider.co.uk', 'klient');
INSERT INTO Uzivatel VALUES ('zbalvi00', '3', 'David', 'Balvin', 'Haskova', 'Zdar nad Sazavou', '59101', '123456789', 'xbalvi00@chovatelna.cz', 'spravce');
INSERT INTO Uzivatel VALUES ('zbedna55', '4', 'Drahoslav', 'Bednar', 'Brnenska', 'Brno', '61215', '123777895', 'xbedna55@chovatelna.cz', 'spravce');

-- ----------------------------
-- Table structure for Uzivatel_klient
-- ----------------------------
DROP TABLE IF EXISTS Uzivatel_klient;
CREATE TABLE Uzivatel_klient (
Login VARCHAR(8) NOT NULL ,
F_Ulice NVARCHAR(30) NULL ,
F_Mesto NVARCHAR(30) NULL ,
F_PSC NVARCHAR(5) NULL
);

-- ----------------------------
-- Records of Uzivatel_klient
-- ----------------------------
INSERT INTO Uzivatel_klient VALUES ('xlehne01', 'Vesnicovska', 'Vesnice', '11132');

-- ----------------------------
-- Table structure for Uzivatel_zamestnanec
-- ----------------------------
DROP TABLE IF EXISTS Uzivatel_zamestnanec;
CREATE TABLE Uzivatel_zamestnanec (
Login VARCHAR(8) NOT NULL ,
Zkr_fce NVARCHAR(4) NULL ,
Plat INT(10) NULL
);

-- ----------------------------
-- Records of Uzivatel_zamestnanec
-- ----------------------------
INSERT INTO Uzivatel_zamestnanec VALUES ('zkunca07', 'RED', '50000');
INSERT INTO Uzivatel_zamestnanec VALUES ('zbalvi00', 'CHV', '20000');
INSERT INTO Uzivatel_zamestnanec VALUES ('zbedna55', 'CHV', '25000');

-- ----------------------------
-- Table structure for Vakcina
-- ----------------------------
DROP TABLE IF EXISTS Vakcina;
CREATE TABLE Vakcina (
ID INT(10) NOT NULL ,
Nazev NVARCHAR(30) NULL ,
Popis NVARCHAR(255) NULL ,
Doba_ucinnosti INT(10) NULL
);

-- ----------------------------
-- Records of Vakcina
-- ----------------------------
INSERT INTO Vakcina VALUES ('1', 'Vakcinol', 'Cervy', '30');
INSERT INTO Vakcina VALUES ('2', 'Antinol', 'Blechy', '10');
INSERT INTO Vakcina VALUES ('3', 'Kukurukuxol', 'Zivot', '300');
INSERT INTO Vakcina VALUES ('4', 'Kvalitinol', 'Vse', '1');


-- ----------------------------
-- Checks structure for table Chovna_stanice
-- ----------------------------
ALTER TABLE Chovna_stanice ADD CHECK (ID IS NOT NULL);
ALTER TABLE Chovna_stanice ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Chovna_stanice
-- ----------------------------
ALTER TABLE Chovna_stanice ADD PRIMARY KEY (ID);

-- ----------------------------
-- Checks structure for table Objednavka
-- ----------------------------
ALTER TABLE Objednavka ADD CHECK (ID IS NOT NULL);
ALTER TABLE Objednavka ADD CHECK (Pes_ID IS NOT NULL);
ALTER TABLE Objednavka ADD CHECK (Uzivatel_Login IS NOT NULL);
ALTER TABLE Objednavka ADD CHECK (ID IS NOT NULL);
ALTER TABLE Objednavka ADD CHECK (Pes_ID IS NOT NULL);
ALTER TABLE Objednavka ADD CHECK (Uzivatel_Login IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Objednavka
-- ----------------------------
ALTER TABLE Objednavka ADD PRIMARY KEY (ID);

-- ----------------------------
-- Checks structure for table Pes
-- ----------------------------
ALTER TABLE Pes ADD CHECK (ID IS NOT NULL);
ALTER TABLE Pes ADD CHECK (LENGTH(Cislo_cipu) = 15);
ALTER TABLE Pes ADD CHECK (Pohlavi IN ('M','F'));
ALTER TABLE Pes ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Pes
-- ----------------------------
ALTER TABLE Pes ADD PRIMARY KEY (ID);

-- ----------------------------
-- Checks structure for table Pes_mereni
-- ----------------------------
ALTER TABLE Pes_mereni ADD CHECK ( ID IS NOT NULL);
ALTER TABLE Pes_mereni ADD CHECK ( ID IS NOT NULL);
ALTER TABLE Pes_mereni ADD CHECK ( ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Pes_mereni
-- ----------------------------
ALTER TABLE Pes_mereni ADD PRIMARY KEY ( ID);

-- ----------------------------
-- Checks structure for table Pes_oceneni
-- ----------------------------
ALTER TABLE Pes_oceneni ADD CHECK (ID IS NOT NULL);
ALTER TABLE Pes_oceneni ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Pes_oceneni
-- ----------------------------
ALTER TABLE Pes_oceneni ADD PRIMARY KEY (ID);

-- ----------------------------
-- Checks structure for table Pes_plemeno
-- ----------------------------
ALTER TABLE Pes_plemeno ADD CHECK (ID IS NOT NULL);
ALTER TABLE Pes_plemeno ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Pes_plemeno
-- ----------------------------
ALTER TABLE Pes_plemeno ADD PRIMARY KEY (ID);

-- ----------------------------
-- Checks structure for table Pes_vazeni
-- ----------------------------
ALTER TABLE Pes_vazeni ADD CHECK (ID IS NOT NULL);
ALTER TABLE Pes_vazeni ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Pes_vazeni
-- ----------------------------
ALTER TABLE Pes_vazeni ADD PRIMARY KEY (ID);

-- ----------------------------
-- Checks structure for table Uzivatel
-- ----------------------------
ALTER TABLE Uzivatel ADD CHECK (Login IS NOT NULL);
ALTER TABLE Uzivatel ADD CHECK (Login IS NOT NULL);
ALTER TABLE Uzivatel ADD CHECK (REGEXP_LIKE (Email, '^[a-zA-Z0-9!#$%''\*\+-/=\?^_`\{|\}~]+@[a-zA-Z0-9._%-]+\.[a-zA-Z]{2,4}$'));
ALTER TABLE Uzivatel ADD CHECK (Login IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Uzivatel
-- ----------------------------

-- ----------------------------
-- Checks structure for table Uzivatel_klient
-- ----------------------------
ALTER TABLE Uzivatel_klient ADD CHECK (Login IS NOT NULL);
ALTER TABLE Uzivatel_klient ADD CHECK (Login IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Uzivatel_klient
-- ----------------------------
ALTER TABLE Uzivatel_klient ADD PRIMARY KEY (Login);

-- ----------------------------
-- Checks structure for table Uzivatel_zamestnanec
-- ----------------------------
ALTER TABLE Uzivatel_zamestnanec ADD CHECK (Login IS NOT NULL);
ALTER TABLE Uzivatel_zamestnanec ADD CHECK (Login IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Uzivatel_zamestnanec
-- ----------------------------
ALTER TABLE Uzivatel_zamestnanec ADD PRIMARY KEY (Login);

-- ----------------------------
-- Checks structure for table Vakcina
-- ----------------------------
ALTER TABLE Vakcina ADD CHECK (ID IS NOT NULL);
ALTER TABLE Vakcina ADD CHECK (ID IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table Vakcina
-- ----------------------------
ALTER TABLE Vakcina ADD PRIMARY KEY (ID);

-- ----------------------------
-- Foreign Key structure for table Objednavka
-- ----------------------------
ALTER TABLE Objednavka ADD FOREIGN KEY (Pes_ID) REFERENCES Pes (ID);
ALTER TABLE Objednavka ADD FOREIGN KEY (Uzivatel_Login) REFERENCES Uzivatel (Login);

-- ----------------------------
-- Foreign Key structure for table Pes
-- ----------------------------
ALTER TABLE Pes ADD FOREIGN KEY (Chovna_stanice_ID) REFERENCES Chovna_stanice (ID) ON DELETE SET NULL;
ALTER TABLE Pes ADD FOREIGN KEY (Plemeno_ID) REFERENCES Pes_plemeno (ID) ON DELETE SET NULL;
ALTER TABLE Pes ADD FOREIGN KEY (Matka_ID) REFERENCES Pes (ID) ON DELETE SET NULL;
ALTER TABLE Pes ADD FOREIGN KEY (Otec_ID) REFERENCES Pes (ID) ON DELETE SET NULL;

-- ----------------------------
-- Foreign Key structure for table Pes_mereni
-- ----------------------------
ALTER TABLE Pes_mereni ADD FOREIGN KEY (Uzivatel_Login) REFERENCES Uzivatel (Login);
ALTER TABLE Pes_mereni ADD FOREIGN KEY (Pes_ID) REFERENCES Pes (ID);

-- ----------------------------
-- Foreign Key structure for table Pes_oceneni
-- ----------------------------
ALTER TABLE Pes_oceneni ADD FOREIGN KEY (Pes_ID) REFERENCES Pes (ID);

-- ----------------------------
-- Foreign Key structure for table Pes_vakcinace
-- ----------------------------
ALTER TABLE Pes_vakcinace ADD FOREIGN KEY (Pes_ID) REFERENCES Pes (ID);
ALTER TABLE Pes_vakcinace ADD FOREIGN KEY (Uzivatel_Login) REFERENCES Uzivatel (Login);
ALTER TABLE Pes_vakcinace ADD FOREIGN KEY (Vakcina_ID) REFERENCES Vakcina (ID);

-- ----------------------------
-- Foreign Key structure for table Pes_vazeni
-- ----------------------------
ALTER TABLE Pes_vazeni ADD FOREIGN KEY (Pes_ID) REFERENCES Pes (ID);
ALTER TABLE Pes_vazeni ADD FOREIGN KEY (Uzivatel_Login) REFERENCES Uzivatel (Login);

-- ----------------------------
-- Foreign Key structure for table Uzivatel_klient
-- ----------------------------
ALTER TABLE Uzivatel_klient ADD FOREIGN KEY (Login) REFERENCES Uzivatel (Login) ON DELETE CASCADE;

-- ----------------------------
-- Foreign Key structure for table Uzivatel_zamestnanec
-- ----------------------------
ALTER TABLE Uzivatel_zamestnanec ADD FOREIGN KEY (Login) REFERENCES Uzivatel (Login) ON DELETE CASCADE;



-- SELEKTY




-- příklady spojení 2 tabulek

-- Která ocenění (Název, Popis) získal pes s číslem čipu 123929652976738
 SELECT DISTINCT Nazev, Popis FROM Pes_oceneni LEFT JOIN Pes
ON Pes.ID = Pes_oceneni.Pes_ID AND Pes.Cislo_cipu = '123929652976738';

-- kteří psi pochazí z chovné stanice Utulek kamaradu
 SELECT Jmeno FROM Pes JOIN Chovna_stanice
ON Chovna_stanice.ID = Pes.Chovna_stanice_ID AND Chovna_stanice.Nazev = 'Utulek kamaradu';


/* NEFUNGUJE
-- příklad spojení 3 tabulek
-- Kteří chovatelé (Jmeno, Prijmeni) někdy prováděli vakcinaci nějaké fenky
SELECT DISTINCT Jmeno, Prijmeni FROM Uzivatel LEFT JOIN Pes_vakcinace LEFT JOIN Pes
WHERE Pes.id = Pes_vakcinace.id AND Pes_vakcinace.Login = Uzivatel.Login AND Pes.Pohlavi = 'F';

*/
-- příklady s klauzulí GROUP BY a agregační funkcí,

-- jaká byla maximální váha psa s id 1
SELECT max(Vaha) FROM Pes_vazeni
WHERE Pes_ID = 1
GROUP BY Vaha;

-- kterým psem má kolik štenat fenka s id 2?
SELECT count(*) as pocet_stenat, Otec_ID FROM Pes
WHERE Pes.Matka_ID = 2
GROUP BY Otec_ID;


-- příklad obsahující predikát EXISTS
-- kteří psi nebyli nikdy vakcinovani
SELECT Jmeno FROM Pes WHERE NOT EXISTS (
	SELECT * FROM Pes_vakcinace WHERE Pes_vakcinace.Pes_ID = Pes.ID
);


-- příklad s predikátem IN s vnořeným selectem
-- Kteří chovatelé prováděli měření pouze psů plemene Border Kolie
SELECT DISTINCT Jmeno, Prijmeni FROM Uzivatel WHERE Uzivatel.Login NOT IN (
	SELECT Login FROM Pes_mereni NATURAL JOIN Pes_plemeno
	WHERE Pes_plemeno.Nazev <> 'Border Kolie'
);



-- ----------------------------
-- Ukol ctvrty ukazky
-- ----------------------------

-- Trigger na Auto-increment
INSERT INTO Pes (Jmeno, Pohlavi) VALUES ('Alpaka', 'F');

-- Trigger na Delete


-- Nastaveni prav (Grant ALL)
GRANT ALL ON Chovna_stanice TO XBEDNA55;
GRANT ALL ON Objednavka TO XBEDNA55;
GRANT ALL ON Pes TO XBEDNA55;
GRANT ALL ON Pes_mereni TO XBEDNA55;
GRANT ALL ON Pes_oceneni TO XBEDNA55;
GRANT ALL ON Pes_plemeno TO XBEDNA55;
GRANT ALL ON Pes_vakcinace TO XBEDNA55;
GRANT ALL ON Pes_vazeni TO XBEDNA55;
GRANT ALL ON Uzivatel TO XBEDNA55;
GRANT ALL ON Uzivatel_klient TO XBEDNA55;
GRANT ALL ON Uzivatel_zamestnanec TO XBEDNA55;
GRANT ALL ON Vakcina TO XBEDNA55;

-- Materializovany pohled
DROP MATERIALIZED VIEW Pes_neprodano;
CREATE MATERIALIZED VIEW Pes_neprodano AS
SELECT DISTINCT * FROM Pes WHERE Pes.ID NOT IN (
 SELECT DISTINCT Objednavka.Pes_ID
 FROM Objednavka
 WHERE Objednavka.Stav = '1'
);
-- Ukazka pouziti
SELECT  Jmeno, Pohlavi, Cislo_cipu, Barva_srsti, Druh_srsti
FROM Pes_neprodano;
