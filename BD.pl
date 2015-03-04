
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

menu :- tell('base.pl'), listing(animal(_,_)), told, consult('base.pl'), write('\n\t1- Agregar \n\t2- Borrar \n\t3- Consultar \n\t4 - Guardar\n\t5 - Salir \n\tingresa el numero de la opcion seguida de un punto: '),
	read(OP),
	opciones(OP).
	%%
opciones(1) :- agregar(), menu.
opciones(2) :- borrar(), menu.
opciones(3) :- consultar(), menu.
opciones(4) :- guardar(),menu.
opciones(5) :- write('Adios').
opciones(_) :- write('ingresa una ocion valida'), menu.

agregar() :- write('ingresa el nombre de un animal seguido de un punto'),
	read(Animal),write('ingresa el tipo de animal seguido de un punto'),
	read(Tipo),assert(animal(Animal,Tipo)),tell('base.pl'),listing(animal(_,_)),told; write('no se guardo nada').
guardar() :- tell('base.pl'),listing(animal),told.
borrar() :- write('ingresa el animal a borrar'), read(Animal),retract(animal(Animal));write('no existe ese registro: ').
consultar(1) :- read(Animal), listing(animal(Animal,_)); listing(animal(_,_)).
consultar(2) :- read(Tipo), listing(animal(_,Tipo)); listing(animal(_,_)).
consultar(_) :- write('1 - Animal \n 2 - tipo de animal'),read(OP),consultar(OP).
/*
--------------------------------------------------------------------------------info
%%
listing(capital_de).

%% hacer dinamicas las reglas de padre con 2 argumentos
dynamic padre/2.

%% insertar nuevas clausulas
assert(capital_de(df,mexico)).

%% cargar el archivo basedatos.pl para consultarlo
consult('basedatos.pl').

%% Borrar
retract(capital_de(X,Y)).

%%
tell('BD.pl'),
%%
listing(animal),
%%
told.
