-- ===========================
-- DADOS (amostra — 3 unidades, 6 meses)
-- ===========================
INSERT INTO unidades VALUES (1,'Unidade Centro', 'Fortaleza');
INSERT INTO unidades VALUES (2,'Unidade Aldeota', 'Fortaleza');
INSERT INTO unidades VALUES (3,'Unidade Sul', 'Fortaleza');

INSERT INTO medicos VALUES (1,'Dra. Camila Souza', 'Cardiologia');
INSERT INTO medicos VALUES (2,'Dr. Rafael Lima', 'Ortopedia');
INSERT INTO medicos VALUES (3,'Dra. Beatriz Alves', 'Clínico Geral');
INSERT INTO medicos VALUES (4,'Dr. João Pedro', 'Cardiologia');


INSERT INTO atendimentos  VALUES (1,1,1,'05/01/2026','Consulta',250);
INSERT INTO atendimentos  VALUES (2,1,2,'06/01/2026','Exame',180.00);
INSERT INTO atendimentos  VALUES (3,2,3,'06/01/2026','Consulta',200.00);
INSERT INTO atendimentos  VALUES (4,1,1,'12/01/2026','Consulta',250.00);
INSERT INTO atendimentos  VALUES (5,3,4,'15/01/2026','Emergencia',600.00);
INSERT INTO atendimentos  VALUES (6,2,3,'20/01/2026','Consulta',200.00);
INSERT INTO atendimentos  VALUES (7,1,2,'02/02/2026','Exame',180.00);
INSERT INTO atendimentos  VALUES (8,2,3,'04/02/2026','Consulta',200.00);
INSERT INTO atendimentos  VALUES (9,3,4,'10/02/2026','Emergencia',600.00);
INSERT INTO atendimentos  VALUES (10,1,1,'14/02/2026','Consulta',250.00);
INSERT INTO atendimentos  VALUES (11,1,1,'20/02/2026','Consulta',250.00);
INSERT INTO atendimentos  VALUES (12,2,3,'25/02/2026','Exame',150.00);
INSERT INTO atendimentos  VALUES (13,3,4,'01/03/2026','Emergencia',700.00);
INSERT INTO atendimentos  VALUES (14,1,2,'05/03/2026','Exame',180.00);
INSERT INTO atendimentos  VALUES (15,2,3,'10/03/2026','Consulta',200.00);
INSERT INTO atendimentos  VALUES (16,1,1,'15/03/2026','Consulta',260.00);
INSERT INTO atendimentos  VALUES (17,3,4,'22/03/2026','Emergencia',650.00);
INSERT INTO atendimentos  VALUES (19,1,2,'01/04/2026','Exame',190.00);
INSERT INTO atendimentos  VALUES (20,3,4,'15/04/2026','Emergencia',680.00);
INSERT INTO atendimentos  VALUES (21,1,1,'20/04/2026','Consulta',260.00);
INSERT INTO atendimentos  VALUES (22,2,3,'02/05/2026','Consulta',220.00);
INSERT INTO atendimentos  VALUES (23,3,4,'10/05/2026','Emergencia',700.00);
INSERT INTO atendimentos  VALUES (24,1,2,'15/05/2026','Exame',190.00);
INSERT INTO atendimentos  VALUES (25,1,1,'22/05/2026','Consulta',270.00);
INSERT INTO atendimentos  VALUES (26,2,3,'02/06/2026','Consulta',220.00);
INSERT INTO atendimentos  VALUES (27,3,4,'08/06/2026','Emergencia',720.00);
INSERT INTO atendimentos  VALUES (28,1,1,'15/06/2026','Consulta',270.00);

commit;