#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
CREATE DATABASE rstv;
USE rstv;


#------------------------------------------------------------
# Table: SERIE
#------------------------------------------------------------

CREATE TABLE SERIE(
        Id_Serie          int Auto_increment  NOT NULL,
        Titre_Serie       Varchar (50) NOT NULL,
        Description_Serie Text,
        Poster_Serie      Blob,
        PRIMARY KEY (Id_Serie)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: EPISODE
#------------------------------------------------------------

CREATE TABLE EPISODE(
        Id_Episode     int (11) Auto_increment  NOT NULL,
        Titre_episode  Varchar (50),
        Numero_Episode Varchar (4),
        Id_Saison      Int,
        PRIMARY KEY (Id_Episode)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: UTILISATEUR
#------------------------------------------------------------

CREATE TABLE UTILISATEUR(
        Id_Utilisateur        int (11) Auto_increment  NOT NULL,
        Pseudo_Utilisateur    Varchar (25) NOT NULL,
        Nom_Utilisateur       Varchar (25) NOT NULL,
        Prenom_Utilisateur    Varchar (25) NOT NULL,
        Mail_Utilisateur      Varchar (25) NOT NULL,
        Telephone_Utilisateur Varchar (12),
        Date_Naissance        Date NOT NULL,
        Photo_Utilisateur     Blob,
        Mot_passe_Utilisateur Varchar (25) NOT NULL,
        Id_moderateur         Int,
        PRIMARY KEY (Id_Utilisateur)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#------------------------------------------------------------
# Table: MODERATEUR
#------------------------------------------------------------

CREATE TABLE MODERATEUR(
        Id_moderateur  int (11) Auto_increment  NOT NULL ,
        bool_Est_Admin Bool NOT NULL,
        PRIMARY KEY (Id_moderateur)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: SAISONS
#------------------------------------------------------------

CREATE TABLE SAISONS(
        Id_Saison      int (11) Auto_increment  NOT NULL,
        Numero_Saison  Int NOT NULL,
        Nombre_Episode Int NOT NULL,
        Id_Serie       Int NOT NULL,
        PRIMARY KEY (Id_Saison)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: AJOUT_MODIFICATION_SERIES
#------------------------------------------------------------

CREATE TABLE AJOUT_MODIFICATION_SERIES(
        Id_Serie_a_ModifierAjouter int (11) Auto_increment  NOT NULL,
        Titre_modifier              Varchar (50),
        Description_Modifier        Text,
        Poster_Modifier             Varchar (25),
        Id_Serie                    Int,
        PRIMARY KEY (Id_Serie_a_ModifierAjouter)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: CRITIQUE
#------------------------------------------------------------

CREATE TABLE CRITIQUE(
        Id_Critique        int (11) Auto_increment  NOT NULL,
        Compteur_aime      Int NOT NULL,
        Compteur_Aime_Pas  Int NOT NULL,
        Note               Int NOT NULL,
        Critique           Text NOT NULL,
        Ratio_Aime_AimePas Float,
        Id_Utilisateur     Int NOT NULL,
        Id_Serie           Int NOT NULL,
        PRIMARY KEY (Id_Critique)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: GENRE
#------------------------------------------------------------

CREATE TABLE GENRE(
        Id_Genre  int (11) Auto_increment  NOT NULL ,
        Nom_Genre Varchar (25)NOT NULL,
        PRIMARY KEY (Id_Genre)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


#------------------------------------------------------------
# Table: APPARTIENT
#------------------------------------------------------------

CREATE TABLE APPARTIENT(
        Id_Appartient Int Auto_increment NOT NULL,
        Id_Serie Int NOT NULL,
        Id_Genre Int NOT NULL,
        PRIMARY KEY (Id_Appartient)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE EPISODE ADD CONSTRAINT FK_EPISODE_Id_Saison FOREIGN KEY (Id_Saison) REFERENCES SAISONS(Id_Saison);
ALTER TABLE UTILISATEUR ADD CONSTRAINT FK_UTILISATEUR_Id_moderateur FOREIGN KEY (Id_moderateur) REFERENCES MODERATEUR(Id_moderateur);
ALTER TABLE SAISONS ADD CONSTRAINT FK_SAISONS_Id_Serie FOREIGN KEY (Id_Serie) REFERENCES SERIE(Id_Serie);
ALTER TABLE AJOUT_MODIFICATION_SERIES ADD CONSTRAINT FK_AJOUT_MODIFICATION_SERIES_Id_Serie FOREIGN KEY (Id_Serie) REFERENCES SERIE(Id_Serie);
ALTER TABLE CRITIQUE ADD CONSTRAINT FK_CRITIQUE_Id_Utilisateur FOREIGN KEY (Id_Utilisateur) REFERENCES UTILISATEUR(Id_Utilisateur);
ALTER TABLE CRITIQUE ADD CONSTRAINT FK_CRITIQUE_Id_Serie FOREIGN KEY (Id_Serie) REFERENCES SERIE(Id_Serie);
ALTER TABLE APPARTIENT ADD CONSTRAINT FK_APPARTIENT_Id_Serie FOREIGN KEY (Id_Serie) REFERENCES SERIE(Id_Serie);
ALTER TABLE APPARTIENT ADD CONSTRAINT FK_APPARTIENT_Id_Genre FOREIGN KEY (Id_Genre) REFERENCES GENRE(Id_Genre);
