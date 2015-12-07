/*

*/

SET foreign_key_checks = 0;
DROP TABLE IF EXISTS `chovna_stanice`, `objednavka`, `pes`, `pes_mereni`, `pes_oceneni`, `pes_plemeno`, `pes_vakcinace`, `pes_vazeni`, `uzivatel`, `uzivatel_klient`, `uzivatel_zamestnanec`, `vakcina`;
SET foreign_key_checks = 1;

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
-- Table structure for Pes
-- ----------------------------
DROP TABLE IF EXISTS Pes;
CREATE TABLE Pes (
_deleted BOOLEAN DEFAULT 0, 
ID INT(10) NOT NULL ,
Jmeno VARCHAR(20) DEFAULT ''  NULL ,
Pohlavi CHAR(1) DEFAULT NULL  NULL ,
Datum_narozeni DATE NULL ,
Cislo_cipu BIGINT NULL ,
Barva_srsti VARCHAR(20) NULL ,
Druh_srsti VARCHAR(20) NULL ,
Chovna_stanice_ID INT(10) DEFAULT NULL  NULL ,
Plemeno_ID INT(10) NULL ,
Matka_ID INT(10) NULL ,
Otec_ID INT(10) NULL
);

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
-- Table structure for Uzivatel
-- ----------------------------
DROP TABLE IF EXISTS `uzivatel`;
CREATE TABLE `uzivatel` (
  _deleted BOOLEAN DEFAULT 0, 
  `Login` varchar(8) NOT NULL,
  `Heslo` varchar(128) NOT NULL,
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
-- Table structure for Uzivatel_zamestnanec
-- ----------------------------
DROP TABLE IF EXISTS Uzivatel_zamestnanec;
CREATE TABLE Uzivatel_zamestnanec (
Login VARCHAR(8) NOT NULL ,
Zkr_fce NVARCHAR(4) NULL ,
Plat INT(10) NULL
);

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





-- -----------------------------------------------------------------------
-- DATA
-- -----------------------------------------------------------------------


-- ----------------------------
-- Records of Uzivatel
-- ----------------------------
INSERT INTO Uzivatel VALUES (0, 'zkunca07', SHA2('1', 512), 'Jiri', 'Kuncak', 'Brnenska', 'Brno', '61215', '135125744', 'Kunik@mejl.cz', 'chovatel');
INSERT INTO Uzivatel VALUES (0, 'xlehne01', SHA2('2', 512), 'Pavla', 'Lehnertova', 'Dedinska', 'Dedina', '32154', '134784124', 'lehnehne@provider.co.uk', 'klient');
INSERT INTO Uzivatel VALUES (0, 'zbalvi00', SHA2('3', 512), 'David', 'Balvin', 'Haskova', 'Zdar nad Sazavou', '59101', '123456789', 'xbalvi00@chovatelna.cz', 'spravce');
INSERT INTO Uzivatel VALUES (0, 'zbedna55', SHA2('4', 512), 'Drahoslav', 'Bednar', 'Brnenska', 'Brno', '61215', '123777895', 'xbedna55@chovatelna.cz', 'spravce');

-- ----------------------------
-- Records of Uzivatel_klient
-- ----------------------------
INSERT INTO Uzivatel_klient VALUES ('xlehne01', 'Vesnicovska', 'Vesnice', '11132');

-- ----------------------------
-- Records of Uzivatel_zamestnanec
-- ----------------------------
INSERT INTO Uzivatel_zamestnanec VALUES ('zkunca07', 'RED', '50000');
INSERT INTO Uzivatel_zamestnanec VALUES ('zbalvi00', 'CHV', '20000');
INSERT INTO Uzivatel_zamestnanec VALUES ('zbedna55', 'CHV', '25000');

-- ----------------------------
-- Records of Chovna_stanice
-- ----------------------------
INSERT INTO Chovna_stanice VALUES ('1', 'Utulek kamaradu', 'Prazska', 'Praha', '12364', 'CZE');

-- ----------------------------
-- Records of Pes_plemeno
-- ----------------------------
INSERT INTO `pes_plemeno` (`ID`, `Nazev`, `Prumerna_vyska`, `Prumerna_vaha`, `Zeme_puvodu`, `Popis`) VALUES
(1, 'Jack Russel Terier', 30, 5, 'UK', 'Pratelsky pes'),
(2, 'Border Kolie', 50, 17, 'UK', 'Aktivni pes'),
(3, 'Jezevcik', 50, 17, 'UK', 'Dlouhy pes');

-- ----------------------------
-- Records of Pes
-- ----------------------------
INSERT INTO `pes` (`_deleted`, `ID`, `Jmeno`, `Pohlavi`, `Datum_narozeni`, `Cislo_cipu`, `Barva_srsti`, `Druh_srsti`, `Chovna_stanice_ID`, `Plemeno_ID`, `Matka_ID`, `Otec_ID`) VALUES
(0, 1, 'Rex', 'M', '2012-03-12', 123929652976738, 'Bila', 'Rex', NULL, 1, NULL, NULL),
(0, 2, 'Rita', 'F', '2012-04-12', 123456755234574, 'Cerna', 'Bez', NULL, 1, NULL, NULL),
(0, 3, 'Lajka', 'F', '2013-12-18', 123433690123456, 'Cernobila', 'Rex', NULL, 1, 2, 1),
(0, 4, 'Colin', 'M', '2015-01-14', 123333789123456, 'Seda', 'Bez', 1, 2, NULL, NULL),
(0, 5, 'Colina', 'F', '2015-04-12', 165655646546546, 'Cerna', 'Bez', NULL, 2, 2, 4),
(0, 6, 'Rexss', 'M', '2012-03-12', 123929652976738, 'Bila', 'Rex', NULL, 1, NULL, NULL),
(0, 7, 'Rexssss', 'M', '2012-03-12', 123929652976738, 'Bila', 'Rex', NULL, 1, NULL, NULL),
(0, 8, 'Ferda', 'M', '2012-03-12', 123929652976738, 'Hneda', 'Hladka', NULL, 3, NULL, NULL);

-- ----------------------------
-- Records of Pes_mereni
-- ----------------------------
INSERT INTO Pes_mereni VALUES ('1', '1', 'zbalvi00', '2015-04-11 23:09:51', '30', '50', '20');
INSERT INTO Pes_mereni VALUES ('2', '2', 'zbalvi00', '2015-04-11 23:09:51', '32', '48', '20');
INSERT INTO Pes_mereni VALUES ('3', '2', 'zbalvi00', '2015-04-11 23:09:51', '31', '48', '20');

-- ----------------------------
-- Records of Pes_oceneni
-- ----------------------------
INSERT INTO Pes_oceneni VALUES ('1', '4', '2015-02-14 23:06:53', 'Krasne mlade', 'Oceceni za nejkrasnejsi stenatko');
INSERT INTO Pes_oceneni VALUES ('2', '4', '2015-02-14 23:06:53', 'Vonave nohy', 'Oceneni za vonave nohy');
INSERT INTO Pes_oceneni VALUES ('3', '4', '2013-12-18 23:06:53', 'Redundantni oceneni', 'Koupene za penize');
INSERT INTO Pes_oceneni VALUES ('4', '2', '2014-09-10 23:06:53', 'Nejlepsi rodicka', null);

-- ----------------------------
-- Records of Vakcina
-- ----------------------------
INSERT INTO Vakcina VALUES ('1', 'Vakcinol', 'Cervy', '30');
INSERT INTO Vakcina VALUES ('2', 'Antinol', 'Blechy', '10');
INSERT INTO Vakcina VALUES ('3', 'Kukurukuxol', 'Zivot', '300');
INSERT INTO Vakcina VALUES ('4', 'Kvalitinol', 'Vse', '1');

-- ----------------------------
-- Records of Pes_vakcinace
-- ----------------------------
INSERT INTO Pes_vakcinace VALUES ('1', '1', 'zbalvi00', '2015-04-11 23:05:03');
INSERT INTO Pes_vakcinace VALUES ('1', '4', 'zbalvi00', '2015-04-11 23:05:19');
INSERT INTO Pes_vakcinace VALUES ('4', '3', 'zbedna55', '2015-04-09 23:05:34');

-- ----------------------------
-- Records of Pes_vazeni
-- ----------------------------
INSERT INTO Pes_vazeni VALUES ('1', '1', 'zbalvi00', '2015-04-11 23:09:51', '30');
INSERT INTO Pes_vazeni VALUES ('2', '2', 'zbalvi00', '2015-04-11 23:09:51', '30');
INSERT INTO Pes_vazeni VALUES ('3', '2', 'zbalvi00', '2015-04-11 23:09:51', '31');


-- ----------------------------
-- Records of Objednavka
-- ----------------------------
INSERT INTO Objednavka VALUES ('1', '1', '2015-04-10 23:14:15', '5000', '4', 'zkunca07');
INSERT INTO Objednavka VALUES ('2', '1', '2013-06-18 23:14:56', '10000', '3', 'xlehne01');
