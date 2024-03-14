-- Delete existing tables
DROP TABLE IF EXISTS ENCOUNTER_PER_USER;
DROP TABLE IF EXISTS ENCOUNTER;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS DIFFICULTY;


CREATE TABLE DIFFICULTY (
	idDifficulty VARCHAR(100) PRIMARY KEY,
	value VARCHAR(100)
);

CREATE TABLE USERS (
	idUser INT PRIMARY KEY,
    name VARCHAR(100),
	email VARCHAR(100),
    pass VARCHAR(100)
);

CREATE TABLE ENCOUNTER (
	idEncounter INT PRIMARY KEY,
	name VARCHAR(100),
	experience INT,
	idDifficulty VARCHAR(20),
	status VARCHAR(20),
    idUser INT, 
    FOREIGN KEY (idDifficulty) REFERENCES DIFFICULTY(idDifficulty),
    FOREIGN KEY (idUser) REFERENCES USERS(idUser)
);

INSERT INTO DIFFICULTY (idDifficulty, value) VALUES ('TRIVIAL','Trivial');
INSERT INTO DIFFICULTY (idDifficulty, value) VALUES ('EASY','Easy');
INSERT INTO DIFFICULTY (idDifficulty, value) VALUES ('MEDIUM','Medium');
INSERT INTO DIFFICULTY (idDifficulty, value) VALUES ('HARD','Hard');
INSERT INTO DIFFICULTY (idDifficulty, value) VALUES ('DEADLY','Deadly');

INSERT INTO USERS (idUser, name, email, pass) VALUES (1,'Admin','admin','admin');

INSERT INTO ENCOUNTER (idEncounter, name, experience, idDifficulty, status, idUser) VALUES (1,'Battle against goblins',10,'EASY','Closed',1);
INSERT INTO ENCOUNTER (idEncounter, name, experience, idDifficulty, status, idUser) VALUES (2,'Battle against goblins part 2',10,'EASY','Closed',1);
INSERT INTO ENCOUNTER (idEncounter, name, experience, idDifficulty, status, idUser) VALUES (3,'Mountain assault',50,'HARD','Closed',1);
INSERT INTO ENCOUNTER (idEncounter, name, experience, idDifficulty, status, idUser) VALUES (4,'Dungeon floor 1',30,'MEDIUM','Closed',1);
INSERT INTO ENCOUNTER (idEncounter, name, experience, idDifficulty, status, idUser) VALUES (5,'Dungeon floor 4',30,'MEDIUM','Closed',1);
INSERT INTO ENCOUNTER (idEncounter, name, experience, idDifficulty, status, idUser) VALUES (6,'Battle against orcs',20,'EASY','Closed',1);
INSERT INTO ENCOUNTER (idEncounter, name, experience, idDifficulty, status, idUser) VALUES (7,'Battle against a dragon',100,'DEADLY','Closed',1);
INSERT INTO ENCOUNTER (idEncounter, name, experience, idDifficulty, status, idUser) VALUES (8,'Lake encounter',5,'TRIVIAL','Closed',1);
INSERT INTO ENCOUNTER (idEncounter, name, experience, idDifficulty, status, idUser) VALUES (9,'Bar fight',10,'TRIVIAL','Closed',1);
INSERT INTO ENCOUNTER (idEncounter, name, experience, idDifficulty, status, idUser) VALUES (10,'Monastery barracks encounter',50,'HARD','Open',1);