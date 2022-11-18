

# ljestve (hash) je komentar i on se ne izvodi
# Izvođenje naredbi na serveru
# Otvoriti CMD
# Zaljepiti sljedeću naredbu bez prvog hash znaka
# c:\xampp\mysql\bin\mysql -uroot < C:\Users\dell\Documents\EdunovaPP26\SQL\skriptapp26.sql



drop database if exists edunovapp26;
create database edunovapp26;
use edunovapp26;

create table smjer(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18,2),
    upisnina decimal(18,2),
    trajanje int,
    certificiran boolean
);

create table grupa(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    maksimalnopolaznika int,
    datumpocetka datetime,
    smjer int,
    predavac int
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    email varchar(50),
    oib char(11)
);

create table polaznik(
    sifra int not null primary key auto_increment,
    brojugovora varchar(20),
    osoba int
);

create table predavac(
    sifra int not null primary key auto_increment,
    iban varchar(50),
    osoba int
);

create table clan(
    grupa int,
    polaznik int
);


alter table grupa add foreign key (smjer) references smjer(sifra);
alter table grupa add foreign key (predavac) references predavac(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);

alter table polaznik add foreign key (osoba) references osoba(sifra);

alter table predavac add foreign key (osoba) references osoba(sifra);

# C:\Users\Adam\Desktop\edunovapp26\SQL\skriptapp26.sql







