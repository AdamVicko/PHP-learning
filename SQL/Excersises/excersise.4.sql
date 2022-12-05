#  c:\xampp\mysql\bin\mysql -uroot < C:\Users\Adam\Desktop\Repositories\PHP-learning\SQL\excersise.4.sql

drop database if exists edunovapp26;
create database edunovapp26;
use edunovapp26;


create table punac(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    majica varchar(46),
    jmbag char(11),
    novcica decimal(18,7),
    maraka decimal(12,6),
    ostavljen int
);

create table ostavljen(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(43),
    introvertno bit,
    kuna decimal(14,10)
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    treciputa datetime,
    haljina varchar(44),
    zena int
);

create table zena(
    sifra int not null primary key auto_increment,
    suknja varchar(39),
    lipa decimal(18,7),
    prstena int
);

create table becar(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8),
    kratkamajica varchar(48),
    bojaociju varchar(36),
    snasa int
);

create table prijatelj(
    sifr int not null primary key auto_increment,
    eura decimal(16,9),
    prstena int,
    gustoca decimal(16,5),
    jmbag char(11),
    suknja varchar(47),
    becar int
);

create table zena_mladic(
    sifra int not null primary key auto_increment,
    zena int,
    mladic int
);

create table mladic(
    sifra int not null primary key auto_increment,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura varchar(49),
    vesta varchar(34)
);


alter table zena_mladic add foreign key (mladic) references mladic (sifra);
alter table zena_mladic add foreign key (zena) references zena (sifra);
alter table prijatelj add foreign key (becar) references becar (sifra);
alter table becar add foreign key (snasa) references snasa (sifra);
alter table snasa add foreign key (zena) references zena (sifra);
alter table punac add foreign key (ostavljen) references ostavljen (sifra);


insert into becar(sifra,novcica,kratkamajica,bojaociju,snasa)
values 
(null,15.2,'Plava kratka majca','Plava',null),
(null,154.81,'Zuta kratka majca','Plava',null),
(null,5.2,'Pinki kratka majca','Plava',null)
;


insert into snasa(sifra,introvertno,treciputa,haljina,zena)
values 
(null,0,'2022-03-18 14:02:36','Plava haljina',null),
(null,1,'1999-10-25 04:29:38','Plava kratka haljina',null),
(null,0,null,'Plava jako kratka haljina',null),
(null,0,'2022-03-18 14:02:36','Plavbsxddbdfba haljina',null),
(null,1,'1999-10-25 04:29:38','Plava kratdbdbdtbdka haljina',null),
(null,0,null,'Plava jako kratka ojojojojo haljina',null)
;

insert into zena_mladic(sifra,zena,mladic)
values 
(null,null,null),
(null,null,null),
(null,null,null)