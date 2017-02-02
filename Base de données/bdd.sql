create database if not exists bddV2;
use bddV2;

drop table if exists utilisateur;
create table utilisateur(
  idUtilisateur int not null auto_increment primary key,
  nomUtilisateur varchar(25) not null,
  prenomUtilisateur varchar(25) not null,
  motDePasseUtilisateur varchar(50) not null,
  mailUtilisateur varchar(50) not null,
  telephoneUtilisateur varchar(12) not null,
  dateNaissance date not null,
  photoUtilisateur varchar(100) not null,
  nombreCritique int not null,
  boolEstModerateur bool not null,
  boolEstAdministrateur bool not null
);

drop table if exists serie;
create table serie(
  idSerie int not null auto_increment primary key,
  titreSerie varchar(50) not null,
  descriptionSerie text not null,
  posterSerie varchar(100)
);

drop table if exists acteur;
create table acteur(
  idActeur int not null auto_increment primary key,
  nomActeur varchar(25) not null,
  prenomActeur varchar(25) not null
);

drop table if exists genre;
create table genre(
  idGenre int not null auto_increment primary key,
  nomGenre varchar(20)
);

drop table if exists critique;
create table critique(
  idCritique int not null auto_increment primary key,
  note float not null,
  critique text not null,
  boolModerationOk bool not null,
  idUtilisateur int not null,
  idSerie int not null,
  constraint LiaisonCritiqueUtilisateur foreign key(idUtilisateur) references utilisateur(idUtilisateur),
  constraint LiaisonCritiqueSerie foreign key(idSerie) references serie(idSerie),
  constraint NoteCompriseEntreZeroEtDix check (note >= 0 and note <= 10)
);

drop table if exists likeCritique;
create table likeCritique(
  idLikeCritique int not null auto_increment primary key,
  compteurAime int not null,
  compteurAimePas int not null,
  ratioAime_AimePas float,
  idUtilisateur int not null,
  idCritique int not null,
  constraint LiaisonLikeCritiqueOnCritique foreign key(idCritique) references critique(idCritique),
  constraint LiaisonLikeCritiqueOnUtilisateur foreign key(idUtilisateur) references utilisateur(idUtilisateur)
);



drop table if exists favoris;
create table favoris(
  idFavoris int not null auto_increment primary key,
  idSerie int not null,
  idUtilisateur int not null,
  constraint LiaisonFavorisSerie foreign key(idSerie) references serie(idSerie),
  constraint LiaisonFavorisUtilisateur foreign key(idUtilisateur) references utilisateur(idUtilisateur)
);

drop table if exists liaison_serie_genre;
create table liaison_serie_genre(
  idLiaison_serie_genre int not null auto_increment primary key,
  idSerie int not null,
  idGenre int not null,
  constraint LiaisonSerieGenreOnSerie foreign key(idSerie) references serie(idSerie),
  constraint LiaisonSerieGenreOnGenre foreign key(idGenre) references genre(idGenre)
);

drop table if exists liaison_serie_acteur;
create table liaison_serie_acteur(
  idLiaison_serie_acteur int not null auto_increment primary key,
  idSerie int not null,
  idActeur int not null,
  constraint LiaisonSerieActeurOnSerie foreign key(idSerie) references serie(idSerie),
  constraint LiaisonSerieActeurOnActeur foreign key(idActeur) references acteur(idActeur)
);

drop table if exists saisons;
create table saisons(
  idSaison int auto_increment not null primary key,
  numeroSaison int not null,
  nombrEpisode int not null,
  idSerie int not null,
  constraint LiaisonSaisonSerie foreign key(idSerie) references serie(idSerie)
);

drop table if exists episode;
create table episode(
  idEpisode int not null auto_increment primary key,
  titreEpisode varchar(50),
  numeroEpisode varchar(15) not null,
  idSaison int not null,
  constraint LiaisonEpisodeSaison foreign key(idSaison) references saisons(idSaison)
);

drop table if exists ajout_modification_serie;
create table ajout_modification_serie(
  idAjoutModificationSerie int not null auto_increment primary key,
  titreModifier varchar(50) not null,
  descriptionModifier text not null,
  posterModifier varchar(100) not null,
  idSerie int not null,
  constraint LiaisonAjoutModificationSerieOnSerie foreign key(idSerie) references serie(idSerie)
);
