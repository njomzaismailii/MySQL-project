-- query 1: Listoni të gjithë pacientët që janë nga qyteti i Prishtinës.

SELECT * FROM pacienti p WHERE p.padresa like '%Prishtine%';

-- query 2: Cilët pacientë (SSN-të dhe emrat e tyre) kanë paguar fatura në vlerë mbi 150 Euro?

SELECT p.SSN, p.Pemri from faturat f,pacienti p where f.PacientSSN=p.SSN and f.CmimiMeTVSH>150;


-- query3: Paraqitni të gjitha terminet e vizitave që janë caktuar për nesër për radiologji.

select * from terminet where datakohaterminit>=date_add("2020-12-13 00:00", INTERVAL 1 DAY) 
and datakohaterminit <=date_add("2020-12-13 23:59", INTERVAL 1 DAY)
and terminet.RepartID=5;

-- query 4: Listoni ID-të e doktorëve të cilët dje kanë pasur dy ose më shumë vizita ndërsa sot nuk kanë pasur asnjë vizitë.

select vizita.DoktorSSN from  (select v1.DoktorSSN from vizitat v1 where v1.datakohavizites>=date_sub("2020-12-17 00:00", INTERVAL 1 DAY) 
and v1.datakohavizites <=date_sub("2020-12-17 23:59", INTERVAL 1 DAY) group by(v1.DoktorSSN)
having count(v1.PacientSSN)>=2) as vizita where vizita.DoktorSSN not in(select v2.DoktorSSN  from vizitat v2 where v2.datakohavizites like '2020-12-17%'
group by(v2.DoktorSSN) having count(v2.PacientSSN)=0);



-- query 5: Listoni top 5 doktorët me numër maksimal të vizitave në 3 muajt e fundit. Lista të paraqes të dhënat e doktorit duke përfshirë edhe 
-- emrin e repartit ku punon dhe numrin e vizitave që ka realizuar.
 
SELECT v.DoktorSSN,d.Demri, d.Dmbiemri, r.remri, COUNT(*) AS NumriPacientave 
FROM vizitat v, doktori d, reparti r where v.doktorssn = d.did and r.repartID=d.repartid 
and v.datakohavizites>='2020-10-01 00:00' and v.datakohavizites<='2020-12-31 23:59'
GROUP BY DoktorSSN
ORDER BY NumriPacientave DESC
LIMIT 5;




-- query 6:  Për secilin repart paraqitni (në një listë të vetme):
--                                                               1. numrin e doktorëve që punojnë në atë repart,
--                                                               2. pagën mesatare,
--                                                               3. numrin e vizitave të realizuara në këtë vit,
--                                                               4. shumën e faturuar (vlerën pa TVSH dhe me TVSH) nga vizitat e realizuara në këtë vit,
--                                                               5. shumën e pagesave të realizuara në këtë vit.






select Table1.repartid, Table1.remri, Table1.numriDoktoreve, Table1.pagaMesatare, Table1.NumriVizitave,
sum(Table2.cmimi)as shumaFaturavePaTVSH,sum(Table2.cmimimetvsh) as shumaFaturaveMeTVSH, 
sum(Table2.shumaPaguar)as shumaPagesave
from
 (select T1.repartid,T1.remri,T1.numriDoktoreve,  T1.pagaMesatare,T2.NumriVizitave
   from (select R.repartid, R.remri ,count(D.did) as numriDoktoreve, AVG(D.Paga) as pagaMesatare
      from reparti R,doktori D where R.repartid=D.repartid
         group by(R.repartid))as T1
          left join
         (select R1.repartID ,  count(V.PacientSSN) as NumriVizitave
         from vizitat V, reparti R1
            where V.repartid=R1.repartid and year('2020-01-01') group by(R1.repartid))
              as T2 on T1.repartid=T2.repartid) as Table1
    left join       
    (select V1.repartID,F.PacientSSN, F.faturaid,F.cmimi,F.cmimimetvsh,P.shumaPaguar
     from faturat F,Vizitat V1, reparti R2,pagesat P
        where V1.repartID=R2.repartID and V1.PacientSSN=F.PacientSSN and F.cmimimetvsh=P.shumaPaguar and year('2020-01-01') group by(R2.repartid))
        as Table2 on Table1.repartid=Table2.repartid group by(Table1.repartid);




 










 