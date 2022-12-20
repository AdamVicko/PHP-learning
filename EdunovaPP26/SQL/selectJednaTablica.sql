

# prošli puta radili
select * from smjer;

# minimalni select
select 1;

# FILTRIRANEJ KOLONA - select lista

# 1. * daje sve kolone
select * from smjer;

# 2. nazivi kolona odvojeno zarezom
select naziv, cijena from smjer;
select naziv,cijena,naziv from smjer;

select *, naziv from smjer;

# 3. konstanta
select naziv, 500, 'Osijek' from smjer;

# koloni se može dati zamjensko ime
select naziv as smjer, 500 as broj
from smjer;

# 4. izraz

select naziv, 
rand() as koeficijent from smjer;


# izlistajte imena i prezimena osoba

select ime, prezime from osoba;

# izlistajte trenutni datum i vrijeme
select now();


# FILITRIRANJE REDOVA - where

# radili prošli puta
select * from smjer where sifra=1;

# operatori uspoređivanja 
# (=,<,>,<=,>=,!=)

select * from osoba
where sifra!=10;

# logički operatori (and, or, not) https://i.ytimg.com/vi/7dvqfpXEjdg/maxresdefault.jpg

# Ispiši sve polaznike koji su Marko Pavlović

select * from osoba
where ime='Marko' and prezime='Pavlović';

select * from osoba
where ime='Marko' and sifra=2;

# izlistaj sve osobe s imenom
# Marko ili Tomislav

select * from osoba
where ime='Marko' or ime='Tomislav';


select * from osoba
where not (ime='Marko' or ime='Tomislav');

# ostali operatori - sql operatori

# najčešče korišten: like

# sve osobe čije ime počinje s slovom T
select * from osoba
where ime like 'T%';

# Sve ženske osobe - s najmanjom greškom
select * from osoba
where ime like '%a';

# osobe koje u imenu iamju niz znakova va
select * from osoba
where ime like '%ar%';

# between

select * from grupa;

# dodajte dvije grupe 
# u godinama 2020 i 2021
insert into grupa 
(naziv,maksimalnopolaznika,smjer,datumpocetka)
values 
('PP25',20,1,'2020-05-16'),
('PP24',20,1,'2019-05-16');

select * from grupa
where datumpocetka >= '2020-01-01'
and datumpocetka <= '2020-12-31';

select * from grupa
where datumpocetka
between '2020-01-01' and '2020-12-31';


# in

select * from osoba
where sifra=1 or sifra=5 or sifra=7;

select * from osoba
where sifra in (1,5,7);

select * from osoba
where ime in ('Marko','Tomislav');

# is null, is not null

# sve grupe koje nemaju definiran datum početka
select * from grupa
where datumpocetka is null;

# BAZA mjesta

# izlistati sva mjesta iz 
# Osječko baranjske županije



# BAZA edunovapp26

# Unestite novog predavača
# Shaquille O'Neal   shaki@gmail.com


# BAZA mjesta

# Koliko mjesta u hrvatskoj bi bili
# pobjednici igre kaladont?


# Baza Knjižnica

# Izlistajte sve autore koji su rođeni
# 1980 godine


# Dečka je ostavila cura, jadan pati
# što bi mu preporučili za čitanje


# Izlistajte sve izdavače koji su 
# društvo s ograničenom odgovornošću


# Obrišite sve kataložne 
# zapise koji govore o smrti


# unesite sebe kao autora



