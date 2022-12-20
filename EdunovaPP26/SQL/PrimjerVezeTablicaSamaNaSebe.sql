

create table zaposlenik(
sifra int not null primary key,
ime varchar(50) not null,
nadredeni int
);

alter table zaposlenik add foreign
key (nadredeni) references 
zaposlenik(sifra);


insert into zaposlenik (sifra,ime,nadredeni)
values (1, 'Pero',null);
insert into zaposlenik (sifra,ime,nadredeni)
values (2, 'Marija',null);

insert into zaposlenik (sifra,ime,nadredeni)
values (3, 'Zvonko',1);


insert into zaposlenik (sifra,ime,nadredeni)
values (4, 'Đuro',2);

insert into zaposlenik (sifra,ime,nadredeni)
values (5, 'Perica',2);

insert into zaposlenik (sifra,ime,nadredeni)
values (6, 'Karica',5);

update zaposlenik set ime='Katica'
where sifra=6;

select * from zaposlenik
where nadredeni is null;

select * from zaposlenik
where nadredeni = 5;




