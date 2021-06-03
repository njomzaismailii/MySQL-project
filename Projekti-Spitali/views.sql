-- view 1
create view stomatologet_view as
select demri, titulli, dtelefoni
from doktori
where titulli like "stomatolog%";


-- view 2
create view Pacienti_Ne_Spital as
select q.pacientssn as ID_Pacientit, p.pemri as Emri_Pacientit, p.Pmbiemri as Mbiemri_Pacientit, r.blloku, r.kati, r.remri
from qendrimi as q , reparti as r, pacienti as p
where r.kati=q.kati and r.blloku=q.blloku and p.ssn=q.PacientSSN;


-- view 3
create view Reparti_njejte as
select d.Demri as Emri_Doktoreve, i.iEmri as Emri_Infermiereve, 
 (select remri from reparti 
    where repartid=i.iRepartID and repartid=d.repartid)  as Reparti
from infermier as i
inner join doktori as d where i.iRepartID=d.repartid
order by  reparti;

-- view 4
create view Pacientet_e_mitur as
select pemri as Emri_Pacientit, datalindjes 
from pacienti
where datalindjes>'2004-01-01';

-- view 5
create view Pacientet_me_grGjakutA as
select SSN, pemri as Emri_Pacientit, GrupiGjakut
from pacienti
where GrupiGjakut='A' and gjinia='M'
order by pemri asc;

-- view 6
create view Pacientet_me_alergji as
select SSN, pemri as Emri_Pacientit, ptelefoni as nr_Telefonit, Alergjite
from pacienti
where alergjite !='nuk ka';