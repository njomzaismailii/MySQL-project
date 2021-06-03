-- trigger 1
 delimiter $$
create trigger PagaDoktoreve before insert on doktori
for each row
begin
if new.Paga<400
then signal sqlstate '45000'
set message_text= 'Nuk ka page me te vogel se 400e.';
end if;
end$$
delimiter $$

-- trigger 2
delimiter $$
create trigger termineteAnuluara before insert on terminet
for each row
begin
if new.statusi='anuluar' 
then signal sqlstate '45000'
set message_text = 'Termini juaja eshte i anuluar';
end if;
end $$
delimiter $$

