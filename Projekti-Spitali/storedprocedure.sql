-- stored procedure 1
delimiter $$
create procedure perqindja()
begin
select faturaID, p.pemri,cmimi, tvsh, cmimimetvsh,
(select concat(round(((tvsh / cmimi) * 100 ),2), '%')) as TVSHperqindja
from faturat, pacienti as p
where p.ssn=pacientSSN;
end$$  
DELIMITER ;
-- thirrja e stored procedure
call perqindja();

-- stored procedure 2
delimiter $$
create procedure PacientetQeKanQendruarNeSpital()
begin
select q.qendrimID, p.pemri as Emri_Pacientit, p.pmbiemri as Mbiemri_Pacientit, q.DataArdhjes, q.DataShkuarjes
from qendrimi as q, pacienti as p
where p.SSN = pacientssn;
end$$  
DELIMITER ;
-- thirrja e stored procedure
call PacientetQeKanQendruarNeSpital();

-- stored procedure 3
delimiter $$
 create procedure ListoPacientet()
 begin 
 select * from pacienti;
 end $$
 delimiter $$
 -- thirrja e stored procedure
 call ListoPacientet();
 
 
 -- stored procedure 4
delimiter $$
Create Procedure doktori_insert(p_Did int, p_Demri varchar(30),  p_Dmbiemri varchar(30),  p_Titulli varchar(30),
p_Dadresa varchar(60), p_Demail varchar(30),  p_Dtelefoni varchar(30), p_repartid int ,
p_Paga real)
begin
    Insert Into doktori( Did, Demri, Dmbiemri, Titulli,  Dadresa, Demail, Dtelefoni, Repartid, Paga)
    Values (p_Did, p_Demri,  p_Dmbiemri, p_Titulli, p_Dadresa, p_Demail,
    p_Dtelefoni, p_repartid, p_paga);
end $$
delimiter $$
-- thirrja
call doktori_insert (1021, 'Arberore', 'Zymeri', 'Gjinekologe', 'TringeSmajli/Prishtine/Kosove/10000', 
'arberorezymeri@gmail.com', '+38344785694/Fax:038965741', 6, 680);

 