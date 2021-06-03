create database Projekti;
USE Projekti;

create table Pacienti(
SSN char(10),
Pemri VARCHAR(40) not null ,
Pmbiemri VARCHAR(40) not null,
Gjinia CHAR(1) not null,
Pemail VARCHAR(35) not null,
Padresa VARCHAR(55) not null,
Datalindjes date not null,
Ptelefoni VARCHAR(40) not null,
EmriPrindit VARCHAR(30) not null,
GrupiGjakut CHAR(2) not null,
Alergjite VARCHAR(70),
PRIMARY KEY(SSN)
);

show triggers;

create table Doktori(
Did integer ,
Demri varchar(30) not null,
Dmbiemri varchar(30) not null,
Titulli varchar(30) not null,
Dadresa varchar(60) not null,
Demail varchar(30) not null,
Dtelefoni varchar(30) not null,
repartid integer not null,
Paga real not null,
PRIMARY KEY(Did),
Foreign key(repartid, Paga) references Reparti(repartid, PagaeDoktorit)
);

create table Reparti(
repartID integer not null,
rEmri VARCHAR(50) not null,  
Kati integer, 
Blloku char(2), 
PagaeDoktorit real not null,
PRIMARY KEY(repartid,PagaeDoktorit)
);

create table Terminet (
TerminID varchar(10) not null,
PacientiSSN char(10) not null,
DataKohaTerminit datetime not null,
RepartID integer,
Statusi varchar(10),
Primary key(TerminID),
Foreign key(PacientiSSN) references Pacienti(SSN),
Foreign key(RepartID) references Reparti(repartid)
on delete cascade
);

CREATE TABLE Infermier (
    InfermierId VARCHAR(10) NOT NULL,
    iEmri VARCHAR(30) NOT NULL,
    iMbiemri VARCHAR(30) NOT NULL,
    iAdresa VARCHAR(50) NOT NULL,
    iQyteti VARCHAR(50) NOT NULL,
    iShteti VARCHAR(50) NOT NULL,
    iTelefoni VARCHAR(200) NOT NULL,
    iRepartID INTEGER,
    iPaga REAL NOT NULL,
    PRIMARY KEY (InfermierId),
    FOREIGN KEY (iRepartID) REFERENCES Reparti (repartid)
);

create table Vizitat(
PacientSSN char(10) not null,
TerminID varchar(10) not null,
DoktorSSN integer not null,
InfermierID varchar(10),
vDiagnoza varchar(500),
vTerapia varchar(500), 
DataKohaVizites datetime not null,
Primary key(PacientSSN,DataKohaVizites),
foreign key (PacientSSN) references Pacienti(SSN),
foreign key (DoktorSSN) references Doktori(did),
foreign key (InfermierID) references Infermier(InfermierID),
foreign key (TerminID) references Terminet(TerminID)
);

create table Faturat(
FaturaID varchar(10),
PacientSSN char(10),
Cmimi real,
TVSH real,
CmimiMeTVSH real,
DataKohaFaturimit datetime,
DataKohaVizites datetime,
primary key(FaturaID),
foreign key (PacientSSN, DataKohaVizites)
references Vizitat(PacientSSN,DataKohaVizites)
);


create table Pagesat(
PagesaID varchar(10) not null,
FaturatID varchar(10),
MenyraPageses varchar(25),
ShumaPaguar real(6,2),
DataKohaPageses datetime,
primary key (PagesaID),
Foreign key(FaturatID) references Faturat(FaturaID)
);

drop table pagesat;
create table ObjektiSpitalit(
Kati integer not null, 
Blloku char(1) not null,
primary key (kati,blloku)
);

create table Dhoma(
NumriDhomes integer not null, 
Kati integer not null,
Blloku char(1) not null, 
Statusi Boolean,
primary key(NumriDhomes),
foreign key(Kati,Blloku) references ObjektiSpitalit(kati, blloku)
);

create table Qendrimi(
QendrimID char(4) not null, 
PacientSSN char(10) NOT NULL,
NumriDhomes integer, 
Kati integer, 
Blloku char(1),  
DataArdhjes date, 
DataShkuarjes date NULL DEFAULT NULL,
primary key(QendrimID),
foreign key(PacientSSN) references pacienti(SSN),
foreign key(NumriDhomes) references Dhoma(NumriDhomes),
foreign key(Kati,Blloku) references ObjektiSpitalit(kati, blloku)
);




