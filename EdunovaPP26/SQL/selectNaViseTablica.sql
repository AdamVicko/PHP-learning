
# Izlistajte sve grupe smjera
# PHP programiranje

select * from smjer;

select * from grupa where smjer=1;

select a.naziv as smjer, b.naziv as grupa
from smjer a 
inner join grupa b on a.sifra=b.smjer
where  a.naziv='PHP programiranje';

# Izlistati sve smjerove s pripadajućim grupama

# Unesite smjer Serviser
insert into smjer(naziv,cijena,certificiran,trajanje)
values ('Serviser',5000,false,100);


select a.naziv as smjer, b.naziv as grupa
from smjer a 
left join grupa b on a.sifra=b.smjer;


# Izvucite naziv smjer, naziv grupa i predavale
# smjera PHP programiranje

select a.naziv as smjer, 
b.naziv as grupa, 
d.ime, d.prezime 
from smjer a 
inner join grupa b on a.sifra=b.smjer
inner join predavac c on b.predavac=c.sifra
inner join osoba d on c.osoba =d.sifra 
where  a.naziv='PHP programiranje';

# Postavite Tomislav Jakopec kao predavača
# na grupu PP26

select b.sifra
from osoba a
inner join predavac b on a.sifra=b.osoba
where a.ime='Tomislav' and a.prezime='Jakopec';

update grupa set predavac=1
where naziv='PP26';

# Izlistajte sve polaznike smjera
# PHP programiranje

select e.ime, e.prezime
from smjer a
inner join grupa b on a.sifra =b.smjer 
inner join clan c on b.sifra =c.grupa 
inner join polaznik d on c.polaznik =d.sifra 
inner join osoba e on d.osoba =e.sifra
where
a.naziv ='PHP programiranje';

# osnovno
select a.naziv as smjer, b.naziv as grupa
from smjer a 
inner join grupa b on a.sifra=b.smjer;

# alternative

select smjer.naziv as smjer, grupa.naziv as grupa
from smjer 
inner join grupa  on smjer.sifra=grupa.smjer;

select smjer.naziv, grupa.naziv
from smjer, grupa
where smjer.sifra =grupa.smjer;


# BAZA KNJIŽNICA

# Izlistajte sve naslove kojima je 
# autor August Šenoa


# nastavno na prethdni zadatak
# dodajte u kojem mjestu su izdane knjige


# nastavno na prethdni zadatak
# dodajte koj izdavač je izdao te knjige



# BAZA SAKILA

# U kojim je sve filmovima glumio 
# BURT	POSEY



# Ispišite imena i prezimena kupaca
# koji su posuđivali filmove
# u kojima je glumio 
# BURT	POSEY



select distinct first_name  from customer
order by first_name desc
limit 15,5;