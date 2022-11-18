

# c:\xampp\mysql\bin\mysql -uroot < C:\Users\dell\Documents\EdunovaPP26\SQL\firma.sql


drop database if exists edunovapp26;
create database edunovapp26;
use edunovapp26;


create table projekt(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18,2)
);

create table sudjeluje(
    projekt int,
    programer int,
    datumpocetka datetime,
    datumkraja datetime
);

create table programer(
    sifra int not null primary key auto_increment,
    ime varchar(30),
    prezime varchar(50),
    datumrodenja date,
    placa decimal(18,2)
);

alter table sudjeluje add foreign key (projekt) references projekt(sifra);
alter table sudjeluje add foreign key (programer) references programer(sifra);
