#  c:\xampp\mysql\bin\mysql -uroot < C:\Users\Adam\Desktop\Repositories\PHP-learning\SQL\Excersises\excersise.6.sql
drop database if exists excersise;
create database excersise;
use excersise;

create table prijatelj(
    sifra int not null primary key auto_increment,
    haljina varchar(35),
    prstena int not null,
    introvertno bit,
    stilfrizura varchar(36) not null
);

create table prijatelj_ostavljena (
    sifra int not null primary key auto_increment,
    prijatelj int,
    ostavljena int
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    kratkamajica varchar(39) not null,
    drugiputa datetime,
    maraka decimal(14,10)
);

create table brat(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    treciputa datetime not null,
    narukvica int not null,
    hlace varchar(31),
    prijatelj int
);

create table zena(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8) not null,
    narukvica int not null,
    dukserica varchar (40) not null,
    haljina varchar (30),
    hlace varchar(32),
    brat int
);

create table decko(
    sifra int not null primary key auto_increment,
    prviputa datetime,
    modelnaocala varchar(41),
    nausnica int,
    zena int
);

create table svekrva(
    sifra int not null primary key auto_increment,
    hlace varchar(48) not null,
    suknja varchar(42) not null,
    ogrlica int not null,
    treciputa datetime not null,
    dukserica varchar(32) not null,
    narukvica int not null,
    punac int
);

create table punac(
    sifra int not null primary key auto_increment,
    ekstrovertno bit not null,
    suknja varchar(30) not null,
    majica varchar(44) not null,
    prviputa datetime not null
);


alter table prijatelj_ostavljena add foreign key (prijatelj) references prijatelj (sifra);

alter table prijatelj_ostavljena add foreign key (ostavljena) references ostavljena (sifra);

alter table zena add foreign key (brat) references brat (sifra);

alter table decko add foreign key (zena) references zena (sifra);

alter table svekrva add foreign key (punac) references punac (sifra);

alter table brat add foreign key (prijatelj) references prijatelj (sifra);

insert into prijatelj(sifra,prstena,stilfrizura)
values
(null,3,'Tomahawk'),
(null,1,'Celav'),
(null,219,'Irokeza')
;

insert into brat(sifra,nausnica,treciputa,narukvica)
values 
(null,3,'2021-10-19 12:34:04',0),
(null,5,'2015-01-24 11:39:10',5),
(null,0,'2019-11-18 10:43:00',0)
;


insert into zena(sifra,novcica,narukvica,dukserica)
values 
(null,'1589.24',2,'Dukserica je uvijek poderana'),
(null,'189.78',0,'Dukserica nije njegova'),
(null,'26457.20',7,'Uvijek zaprljana')
;

insert into svekrva(sifra,hlace,suknja,ogrlica,treciputa,dukserica,narukvica)
values
(null,'Jako kratke hlace','Samo dugacke suknje',18,'2020-07-14 16:45:02','Ne nosi dukserice',2),
(null,'Uske hlace','Samo sarene suknje',1,'2021-04-04 12:35:22','Samo roze dukserice',7),
(null,'Jako kratke hlace s cvijetekima','Ne nosi suknje',8,'1995-08-24 10:55:02','Dugacke sa visokim ovratnikom',14)
;

insert into punac(sifra,ekstrovertno,suknja,majica,prviputa)
values
(null,1,'Ne nosi on suknje','Samo tank top','2011-04-12 21:41:13'),
(null,0,'Ne nosi on suknje','Samo zute','2010-07-12 20:37:02'),
(null,1,'Ne nosi on suknje','Samo tamne','2001-05-12 01:51:59')
;

insert into ostavljena(sifra,prviputa,kratkamajica,drugiputa)
values
(null,'2005-11-03 19:45:37','Nosi kad nema nista drugo','2009-01-27 09:27:17'),
(null,'2007-06-14 14:57:31','Uvijek tamne boje','2009-07-17 14:22:48'),
(null,'2002-01-05 04:45:54','Kosulja','2009-08-04 07:20:10')
;

insert into prijatelj_ostavljena(sifra,prijatelj,ostavljena)
values
(null,1,2),
(null,2,1),
(null,3,3)
;

insert into decko(sifra,zena)
values 
(null,1),
(null,2),
(null,3)
;

update svekrva set suknja = 'Osijek';

delete from decko where modelnaocala < 'ab';

select narukvica from brat
where treciputa is null ;

select a.drugiputa , g.zena , f.narukvica 
from ostavljena a
inner join prijatelj_ostavljena b on a.sifra = b.ostavljena 
inner join prijatelj c on b.prijatelj = c.sifra 
inner join brat d on c.sifra = d.prijatelj 
inner join zena f on d.sifra = f.brat 
inner join decko g on f.sifra = g.zena 
where d.treciputa is not null and c.prstena=219
order by f.narukvica desc;

select a.prstena , a.introvertno 
from prijatelj a 
left join prijatelj_ostavljena b on b.prijatelj = a.sifra
where b.prijatelj is null;