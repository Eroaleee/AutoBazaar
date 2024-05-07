# SOURCE C:/Users/Andrei/Desktop/script01.sql;
/*          Folositi pentru cale simbolul "/", NU "\"         */ 


/*#############################################################*/
/*        PARTEA 1 - STERGEREA SI RECREAREA BAZEI DE DATE      */

DROP DATABASE bazarAutoDB;
CREATE DATABASE bazarAutoDB;
USE bazarAutoDB;

/*#############################################################*/




/*#############################################################*/
/*                  PARTEA 2 - CREAREA TABELELOR              */

CREATE TABLE tblUseri (
	idUser SMALLINT(3) PRIMARY KEY AUTO_INCREMENT,
	parola VARCHAR(30) NOT NULL,
	nume VARCHAR(20) NOT NULL,
	prenume VARCHAR(50) NOT NULL,
	cnp VARCHAR(13) NOT NULL UNIQUE
);

CREATE TABLE tblBazaruri (
	judet VARCHAR(2) NOT NULL UNIQUE,
	adresa VARCHAR(50) NOT NULL UNIQUE,
	idBazar SMALLINT(2) PRIMARY KEY AUTO_INCREMENT,
	capacitateMaxima SMALLINT(4) NOT NULL
	
);

CREATE TABLE tblMasini (
	marca VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL,
	anFabricatie YEAR,
	kilometraj MEDIUMINT(7) NOT NULL,
	pretEuro MEDIUMINT NOT NULL,
	codBazar SMALLINT(2) NOT NULL,
	nrInmatriculare VARCHAR(10) NOT NULL UNIQUE,
	vin VARCHAR(17) PRIMARY KEY,
	
	FOREIGN KEY (codBazar) REFERENCES tblBazaruri(idBazar) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblTranzactii (
	idTranzactie SMALLINT(4) PRIMARY KEY,
	userID SMALLINT(3) NOT NULL,
	bazarID SMALLINT(2) NOT NULL,
	
	FOREIGN KEY (userID) REFERENCES tblUseri(idUser) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (bazarID) REFERENCES tblBazaruri(idBazar) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblFacturi (
	idFactura SMALLINT(4) PRIMARY KEY AUTO_INCREMENT,
	dataFactura DATE NOT NULL,
	userID SMALLINT(3) NOT NULL,
	bazarID SMALLINT(2) NOT NULL,
	suma MEDIUMINT NOT NULL,
	tipFactura ENUM("cumparare","vanzare"),
	
	FOREIGN KEY (userID) REFERENCES tblUseri(idUser) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (bazarID) REFERENCES tblBazaruri(idBazar) ON DELETE CASCADE ON UPDATE CASCADE
);

/*#############################################################*/




/*#############################################################*/
/*         PARTEA 3 - INSERAREA INREGISTRARILOR IN TABELE      */

INSERT INTO tblUseri VALUES (563,"JMKCJXPO","Barbu","Corina","2900424420262"),
(876,"RQHDEVXL","Ionescu","Iulian","1920207391775"),
(539,"PNWCNNIQ","Tudor","Cristian","1970803180066"),
(39,"SEDFGYAU","Popa","Daniela","2651006275990"),
(518,"YUKNAROU","Oprea","Gabriel","1570801099531"),
(80,"PFLAKRJD","Constantin","Roxana","6030429185139"),
(256,"QHFUTSTD","Dumitrache","Elena","2950828281978"),
(796,"BXOQBUZM","Ionescu","Liliana","6030630188693"),
(309,"KMICDNGF","Vasile","Mihaela","2960820058060"),
(850,"TACHBIVG","Dinu","Ioana","2550713377783");

INSERT INTO tblBazaruri VALUES ("AG","loc. Pitesti str. Egalitatii nr. 34", 1, 1000),
("DB","loc. Gaesti str. Serban Cioculescu nr. 193",2,4300),
("CJ", "loc. Cluj-Napoca str. Craiului nr. 92",3,7400),
("BV","loc. Brasov str. Carpatilor nr. 2",4,3020),
("BC", "loc. Bacau str. Mihai Eminescu nr. 10", 5, 1500),
("TM", "loc. Timisoara str. Avram Iancu nr. 25", 6, 2000),
("IS", "loc. Iasi str. Stefan cel Mare nr. 30", 7, 1800),
("CT", "loc. Constanta str. Tomis nr. 5", 8, 2200),
("MS", "loc. Mures str. Libertatii nr. 15", 9, 1200),
("VL", "loc. Valcea str. Calea lui Traian nr. 20", 10, 1700);

INSERT INTO tblMasini VALUES ("Abarth","500",2009,100400,7900,3,"CJ 865 VEN","ZFAK0EG4NDGZ9QCH8"),
("Mercedes-Benz","A",NULL,8000,40301,1,"AG 227 YEC","WDBAJE0OHMND9PPX7"),
("Renault","Kadjar",2019,139000,14900,8,"CT 720 YWZ","VF1XSQ2F8GIZ0MEZ3"),
("Alfa Romeo","159",NULL,299000,3990,4,"BV 129 GXV","ZARLXW2L73LGOV2X5"),
("Dacia","Dokker",2018,103616,12980,1,"HR 390 MLD","UUBWJ0DQO05G82B57"),
("Dacia","Duster",2019,97700,14875,2,"IF 814 ZAC","UUBXZK0MF9SAI47V8"),
("Kia","Ceed",NULL,110457,6800,2,"IF 358 ZLU","KNM9FA0F0A2IM881"),
("Mercedes-Benz","E",2017,144700,28989,1,"AG 639 KFS","WDBV3WON9KQKJPUX2"),
("Mercedes-Benz","Sprinter",NULL,270000,5900,3,"BH 800 HGO","WDBGG6KH2HM1I0828"),
("BMW", "Seria 3", 2015, 90000, 20000, 5, "BC 123 ABC", "WBA3N9C50FK214843"),
("Volkswagen", "Golf", 2018, 75000, 15000, 6, "TM 456 DEF", "WVWZZZ1KZJP005381"),
("Ford", "Focus", 2019, 60000, 14700, 7, "IS 789 GHI", "WF05XXGCC5KR17436"),
("Toyota", "Corolla", 2017, 85000, 16000, 8, "CT 987 JKL", "JTNKU3JE40J509913"),
("Hyundai", "i30", 2020, 50000, 15450, 9, "MS 654 MNO", "KMHH55LC8LU103758"),
("Audi", "A4", 2016, 95000, 21000, 10, "VL 321 PQR", "WAUZZZ8K5GA091245");

INSERT INTO tblTranzactii VALUES (1, 876, 2),
(2, 539, 3),
(3, 39, 1),
(4, 518, 4),
(5, 80, 3),
(6, 256, 2),
(7, 796, 1),
(8, 309, 4),
(9, 850, 1),
(10, 876, 3);

INSERT INTO tblFacturi VALUES (1, '2024-04-01', 563, 1, 8200, 'cumparare'),
(2, '2024-04-02', 876, 2, 11000, 'vanzare'),
(3, '2024-04-03', 539, 3, 7500, 'cumparare'),
(4, '2024-04-04', 39, 1, 4300, 'vanzare'),
(5, '2024-04-05', 518, 4, 5000, 'cumparare'),
(6, '2024-04-06', 80, 3, 9000, 'vanzare'),
(7, '2024-04-07', 256, 2, 7200, 'cumparare'),
(8, '2024-04-08', 796, 1, 8200, 'vanzare'),
(9, '2024-04-09', 309, 4, 6000, 'cumparare'),
(10, '2024-04-10', 850, 1, 4300, 'vanzare');


/*#############################################################*/



/*#############################################################*/
/*  PARTEA 4 - VIZUALIZAREA STUCTURII BD SI A INREGISTRARILOR  */

DESCRIBE tblUseri;
DESCRIBE tblBazaruri;
DESCRIBE tblMasini;
DESCRIBE tblTranzactii;
DESCRIBE tblFacturi;

SELECT * FROM tblBazaruri;
SELECT * FROM tblUseri;
SELECT * FROM tblMasini;
SELECT * FROM tblTranzactii;
SELECT * FROM tblFacturi;