
/*	Agregar/Modificar
	Borrar
	Consultar


	herbiboro
	insectivoro
	carnivoro
	omnivoro
	frugivero
*/
%% ------------------------------------------ %%
%% 		Nombre: Padilla Sainz Carlos Andres	  %%
%% 		Codigo: 209425551					  %%
%% 		Grado: 6 Ing.Computacion			  %%
%% ------------------------------------------ %%

menu :- consult('base.pl'), write('\n\t1- Agregar \n\t2- Borrar \n\t3- Consultar \n\t4 - Guardar\n\t5 - Salir \n\tingresa el numero de la opcion seguida de un punto:  '),
	read(OP),
	opciones(OP).
	%% diferentes opciones a elegir
opciones(1) :- agregar(),
	menu.
opciones(2) :- borrar(),
	menu.
opciones(3) :- consultar(0),
	menu.
opciones(4) :- guardar(),
	menu.
opciones(5) :- write('Adios').
opciones(_) :- write('ingresa una ocion valida: '),
	menu.

%% te da la opcion de agregar un animal  y su tipo
agregar() :- write('ingresa el nombre de un animal seguido de un punto: '),
	read(Animal),
	write('ingresa el tipo de animal seguido de un punto: '),
	read(Tipo),
	assert(animal(Animal,Tipo)),
	guardar();
	write('no se guardo nada ').

	%% te da la opcion de guardar  los datos de la bd
guardar() :- tell('base.pl'),
	listing(animal),
	told.
	%% borrar un registro
borrar() :- write('ingresa el animal a borrar: '),
	read(Animal),
	retract(animal(Animal)),
	guardar();write('no existe ese registro: ').
%% te permite consultar la regla "animal" por medio de 2 diferentes parametros
consultar(1) :- write('ingresa el nombre del animal: '),
	read(Animal),
	listing(animal(Animal,_));
	listing(animal(_,_)).
%% te permite consultar la regla "animal" por medio de 2 diferentes parametros
consultar(2) :- write('ingresa el tipo de animal: '),
	read(Tipo),
	listing(animal(_,Tipo));
	listing(animal(_,_)).
consultar(3) :- listing(animal(Animal,Tipo)),
	write(Animal),
	write(' --->'),
	write(Tipo).
%% te permite elegir que consultar
consultar(_) :- write('1 - Animal \n2 - tipo de animal \n3 - Todos los animales \n: '),
	read(OP),
	consultar(OP).
