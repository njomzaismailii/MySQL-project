-- funksioni 1
delimiter $$
create function CmimiPlote(x real)
returns real 
deterministic
begin 
return x+(x*16/100);
end; $$
delimiter $$


-- funksioni 2
delimiter $$
create function TVSH(x real)
returns real 
deterministic
begin 
return (x*16/100);
end; $$
delimiter $$


