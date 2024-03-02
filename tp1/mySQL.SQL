-- https://dev.mysql.com/doc/refman/8.0/en/alter-table.html

----------------- 6
ALTER TABLE personnes MODIFY adresseP VARCHAR(150) NOT NULL DEFAULT 'algerie'
------------------- 7
ALTER TABLE modules MODIFY CoefM INT CHECK (CoefM > 0)
-------------------- 8
ALTER TABLE personnes MODIFY idPersonne VARCHAR(30)
INSERT INTO personnes (idPersonne,numSec,nomP,perP,dateNaiP,adresseP)
VALUES ("1MI",11992,"KABLI","Cilia","1992/01/20","Bejaia"),
       ("2MI",21992,"ADI","Mounir","1991/03/25","Bouira"),
       ("2MI",31993,"HAMOUDI",NULL,"1993/08/14","Bejaia"),--! preP ne peut pas etre null probleme principale rencontrer idPersonne duplica primary key
       (NULL,51989,"KASRI","Amine","1989/05/01","Bejaia"),
       (10,31980,"KARA","Lyes","1980/05/18","Alger"),
       (11,41981,"SALMI","Riad","1981/01/09"," "),
       (13,41985,NULL,"Ryma","1985/02/26","Bejaia");
--------------------- 9
ALTER TABLE modules MODIFY CodeModule VARCHAR(30)
INSERT INTO modules (CodeModule,IntituleM,CoefM,idEnseinant) 
VALUES  ("BDL2","Bases de donnees",3,"10"),
        ("SEL3","Systeme d`exploitation",2,"11"),
        ("SEL2","Systeme d`information",4,"11"),
        ("1MI","BDL2",NULL,"15"),
        (NULL,"SEL3",NULL,"11");

------------------------10
ALTER TABLE suivre MODIFY idPer VARCHAR(30)
ALTER TABLE suivre MODIFY idMod VARCHAR(30)

INSERT INTO suivre (idPer,idMod,note)
VALUES  ("1MI","SEL3",17),
        ("2MI","SEL2",12),
        ("2MI","LML2",13),
        ("3MI","SEL3",11);

---------------------------11
UPDATE nom_de_votre_table
SET nom_de_votre_colonne = (SELECT autre_colonne FROM autre_table WHERE condition)
WHERE id = 'votre_id';

UPDATE nom_de_votre_table
SET nom_de_votre_colonne = 'nouvelle_valeur'
WHERE id = 'votre_id';

--! CONFLIT DEUX PERSSONE AVEC LE MEME NUMSEC
UPDATE personnes
SET numSec = '31980'
WHERE idPersonne = '11';

--------------------------12

UPDATE modules
SET CodeModule = 'BDDL2'
WHERE CodeModule = 'BDL2';

----------------------------13
DELETE FROM modules
WHERE CodeModule='SEL3';

-----------------------------14

UPDATE personnes
SET idPersonne  = '11MI'
WHERE idPersonne = '1MI';

-----------------------15

DELETE FROM personnes
WHERE idPersonne = '2MI';

------------------------16
UPDATE personnes
SET idPersonne  = '21'
WHERE idPersonne = '11';

--------------------------17

DELETE FROM personnes
WHERE idPersonne = '10';


