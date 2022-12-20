# minimalni oblik select naredbe
select now();

# funkcije
# https://mariadb.com/kb/en/built-in-functions/
select email(ime,prezime) as email from osoba;

DELIMITER $$
CREATE FUNCTION email(ime varchar(50), prezime varchar(50)) RETURNS varchar(255)
begin

return concat(left(lower(ime),1), lower(
replace(
replace(
replace(
replace(
replace(replace(upper(prezime),' ',''),'Č','C')
,'Š','S')
,'Đ','D')
,'Ć','C')
,'Ž','Z')
), '@edunova.hr');
end;
$$
DELIMITER ;


select now();

select adddate(now(),interval -90 day);

# broj otkucaja srca od Vašeg datuma rođenja
select datediff(now(),'1980-12-07 10:00:00') * 24 * 60 * 70;

select abs(TIMESTAMPDIFF(minute,now(),'1980-12-07 9:00:00')) * 70;

delete from clan where grupa in 
(select sifra from grupa where smjer=1);
delete from grupa where smjer=1;
delete from smjer where sifra=1;



# procedure

delimiter $$
create procedure brisismjer(in sifrasmjera int)
begin
	delete from clan where grupa in 
	(select sifra from grupa where smjer=sifrasmjera);
	delete from grupa where smjer = sifrasmjera;
	delete from smjer where sifra=sifrasmjera;
end;
$$
delimiter ;

call brisismjer(1);




create table logiranje(
tko varchar(255),
sto varchar(255),
kada datetime default now()
);

select * from logiranje;

drop trigger if exists osoba_unos;
delimiter $$
create trigger osoba_unos 
before insert on osoba for each row
begin
 insert into logiranje (tko,sto) values ('unos nove osobe', concat(new.ime,' ', new.prezime));
	
end
$$
delimiter ;

insert into osoba (ime,prezime,email) values ('Pero','Perić','email');

select * from osoba order by 1 desc limit 2;



delimiter $$
CREATE TRIGGER update_osoba
before update
   ON osoba FOR EACH ROW
BEGIN

insert into logiranje values('osoba promjena',concat(old.ime, ' - ', new.ime),now());

END$$

delimiter ;

update osoba set ime='Marica' where sifra=21;



delimiter $$
CREATE TRIGGER delete_osoba
after delete
   ON osoba FOR EACH ROW
BEGIN

insert into logiranje values('obrisao osobu',concat(old.ime, ' ', old.prezime),now());

END$$

delimiter ;

delete from osoba where sifra=21;

select * from osoba;

alter table osoba add aktivan boolean;

update osoba set aktivan=true;

select * from osoba where aktivan=true;

update osoba set aktivan=true where sifra=1;



# Obriši sve članove na smjeru JAVA programiranje
delete c
from smjer a
inner join grupa b on a.sifra =b.smjer 
inner join clan c on b.sifra =c.grupa 
where a.naziv='JAVA programiranje';


# Svim polaznicima na PHP programiranju
# imenu dodaj slovo J
update osoba a
inner join polaznik b on a.sifra =b.osoba 
inner join clan c on b.sifra =c.polaznik 
inner join grupa d on c.grupa =d.sifra 
inner join smjer e on d.smjer =e.sifra 
set
a.ime = concat(a.ime,'J'), d.naziv='VVV'
where e.naziv = 'PHP programiranje';

select * from smjer;

select * from osoba;

