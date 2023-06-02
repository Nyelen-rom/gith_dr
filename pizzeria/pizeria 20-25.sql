
DELIMITER //
drop trigger if exists prova_1//
create trigger prova_1 before insert on ingredients
for each row
begin
	update pizzes
    set preu = preu +20;
end;
//
insert into ingredients(nom, preu)
values('salsa bolonyesa',4.99);
select * from ingredients;
select * from pizzes;

DELIMITER //
drop trigger if exists prova_2//
create trigger prova_2 after insert on ingredients
for each row
begin
	update pizzes
    set preu = preu +20;
end;
//

-- ex _20
select id_ingredient from ingredients
where nom = 'Mozzarella';
DELIMITER //
drop trigger if exists ex_20//
create trigger ex_20 after insert on pizzes
for each row
begin
	declare V_ing int;
    
    select id_ingredient into v_ing
    from ingredients
	where nom = 'Mozzarella';
    
    insert into pizzes_ingredients values (new.id_pizza, v_ing);
end//
insert into pizzes(nom, preu, vegetariana)
values ('nova', 9.99, 'No');

-- ex_23
DELIMITER //
drop trigger if exists ex_23//
create trigger ex_23 before delete on ingredients
for each row
begin
	delete
    from pizzes_ingredients 
    where ingredient= old.id_ingredient;
end//

delete
from ingredients
where id_ingredient =5;
