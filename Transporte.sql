
create table Empresa
(
	
	nome_empresa varchar(50) not null,--Paraty
	nome_site varchar(50) not null,--www.paraty.com
	end_localidade varchar(20)not null,--Araraquara
	end_logradouro varchar (30) not null,--Av.Mario Jose
	end_numero int not null,--123
	end_complemento varchar(20),--Proximo a Cultrale
	end_bairro varchar(20)not null,--Sao José
	end_cep char(8) not null,--14800420
	end_uf char(2) not null,--SP
	constraint pk_nome_empresa primary key(nome_empresa)	
);

INSERT INTO Empresa 
		(nome_empresa, nome_site, end_localidade, end_logradouro, 
			end_numero, end_complemento, end_bairro, end_cep, end_uf)
values ('Paraty', 'www.paraty.com', 'Araraquara','Av.Mario Jose',
			123, 'Proximo a Cultrale', 'Sao José', '14800420','SP');

INSERT INTO Empresa 
		(nome_empresa, nome_site, end_localidade, end_logradouro, 
			end_numero, end_complemento, end_bairro, end_cep, end_uf)
values ('Cometa', 'www.cometa.com', 'Araraquara','Av.Jose MArio',
			456, 'Proximo a Lupo', 'Lupo', '14800400','SP');



select * from Empresa;


create table NomeLinha
(
	nome_empresa varchar(50) not null,
	nome_linha varchar(50) not null,
	constraint pk_nome_linha primary key(nome_linha),
	constraint fk_nome_empresa foreign key(nome_empresa) references Empresa(nome_empresa),
);


INSERT INTO NomeLinha(nome_empresa, nome_linha) values ('Paraty','Aguas do Paiol');
INSERT INTO NomeLinha(nome_empresa, nome_linha) values ('Paraty','Fonte');
INSERT INTO NomeLinha(nome_empresa, nome_linha) values ('Cometa','Sao Jose');
INSERT INTO NomeLinha(nome_empresa, nome_linha) values ('Cometa','Centro');

select * from NomeLinha
where nome_empresa = 'Paraty';




create table QuadroHorario
(
	
	nome_linha_horario varchar(50) not null,
	horario char(5) not null,
	dia_semana varchar(15) not null,
	constraint pk_nome_linha_horaio primary key(nome_linha_horario, horario, dia_semana),
	constraint fk_nome_linha_horario foreign key(nome_linha_horario) references NomeLinha(nome_linha)
);


select * from QuadroHorario
where nome_linha_horario = 'Aguas do Paiol' order by dia_semana, horario asc;

select * from QuadroHorario
where nome_linha_horario = 'Fonte' order by dia_semana, horario asc;


--dias uteis fonte
INSERT INTO QuadroHorario values ('Fonte','05:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','06:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','06:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','07:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','07:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','08:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','08:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','09:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','09:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','10:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','10:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','11:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','11:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Fonte','12:00','Dias Uteis');


--sabados fonte
INSERT INTO QuadroHorario values ('Fonte','05:50','Sabado');
INSERT INTO QuadroHorario values ('Fonte','06:50','Sabado');
INSERT INTO QuadroHorario values ('Fonte','07:50','Sabado');
INSERT INTO QuadroHorario values ('Fonte','08:50','Sabado');
INSERT INTO QuadroHorario values ('Fonte','09:50','Sabado');

--domingos/feriados fonte

INSERT INTO QuadroHorario values ('Fonte','08:00','Domingo/Feriado');
INSERT INTO QuadroHorario values ('Fonte','09:00','Domingo/Feriado');
INSERT INTO QuadroHorario values ('Fonte','10:00','Domingo/Feriado');

--dias uteis paiol

INSERT INTO QuadroHorario values ('Aguas do Paiol','05:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','06:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','06:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','07:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','07:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','08:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','08:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','09:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','09:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','10:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','10:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','11:00','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','11:30','Dias Uteis');
INSERT INTO QuadroHorario values ('Aguas do Paiol','12:00','Dias Uteis');


--sabados paiol
INSERT INTO QuadroHorario values ('Aguas do Paiol','05:50','Sabado');
INSERT INTO QuadroHorario values ('Aguas do Paiol','06:50','Sabado');
INSERT INTO QuadroHorario values ('Aguas do Paiol','07:50','Sabado');
INSERT INTO QuadroHorario values ('Aguas do Paiol','08:50','Sabado');
INSERT INTO QuadroHorario values ('Aguas do Paiol','09:50','Sabado');

--domingos/feriados paiol

INSERT INTO QuadroHorario values ('Aguas do Paiol','08:00','Domingo/Feriado');
INSERT INTO QuadroHorario values ('Aguas do Paiol','09:00','Domingo/Feriado');
INSERT INTO QuadroHorario values ('Aguas do Paiol','10:00','Domingo/Feriado');



create table Itinerario 
(
	
	logradouro varchar(50) not null,
	nome_linha_itinerario varchar(50) not null,
	nome_empresa_itinerario varchar(50) not null,
	
	constraint pk_itinerario primary key(logradouro,nome_linha_itinerario,nome_empresa_itinerario),	
	constraint fk_nome_linha_itinerario foreign key(nome_linha_itinerario) references NomeLinha(nome_linha),
	constraint fk_nome_empresa_itinerario foreign key(nome_empresa_itinerario) references Empresa(nome_empresa)
);


INSERT INTO Itinerario values ('Av. Augusto Bernardi','Aguas do Paiol','Paraty');
INSERT INTO Itinerario values ('Rua Lino Morgante','Aguas do Paiol','Paraty');
INSERT INTO Itinerario values ('Av. Miguel Pocce', 'Aguas do Paiol','Paraty');
INSERT INTO Itinerario values ('Av. José Barbanti ', 'Aguas do Paiol','Paraty');
INSERT INTO Itinerario values ('Av. Antônio Honório Real', 'Aguas do Paiol','Paraty');
INSERT INTO Itinerario values ('Av. Prof° Gustavo ', 'Aguas do Paiol','Paraty');
INSERT INTO Itinerario values ('Rua Bento Machado ', 'Aguas do Paiol','Paraty');
INSERT INTO Itinerario values ('Av. Portugal, TCI.', 'Aguas do Paiol','Paraty');








INSERT INTO Itinerario values ('Rua Jose Carlos','Fonte','Cometa');
INSERT INTO Itinerario values ('Rua Mario Sena','Fonte','Cometa');
INSERT INTO Itinerario values ('Rua arlos Cezar', 'Fonte','Cometa');
INSERT INTO Itinerario values ('Av Magna Solo', 'Fonte','Cometa');
INSERT INTO Itinerario values ('Av Jose Martins', 'Fonte','Cometa');




select * from Itinerario
where nome_empresa_itinerario = 'Paraty';

select * from Itinerario
where logradouro = 'Rua Mario Ybarra';


select * from Itinerario
where logradouro = 'Rua Jose Carlos';

select * from Itinerario
where nome_empresa_itinerario = 'Cometa'