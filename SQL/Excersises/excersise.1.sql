#  c:\xampp\mysql\bin\mysql -uroot < C:\Users\Adam\Desktop\Repositories\PHP-learning\SQL\Excersises\excersise.1.sql

drop database if exists excersise;
create database excersise;
use excersise;

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno bit,
    haljina varchar(31) not null,
    maraka decimal(18,7),
    hlace varchar(46) not null,
    narukvica int
);

create table zena (
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(36) not null,
    haljina varchar(31),
    sestra int
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(36),
    hlace varchar(46),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(39),
    kuna decimal(16,8),
    drugiputa datetime,
    asocijalno bit,
    ekstrovertno bit,
    dukserica varchar(48),
    muskarac int
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int,
    svekar int
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40),
    prstena int,
    dukserica varchar(48),
    lipa decimal (13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41)
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5),
    gustoca decimal(18,6),
    lipa decimal(13,10),
    ogrlica int,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);



alter table zena add foreign key (sestra) references sestra(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table cura add foreign key (punac) references punac(sifra);



insert into sestra(sifra,haljina,hlace)
values
(1,'Ne nosi','Nosi'),
(2,'Ne nosi','Ne nosi'),
(3,'Nosi samo duge haljine preko koljena','Nosi'),
(4,'Ne nosi','Ne nosi jos'),
(5,'Nosi','Nnosi');

insert into zena(sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra)
values
(null,'2001-04-24 23-14-09','Ne nosi','Jako kratka majca','rzen57d8493','Zute oci','Uska haljina iznad koljena',1),
(null,'2001-04-24 05-47-48','Ne nosi puno','Jako kratka majca iznad brade','rzen57d8493','Zudddddddddte oci','Uska haljinaaaaaaaaaaaaaaa iznad koljena',2),
(null,'2001-11-05 13-14-09','Ne nosi','Jako kraddddddddtka majca','rzen57d8493','Zute oddddddddci','Uska haljinadddddddddddd iznad koljena',3);

insert into muskarac(sifra,bojaociju,hlace,modelnaocala,maraka,zena)
values(null,'Plavuskasta','Jako velike hlacice','Jako male naocale model dermatitis','225,49',1),
(null,'Tozu','Jako male hlacice','Jako male naocale model zumberackogorje','22,49',2),
(null,'Bijela','Nenosi hlace','Jako male naocale model Tuzla','356,00',3);

insert into mladic(sifra,suknja,kuna,ekstrovertno,dukserica,muskarac)
values
(null,'Ne nosi','15.20',1,'Uvijek nosi',1),
(null,'Ne nosi kad nemora','15000.00',0,'Nosi kad pada kisa',2),
(null,'Ne nosi','258.20',1,'Samo na potkusulju',3);

insert into svekar(sifra,dukserica)
values 
(1,'aaaaaaa'),
(2,'ddddddddddd'),
(3,'gggggggggg');

insert into sestra_svekar (sifra,sestra,svekar)
values
(null,1,1),
(null,2,2),
(null,3,3);

insert into punac(sifra)
values
(null),
(null),
(null);

insert into cura(punac)
values
(1),
(2),
(3);

update cura set gustoca=15.77;

delete from mladic 
where kuna>15.78;

select kratkamajica from zena
where hlace like'%ne%';

select a.dukserica , f.asocijalno , e.hlace 
from svekar a
inner join sestra_svekar b on a.sifra = b.svekar 
inner join sestra c on b.sestra = c.sifra 
inner join zena d on c.sifra = d.sestra 
inner join muskarac e on d.sifra = e.zena 
inner join mladic f on e.sifra = f.sifra 
where d.hlace like'a%' and c.haljina like'%ba%'
order by e.hlace desc;


select a.haljina , a.maraka 
from sestra a
left join sestra_svekar b on a.sifra = b.sestra 
where b.svekar is null ;


