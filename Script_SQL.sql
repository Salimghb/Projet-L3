DROP TABLE IF EXISTS Bouquet;

DROP TABLE IF EXISTS Commentaire;

DROP TABLE IF EXISTS Facture;

DROP TABLE IF EXISTS Administrateur;

DROP TABLE IF EXISTS Util;

DROP TABLE IF EXISTS Commande;

DROP TABLE IF EXISTS Adresse_Pro;

DROP TABLE IF EXISTS Etat_Co;

DROP TABLE IF EXISTS Adresse;

DROP TABLE IF EXISTS Salarie;

DROP TABLE IF EXISTS Service;

DROP TABLE IF EXISTS Type_Util;

DROP TABLE IF EXISTS Etat_Facture;

DROP TABLE IF EXISTS Ent_Cliente;

DROP TABLE IF EXISTS Type_Facture;

DROP TABLE IF EXISTS Etat_Commande;

DROP TABLE IF EXISTS Presta;

DROP TABLE IF EXISTS Type_Service;

DROP TABLE IF EXISTS Abonnement;

DROP TABLE IF EXISTS Adresse_Perso_Sal;

DROP TABLE IF EXISTS Contenu_Bouquet;

# -----------------------------------------------------------------------------
#       TABLE : Bouquet
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Bouquet
 (
   id_Bouquet INTEGER NOT NULL AUTO_INCREMENT ,
   Lib_Bouquet VARCHAR(128)   ,
   Tarif_Bouquet DECIMAL(13,2) NOT NULL  
   , PRIMARY KEY (id_Bouquet) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Commentaire
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Commentaire
 (
   Code_Commentaire INTEGER NOT NULL AUTO_INCREMENT ,
   id_Service INTEGER NOT NULL  ,
   id_Util_Herite_Util INTEGER NOT NULL  ,
   Titre_Commentaire VARCHAR(128)   ,
   Contenu_Commentaire TEXT NOT NULL  
   , PRIMARY KEY (Code_Commentaire) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Facture
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Facture
 (
   id_Facture INTEGER NOT NULL AUTO_INCREMENT ,
   id_Abonnement INTEGER   ,
   Code_Etat_Facture INTEGER NOT NULL  ,
   id_Commande INTEGER   ,
   Code_Type_Facture INTEGER NOT NULL  ,
   id_Util INTEGER NOT NULL  ,
   id_Util_1 INTEGER   ,
   id_Util_Herite_Util INTEGER   ,
   Info_Comp_Facture TEXT   
   , PRIMARY KEY (id_Facture) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Administrateur
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Administrateur
 (
   id_Util INTEGER NOT NULL  ,
   Nom_Admin VARCHAR(64) NOT NULL  ,
   Prenom_Admin VARCHAR(64) NOT NULL  ,
   Tel_Admin VARCHAR(10)   ,
   Mail_Admin VARCHAR(128)   ,
   Login_Util VARCHAR(32) NOT NULL  ,
   Pass_Util VARCHAR(128) NOT NULL  
   , PRIMARY KEY (id_Util) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Util
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Util
 (
   id_Util INTEGER NOT NULL AUTO_INCREMENT ,
   Code_Etat_Connexion INTEGER NOT NULL  ,
   Code_Type_Util INTEGER NOT NULL  ,
   Login_Util VARCHAR(32) NOT NULL  ,
   Pass_Util VARCHAR(128) NOT NULL  
   , PRIMARY KEY (id_Util) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Commande
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Commande
 (
   id_Commande INTEGER NOT NULL AUTO_INCREMENT ,
   Code_Etat_Commande INTEGER NOT NULL  ,
   id_Facture INTEGER   ,
   id_Service INTEGER NOT NULL  ,
   id_Util_Herite_Util INTEGER NOT NULL  ,
   Info_Comp_Commande TEXT   
   , PRIMARY KEY (id_Commande) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Adresse_Pro
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Adresse_Pro
 (
   id_Adresse INTEGER NOT NULL  ,
   Cedex_Adresse INTEGER   ,
   Num_Adresse INTEGER NOT NULL  ,
   Rue_Adresse VARCHAR(128) NOT NULL  ,
   Ville_Adresse VARCHAR(64) NOT NULL  ,
   CP_Adresse INTEGER NOT NULL  ,
   Num_Appart_Adresse INTEGER   ,
   Etage_Adresse INTEGER   ,
   Comp_Adresse VARCHAR(128)   
   , PRIMARY KEY (id_Adresse) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Etat_Co
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Etat_Co
 (
   Code_Etat_Connexion INTEGER NOT NULL  ,
   Lib_Etat_Connexion VARCHAR(32)   
   , PRIMARY KEY (Code_Etat_Connexion) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Adresse
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Adresse
 (
   id_Adresse INTEGER NOT NULL AUTO_INCREMENT ,
   Num_Adresse INTEGER NOT NULL  ,
   Rue_Adresse VARCHAR(128) NOT NULL  ,
   Ville_Adresse VARCHAR(64) NOT NULL  ,
   CP_Adresse INTEGER NOT NULL  ,
   Num_Appart_Adresse INTEGER   ,
   Etage_Adresse INTEGER   ,
   Comp_Adresse VARCHAR(128)   
   , PRIMARY KEY (id_Adresse) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Salarie
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Salarie
 (
   id_Util_Herite_Util INTEGER NOT NULL  ,
   id_Util INTEGER NOT NULL  ,
   id_Adresse INTEGER NOT NULL  ,
   Nom_Sal VARCHAR(128) NOT NULL  ,
   Prenom_Sal VARCHAR(128) NOT NULL  ,
   Sexe_Sal VARCHAR(32) NOT NULL       CHECK (Sexe_Sal in ("Homme","Femme","Autre")),
   Age_Sal INTEGER   ,
   Tel_Sal VARCHAR(10)   ,
   Mail_Sal VARCHAR(128)   ,
   Login_Util VARCHAR(32) NOT NULL  ,
   Pass_Util VARCHAR(128) NOT NULL  
   , PRIMARY KEY (id_Util_Herite_Util) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Service
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Service
 (
   id_Service INTEGER NOT NULL AUTO_INCREMENT ,
   Code_Type_Service INTEGER NOT NULL  ,
   id_Util INTEGER NOT NULL  ,
   Lib_Service VARCHAR(128) NOT NULL  ,
   Tarif_Service DECIMAL(13,2) NOT NULL  ,
   Desc_Service TEXT   
   , PRIMARY KEY (id_Service) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Type_Util
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Type_Util
 (
   Code_Type_Util INTEGER NOT NULL  ,
   Lib_Type_Util VARCHAR(32)   
   , PRIMARY KEY (Code_Type_Util) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Etat_Facture
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Etat_Facture
 (
   Code_Etat_Facture INTEGER NOT NULL  ,
   Lib_Etat_Facture VARCHAR(32)   
   , PRIMARY KEY (Code_Etat_Facture) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Ent_Cliente
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Ent_Cliente
 (
   id_Util INTEGER NOT NULL  ,
   id_Adresse INTEGER NOT NULL  ,
   Nom_Ent VARCHAR(128) NOT NULL  ,
   Tel_Ent VARCHAR(10) NOT NULL  ,
   Web_Ent VARCHAR(128)   ,
   Mail_Ent VARCHAR(128)   ,
   Login_Util VARCHAR(32) NOT NULL  ,
   Pass_Util VARCHAR(128) NOT NULL  
   , PRIMARY KEY (id_Util) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Type_Facture
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Type_Facture
 (
   Code_Type_Facture INTEGER NOT NULL  ,
   Lib_Type_Facture VARCHAR(32)   
   , PRIMARY KEY (Code_Type_Facture) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Etat_Commande
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Etat_Commande
 (
   Code_Etat_Commande INTEGER NOT NULL  ,
   Lib_Etat_Commande VARCHAR(32)   
   , PRIMARY KEY (Code_Etat_Commande) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Presta
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Presta
 (
   id_Util INTEGER NOT NULL  ,
   id_Adresse INTEGER NOT NULL  ,
   Nom_Presta VARCHAR(128) NOT NULL  ,
   Prenom_Presta VARCHAR(128) NOT NULL  ,
   Sexe_Presta VARCHAR(32) NOT NULL       CHECK (Sexe_Presta in ("Homme","Femme","Autre")),
   Age_Presta INTEGER   ,
   Societe_Presta VARCHAR(128) NOT NULL  ,
   Tel_Presta VARCHAR(10)   ,
   Mail_Presta VARCHAR(32)   ,
   Login_Util VARCHAR(32) NOT NULL  ,
   Pass_Util VARCHAR(128) NOT NULL  
   , PRIMARY KEY (id_Util) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Type_Service
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Type_Service
 (
   Code_Type_Service INTEGER NOT NULL AUTO_INCREMENT ,
   Lib_Type_Service VARCHAR(128)   
   , PRIMARY KEY (Code_Type_Service) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Abonnement
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Abonnement
 (
   id_Abonnement INTEGER NOT NULL AUTO_INCREMENT ,
   id_Bouquet INTEGER NOT NULL  ,
   id_Util INTEGER NOT NULL  ,
   Duree_Abonnement INTEGER NOT NULL  ,
   Date_Debut_Abonnement DATETIME NOT NULL  
   , PRIMARY KEY (id_Abonnement) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Adresse_Perso_Sal
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Adresse_Perso_Sal
 (
   id_Util_Herite_Util INTEGER NOT NULL  ,
   id_Adresse INTEGER NOT NULL  
   , PRIMARY KEY (id_Util_Herite_Util,id_Adresse) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Contenu_Bouquet
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Contenu_Bouquet
 (
   id_Service INTEGER NOT NULL  ,
   id_Bouquet INTEGER NOT NULL  
   , PRIMARY KEY (id_Service,id_Bouquet) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE Commentaire 
  ADD FOREIGN KEY FK_Commentaire_Service (id_Service)
      REFERENCES Service (id_Service) ;


ALTER TABLE Commentaire 
  ADD FOREIGN KEY FK_Commentaire_Salarie (id_Util_Herite_Util)
      REFERENCES Salarie (id_Util_Herite_Util) ;


ALTER TABLE Facture 
  ADD FOREIGN KEY FK_Facture_Abonnement (id_Abonnement)
      REFERENCES Abonnement (id_Abonnement) ;


ALTER TABLE Facture 
  ADD FOREIGN KEY FK_Facture_Etat_Facture (Code_Etat_Facture)
      REFERENCES Etat_Facture (Code_Etat_Facture) ;


ALTER TABLE Facture 
  ADD FOREIGN KEY FK_Facture_Ent_Cliente (id_Util_1)
      REFERENCES Ent_Cliente (id_Util) ;


ALTER TABLE Facture 
  ADD FOREIGN KEY FK_Facture_Presta (id_Util)
      REFERENCES Presta (id_Util) ;


ALTER TABLE Facture 
  ADD FOREIGN KEY FK_Facture_Salarie (id_Util_Herite_Util)
      REFERENCES Salarie (id_Util_Herite_Util) ;


ALTER TABLE Facture 
  ADD FOREIGN KEY FK_Facture_Commande (id_Commande)
      REFERENCES Commande (id_Commande) ;


ALTER TABLE Facture 
  ADD FOREIGN KEY FK_Facture_Type_Facture (Code_Type_Facture)
      REFERENCES Type_Facture (Code_Type_Facture) ;


ALTER TABLE Administrateur 
  ADD FOREIGN KEY FK_Administrateur_Util (id_Util)
      REFERENCES Util (id_Util) ;


ALTER TABLE Util 
  ADD FOREIGN KEY FK_Util_Etat_Co (Code_Etat_Connexion)
      REFERENCES Etat_Co (Code_Etat_Connexion) ;


ALTER TABLE Util 
  ADD FOREIGN KEY FK_Util_Type_Util (Code_Type_Util)
      REFERENCES Type_Util (Code_Type_Util) ;


ALTER TABLE Commande 
  ADD FOREIGN KEY FK_Commande_Etat_Commande (Code_Etat_Commande)
      REFERENCES Etat_Commande (Code_Etat_Commande) ;


ALTER TABLE Commande 
  ADD FOREIGN KEY FK_Commande_Salarie (id_Util_Herite_Util)
      REFERENCES Salarie (id_Util_Herite_Util) ;


ALTER TABLE Commande 
  ADD FOREIGN KEY FK_Commande_Facture (id_Facture)
      REFERENCES Facture (id_Facture) ;


ALTER TABLE Commande 
  ADD FOREIGN KEY FK_Commande_Service (id_Service)
      REFERENCES Service (id_Service) ;


ALTER TABLE Adresse_Pro 
  ADD FOREIGN KEY FK_Adresse_Pro_Adresse (id_Adresse)
      REFERENCES Adresse (id_Adresse) ;


ALTER TABLE Salarie 
  ADD FOREIGN KEY FK_Salarie_Ent_Cliente (id_Util)
      REFERENCES Ent_Cliente (id_Util) ;


ALTER TABLE Salarie 
  ADD FOREIGN KEY FK_Salarie_Adresse_Pro (id_Adresse)
      REFERENCES Adresse_Pro (id_Adresse) ;


ALTER TABLE Salarie 
  ADD FOREIGN KEY FK_Salarie_Util (id_Util_Herite_Util)
      REFERENCES Util (id_Util) ;


ALTER TABLE Service 
  ADD FOREIGN KEY FK_Service_Presta (id_Util)
      REFERENCES Presta (id_Util) ;


ALTER TABLE Service 
  ADD FOREIGN KEY FK_Service_Type_Service (Code_Type_Service)
      REFERENCES Type_Service (Code_Type_Service) ;


ALTER TABLE Ent_Cliente 
  ADD FOREIGN KEY FK_Ent_Cliente_Adresse_Pro (id_Adresse)
      REFERENCES Adresse_Pro (id_Adresse) ;


ALTER TABLE Ent_Cliente 
  ADD FOREIGN KEY FK_Ent_Cliente_Util (id_Util)
      REFERENCES Util (id_Util) ;


ALTER TABLE Presta 
  ADD FOREIGN KEY FK_Presta_Adresse_Pro (id_Adresse)
      REFERENCES Adresse_Pro (id_Adresse) ;


ALTER TABLE Presta 
  ADD FOREIGN KEY FK_Presta_Util (id_Util)
      REFERENCES Util (id_Util) ;


ALTER TABLE Abonnement 
  ADD FOREIGN KEY FK_Abonnement_Bouquet (id_Bouquet)
      REFERENCES Bouquet (id_Bouquet) ;


ALTER TABLE Abonnement 
  ADD FOREIGN KEY FK_Abonnement_Ent_Cliente (id_Util)
      REFERENCES Ent_Cliente (id_Util) ;


ALTER TABLE Adresse_Perso_Sal 
  ADD FOREIGN KEY FK_Adresse_Perso_Sal_Salarie (id_Util_Herite_Util)
      REFERENCES Salarie (id_Util_Herite_Util) ;


ALTER TABLE Adresse_Perso_Sal 
  ADD FOREIGN KEY FK_Adresse_Perso_Sal_Adresse (id_Adresse)
      REFERENCES Adresse (id_Adresse) ;


ALTER TABLE Contenu_Bouquet 
  ADD FOREIGN KEY FK_Contenu_Bouquet_Service (id_Service)
      REFERENCES Service (id_Service) ;


ALTER TABLE Contenu_Bouquet 
  ADD FOREIGN KEY FK_Contenu_Bouquet_Bouquet (id_Bouquet)
      REFERENCES Bouquet (id_Bouquet) ;

insert into Etat_Co (Code_Etat_Connexion, Lib_Etat_Connexion) values 
(1, "Inscrit"),
(2, "Connecté");
insert into Type_Util (Code_Type_Util, Lib_Type_Util) values 
(1, "Administrateur"),
(2, "Entreprise Cliente"),
(3, "Salarié"),
(4, "Prestataire");
insert into Etat_Facture (Code_Etat_Facture, Lib_Etat_Facture) values
(1, "Impayée"),
(2, "Payée");
insert into Type_Facture (Code_Type_Facture, Lib_Type_Facture) values
(1, "Facture Abonnement"),
(2, "Facture Service");
insert into Etat_Commande (Code_Etat_Commande, Lib_Etat_Commande) values
(1, "Créée"),
(2, "En cours"),
(3, "Terminée");
insert into Type_Service (Code_Type_Service, Lib_Type_Service) values
(1, "Garde d'enfants"),
(2, "Artisanat"),
(3, "Automobile"),
(4, "Courses"),
(5, "Alimentation");

INSERT INTO `adresse`(`id_Adresse`, `Num_Adresse`, `Rue_Adresse`, `Ville_Adresse`, `CP_Adresse`, `Num_Appart_Adresse`, `Etage_Adresse`, `Comp_Adresse`) 
VALUES 

(21,58,'Avenue des Tuileries','Paris',75000,NULL,NULL,NULL),
(22,97,'Rue du calvaire','Nantes',44000,NULL,NULL,NULL),
(23,8,'Rue de la République','Orléans',45000,NULL,NULL,NULL),
(31,87,'Chemin Des Bateliers','Annecy',74000,NULL,NULL,NULL),
(32,66,'Avenue de Provence','VALLAURIS',06220,NULL,NULL,NULL),
(33,65,'Rue La Boétie','Paris',75014,NULL,NULL,NULL),
(41,380,'Rue Jacques Monod','Olivet',45160,NULL,NULL,NULL),
(42,575,'Rue des Platanes','Orléans',45000,NULL,NULL,NULL),
(43,12,'Rue Henri IV','Orléans',45100,NULL,NULL,NULL);




INSERT INTO `adresse_pro`(`id_Adresse`, `Cedex_Adresse`, `Num_Adresse`, `Rue_Adresse`, `Ville_Adresse`, `CP_Adresse`, `Num_Appart_Adresse`, `Etage_Adresse`, `Comp_Adresse`) 
VALUES 
(21,5,58,'Avenue des Tuileries','Paris',75000,NULL,NULL,NULL),
(22,NULL,97,'Rue du calvaire','Nantes',44000,NULL,NULL,NULL),
(23,NULL,8,'Rue de la République','Orléans',45000,NULL,NULL,NULL),
(41,NULL,380,'Rue Jacques Monod','Olivet',45160,NULL,NULL,NULL),
(42,NULL,575,'Rue des Platanes','Orléans',45000,NULL,NULL,NULL),
(43,NULL,12,'Rue Henri IV','Orléans',45100,NULL,NULL,NULL);


INSERT INTO `util`(`id_Util`, `Code_Etat_Connexion`, `Code_Type_Util`, `Login_Util`, `Pass_Util`) 
VALUES 
(11,1,1,'admin1','admin1'),
(12,1,1,'admin2','admin2'),
(13,1,1,'admin3','admin3'),
(21,1,2,'entreprise1','entreprise1'),
(22,1,2,'entreprise2','entreprise2'),
(23,1,2,'entreprise3','entreprise3'),
(31,1,3,'salarie1','salarie1'),
(32,1,3,'salarie2','salarie2'),
(33,1,3,'salarie3','salarie3'),
(41,1,4,'prestataire1','prestataire1'),
(42,1,4,'prestataire2','prestataire2'),
(43,1,4,'prestataire3','prestataire3');

INSERT INTO `administrateur`(`id_Util`, `Nom_Admin`, `Prenom_Admin`, `Tel_Admin`, `Mail_Admin`, `Login_Util`, `Pass_Util`) 
VALUES 
(41,'Rajaonarimampianina','Hery','0648271586','h.rajaonarimampianina@gmail.com','admin1','admin1'),
(42,'Rajaonarimampianina','Voahangy','0619745245','v.rajaonarimampianina@gmail.com','admin2','admin2'),
(43,'Solonandrasana','Olivier Mahafaly','0645727256','olivier-m.solonandrasana@gmail.com','admin3','admin3');

INSERT INTO `presta`(`id_Util`, `id_Adresse`, `Nom_Presta`, `Prenom_Presta`, `Sexe_Presta`, `Age_Presta`, `Societe_Presta`, `Tel_Presta`, `Mail_Presta`, `Login_Util`, `Pass_Util`) 
VALUES 
(41,41,'Tare','Guy','Homme',52,'Yamaha','0225225442','g.tare@yahoo.fr','prestataire1','prestataire1'),
(42,42,'Menvussa','Gérard','Homme',48,'Manomano','0282946834','g.menvussa@outlook.com','prestataire2','prestataire2'),
(43,43,'Cover','Harry','Homme',23,'Rustica','0295389468','harry.c@hotmail.fr','prestataire3','prestataire3');


INSERT INTO `ent_cliente`(`id_Util`, `id_Adresse`, `Nom_Ent`, `Tel_Ent`, `Web_Ent`, `Mail_Ent`, `Login_Util`, `Pass_Util`)
VALUES 
(21,21,'Sopra Steria','0238523737','soprasteria.com','contact@soprasteria.com','entreprise1','entreprise1'),
(22,23,'Atos','0238250101','fr.atos.net','contact@atos.net','entreprise2','entreprise2'),
(23,22,'CGI','0238568930','cgi.fr','contact@cgi.fr','entreprise3','entreprise3');

INSERT INTO `salarie`(`id_Util_Herite_Util`, `id_Util`, `id_Adresse`, `Nom_Sal`, `Prenom_Sal`, `Sexe_Sal`, `Age_Sal`, `Tel_Sal`, `Mail_Sal`, `Login_Util`, `Pass_Util`)
VALUES 
(31,21,21,'Brasseur','Iva','Femme',33,'0675723734','iva.brasseur@icloud.com','salarie1','salarie1'),
(32,22,23,'Bonami','Mathilde','Femme',21,'0687540249','bonamim@gmail.com','salarie2','salarie2'),
(33,23,22,'Brian','Sébastien','Homme',57,'0667253792','brian.sebastien@wanadoo.com','salarie3','salarie3');


INSERT INTO `adresse_perso_sal`(`id_Util_Herite_Util`, `id_Adresse`) 
VALUES 
(31,33),
(32,31),
(33,32);


INSERT INTO `service`(`id_Service`, `Code_Type_Service`, `id_Util`, `Lib_Service`, `Tarif_Service`, `Desc_Service`)
VALUES 
(411,1,41,'Babysitting',40.00,'Garde d\'enfant à domicile, quelque soit l\'adresse'),
(412,2,41,'Tous travaux',50.00,'Tous types de travaux, prestataire polyvalent'),
(424,4,42,'Courses Grandes Surfaces',20.00,'Courses alimentaires ou autres'),
(425,5,42,'Cuisine',80.00,'Cuisinier à votre disposition pour une soirée'),
(432,2,43,'Plomberie',00.00,'Plomberie, prix variable selon les circonstances'),
(433,3,43,'Réparation Automobile',500.00,'Vidange et entretien du véhicule');

INSERT INTO `bouquet`(`id_Bouquet`, `Lib_Bouquet`, `Tarif_Bouquet`) 
VALUES 
(1,'Basique',10.00),
(2,'Confort',40.00),
(3,'Premium',100.00);

INSERT INTO `contenu_bouquet`(`id_Service`, `id_Bouquet`)
VALUES 
(411,1),
(424,1),
(411,2),
(424,2),
(425,2),
(432,2),
(411,3),
(412,3),
(424,3),
(425,3),
(432,3),
(433,3);





INSERT INTO `abonnement`(`id_Abonnement`, `id_Bouquet`, `id_Util`, `Duree_Abonnement`, `Date_Debut_Abonnement`)
VALUES 
(1,2,23,3,NOW()),
(2,3,21,12,NOW()),
(3,3,22,5,NOW());







INSERT INTO `commande`(`id_Commande`, `Code_Etat_Commande`, `id_Facture`, `id_Service`, `id_Util_Herite_Util`, `Info_Comp_Commande`) 
VALUES 
(1,3,1,424,33,NULL),
(2,1,NULL,424,33,'Courses pour lundi'),
(3,2,NULL,433,31,'Golf 7 GTI'),
(4,1,NULL,424,32,'Enfant Asthmatique');







INSERT INTO `facture`(`id_Facture`, `id_Abonnement`, `Code_Etat_Facture`, `id_Commande`, `Code_Type_Facture`, `id_Util`, `id_Util_1`, `id_Util_Herite_Util`, `Info_Comp_Facture`) 
VALUES 
(1,NULL,2,1,2,42,NULL,33,NULL),
(2,1,1,NULL,1,NULL,21,NULL,'Facturation de l\'abonnement de Sopra Steria au bouquet Premium');



INSERT INTO `commentaire`(`Code_Commentaire`, `id_Service`, `id_Util_Herite_Util`, `Titre_Commentaire`, `Contenu_Commentaire`) 
VALUES 
(1,424,33,'Parfait!','Tous les achats sont là!');












