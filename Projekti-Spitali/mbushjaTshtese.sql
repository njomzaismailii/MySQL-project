-- mbushja e tabeles objektiSpitalit
insert into objektiSpitalit(Kati, Blloku) 
values (1, 'A'),
       (1, 'B'),
	   (1, 'C'),
       (2, 'A'),
       (2, 'B'),
       (2, 'C'),
	   (3, 'A'),
       (3, 'B'),
       (3, 'C'),
	   (4, 'A'),
	   (4, 'B'),
       (4, 'C');


-- mbushja e tabeles dhoma
-- duhet me bo ni trigger ose dicka per me tregu qe 1 eshte enxene, 0 eshte e lire
insert into Dhoma(NumriDhomes, Kati, Blloku, Statusi)
values (01, 1, 'B', true),
(02, 1, 'B',  true),
(03, 1, 'B',  true),
(04, 1, 'B',  true),
(05, 1, 'B',  true),
(06, 1, 'B', false),
(09, 2, 'A',  true),
(10, 2, 'A', false),
(11, 2, 'B', true),
(12, 2, 'B',  true),
(13, 2, 'C',  true),
(14, 2, 'C',  true),
(15, 3, 'A',  true),
(16, 3, 'B',  true),
(17, 4, 'A',  true),
(18, 4, 'A',  true),
(19, 4, 'B',  true),
(20, 4, 'B', false);



-- mbushja e tabeles qendrimi
insert into Qendrimi(QendrimID, PacientSSN, NumriDhomes, Kati, Blloku,  DataArdhjes, DataShkuarjes)
values 
('Q001', '003', 01, 1, 'B', '2020-12-05', '2020-12-17'),
('Q002', '005', 05, 1, 'B', '2020-12-10', '2020-12-20'),
('Q003', '006', 09, 2, 'B', '2020-12-12', '2020-12-20'),
('Q004', '008', 09, 2, 'A', '2020-12-22', null),
('Q005', '009', 11, 3, 'A', '2020-12-10', '2020-12-19'),
('Q006', '011', 03, 1, 'B', '2020-12-20', null),
('Q007', '012', 01, 2, 'C', '2020-12-16', '2020-12-20'),
('Q008', '013', 02, 2, 'C', '2020-12-16', '2020-12-20'),
('Q009', '014', 02, 1, 'B', '2020-12-14', '2020-12-18'),
('Q010', '015', 01, 4, 'A', '2020-12-21', null),
('Q011', '016', 13, 2, 'B', '2020-12-12', '2020-12-22'),
('Q012', '017', 14, 4, 'B', '2020-12-22', null),
('Q013', '018', 19, 3, 'B', '2020-12-12', '2020-12-15'),
('Q014', '019', 04, 1, 'B', '2020-12-14', '2020-12-21'),
('Q015', '020', 01, 4, 'A', '2020-12-17', null);
