Create database Hospital
go
use Hospital
go


create table departamentos(
  DepartamentosID Int primary key identity(1,1),
  nombreDepartamentos varchar(100),

);

CREATE  table personalmedico (
    PersonalMedicoID INT PRIMARY KEY,
    DepartamentosID Int,
    NombreDelPersonal varchar(100),
    ApellidoDelPersonal varchar(100),
	Especialidad varchar(150),
    foreign key (DepartamentosID) references departamentos(DepartamentosID)
);



create table personalAdministrativo (
    PersonalAdministrativoID INT PRIMARY KEY,
	DepartamentosID Int,
    NombreAdministrativo varchar(100),
    ApellidoAdministrativo varchar(100),
	foreign key (DepartamentosID) references departamento(DepartamentosID)

); 

create table  pacientes (
    PacientesID INT PRIMARY KEY,
    NombreDelPaciente varchar(100),
    ApellidoDelPaciente varchar(100),
	FechaNacimiento Date,
);

create table  historialmedico (
    HistorialMedicoID INT PRIMARY KEY,
	PacientesID Int,
    FechaConsulta Date,
	Diagnostico varchar(150),
	Tratamiento varchar(150),
	foreign key (PacientesID) references pacientes(PacientesID)

);

create table  procedimientos (
    ProcedimientosID INT PRIMARY KEY,
	PacientesID Int,
	PersonalMedicoID Int,
	FechaDeConsulta Date,
	TipoDeConsulta varchar(200),
	foreign key (PacientesID) references pacientes(PacientesID),
	foreign key (PersonalMedicoID) references personalmedico(PersonalMedicoID)
	); 

	
SELECT * FROM procedimientos

	INSERT INTO departamentos (DepartamentosID, nombreDepartamentos) VALUES (1, 'Psicologia'); 
	INSERT INTO departamentos (DepartamentosID, nombreDepartamentos) VALUES (2, 'Odontologia');


	INSERT INTO personalmedico (PersonalMedicoID, NombreDelPersonal, ApellidoDelPersonal) VALUES (1, 'Luka', 'Sandoval');
    INSERT INTO personalmedico (PersonalMedicoID, NombreDelPersonal, ApellidoDelPersonal) VALUES (2, 'María', 'González');

	INSERT INTO personalAdministrativo (NombreAdministrativo, ApellidoAdministrativo, DepartamentosID ) VALUES ( 'Lucia', 'Ochoa', '1');
    INSERT INTO personalAdministrativo (NombreAdministrativo, ApellidoAdministrativo,DepartamentosID) VALUES ( 'Raquel', 'Flores', '2');

	INSERT INTO pacientes (PacientesID, NombreDelPaciente, ApellidoDelPaciente, FechaNacimiento) VALUES (1, 'Ana', 'Mejia','1998-05-07');
    INSERT INTO pacientes (PacientesID, NombreDelPaciente, ApellidoDelPaciente, FechaNacimiento) VALUES (2, 'Zoe', 'Ruiz', '2000-05-08');

	INSERT INTO historialmedico (HistorialMedicoID, PacientesID, Diagnostico, Tratamiento) VALUES (1, 1, 'Apendicitis', 'Operacion');
    INSERT INTO historialmedico (HistorialMedicoID, PacientesID, Diagnostico, Tratamiento) VALUES (2, 2, 'Taquicardia', 'Medicamentos');

	INSERT INTO procedimientos(ProcedimientosID, PacientesID,  FechaDeConsulta, TipoDeConsulta) VALUES (1, 1, 1, '2024-02-09');
    INSERT INTO procedimientos (ProcedimientosID, PacientesID, FechaDeConsulta, TipoDeConsulta) VALUES (2, 2, 2, '2025-03-10');


