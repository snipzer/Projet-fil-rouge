drop database bddV2;
create database bddV2;
use bddV2;

  drop table if exists user;
  create table user(
    idUser int not null auto_increment primary key,
    lastName varchar(25) not null,
    firstName varchar(25) not null,
    userName varchar(25) not null,
    password varchar(50) not null,
    mail varchar(50) not null,
    birthdate date not null,
    profilePicture varchar(100) not null,
    criticNumber int not null,
    isModo bool not null,
    isAdmin bool not null,
    isValid bool not null
  );

  drop table if exists serie;
  create table serie(
    idSerie int not null auto_increment primary key,
    title varchar(100) not null,
    description text,
    poster varchar(100),
    airsDayOfWeek varchar(25),
    airsTime varchar(25),
    isValid boolean not null
  );

  drop table if exists actor;
  create table actor(
    idActor int not null auto_increment primary key,
    name varchar(50) not null,
    picture varchar(100)
  );

  drop table if exists type;
  create table type(
    idType int not null auto_increment primary key,
    name varchar(25)
  );

  drop table if exists critic;
  create table critic(
    idCritic int not null auto_increment primary key,
    score float not null,
    content text not null,
    likeNumber int not null,
    dislikeNumber int not null,
    title varchar(25) not null,
    postedThe date not null,
    isValid bool not null,
    idUser int not null,
    idSerie int not null,
    constraint LiaisonCriticUser foreign key(idUser) references user(idUser),
    constraint LiaisonCriticSerie foreign key(idSerie) references serie(idSerie),
    constraint ScoreBetweenZeroAndTen check (score >= 0 and score <= 10)
  );

  drop table if exists criticNotation;
  create table criticNotation(
    idCriticNotation int not null auto_increment primary key,
    idCritic int not null,
    idUser int not null,
    isLike boolean not null,
    constraint LiaisonCriticToCriticNotation foreign key(idCritic) references critic(idCritic),
    constraint LiaisonUserToCriticNotation foreign key (idUser) references user(idUser)
  );

  drop table if exists favoris;
  create table favoris(
    idFavoris int not null auto_increment primary key,
    idSerie int not null,
    idUser int not null,
    constraint LiaisonFavorisSerie foreign key(idSerie) references serie(idSerie),
    constraint LiaisonFavorisUser foreign key(idUser) references user(idUser)
  );

  drop table if exists serieType;
  create table serieType(
    idSerieType int not null auto_increment primary key,
    idSerie int not null,
    idType int not null,
    creationDate date not null,
    modificationDate date not null,
    constraint LiaisonSerieTypeOnSerie foreign key(idSerie) references serie(idSerie),
    constraint LiaisonSerieTypeOnType foreign key(idType) references type(idType)
  );

  drop table if exists serieActor;
  create table serieActor(
    idSerieActor int not null auto_increment primary key,
    idSerie int not null,
    idActor int not null,
    role varchar(50),
    creationDate date not null,
    modificationDate date not null,
    constraint LiaisonSerieActorOnSerie foreign key(idSerie) references serie(idSerie),
    constraint LiaisonSerieActorOnActor foreign key(idActor) references actor(idActor)
  );

  drop table if exists episode;
  create table episode(
    idEpisode int not null auto_increment primary key,
    title varchar(50),
    desription text not null,
    episodeNumber varchar(15) not null,
    idSerie int not null,
    constraint LiaisonEpisodeSerie foreign key(idSerie) references serie(idSerie)
  );
