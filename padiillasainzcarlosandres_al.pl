
%% ------------------------------------------ %%
%% 		Nombre: Padilla Sainz Carlos Andres	  %%
%% 		Codigo: 209425551					  %%
%% 		Grado: 6 Ing.Computacion			  %%
%% ------------------------------------------ %%
:- dynamic lista/2.

lista(meses,[febrero, marzo, abril,mayo, junio]).
lista(colores,[azul, verde, amarillo, rojo]).
lista(animales,[perro, gato, pato]).
lista(figuras,[cuadrado, triangulo, rectangulo]).

menu :- write('\n\t1- concatenar \n\t2- comprobar \n\t3- buscar \n\t4 - insertar\n\t5 - eliminar \n\t6 - salir\n\tingresa el numero de la opcion seguida de un punto:   '),
	read(OP),
	opciones(OP).
	%% diferentes opciones a elegir
%% ejecuta las acciones para concatenar listas
opciones(1) :- write('ingresa el nombre de la primer lista a concatenar '),
	read(L1),
	write('ingresa el nombre de la segunda lista a concatenar '),
	read(L2),
	lista(L1,Datos1),
	lista(L2,Datos2),
	concatenar(Datos1,Datos2,L3),
	 write(L3),
	 menu.
%% ejecuta las acciones para revisar una lista especifica
opciones(2) :- comprobar(), menu.
%% ejecuta las acciones para buscar un dato
opciones(3) :- write('ingresa el dato a localizar '),
	 read(Dato),
 	write('ingresa el nombre de la lista '),
	read(LIname),
	lista(LIname,Datos),
	buscar(Dato,Datos),
	write('existe el dato en la lista '),
	menu.
%% ejecuta las acciones para insertar un dato
opciones(4) :- write('ingresa el dato a insertar '),
	read(D1),
	write('ingresa el nombre de la lista '),
	read(L1),
	lista(L1,Datos1),
	insertar(D1,Datos1,List),
	write(List), assert(lista(L1,List)),
	menu.
%% ejecuta las acciones para eliminar un dato
opciones(5) :- write('ingresa el dato a eliminar '),
	read(D1),
	write('ingresa el nombre de la lista '),
	read(L1),
	lista(L1,Datos1),
	eliminar(D1,Datos1,List),
	write(List),assert(lista(L1,List)),
	menu.
%% termina el programa
opciones(6) :- write('Adios ').
opciones(_) :- write('ingresa una ocion valida:  '), menu.


comprobar:- write('ingresa la lista que buscas '),
	 read(Lista),
 	listing(lista(Lista,Datos)),write(Datos).
%% pertenencia
buscar(X, [X|_]).
buscar(X, [_|Ys]):- buscar(X, Ys).
%% union d listas
concatenar([], L, L).
concatenar([X | L1], L2, [X | L3]) :- concatenar(L1, L2, L3).
%% insertar
insertar(X, Lista, Resultado) :- Resultado = [X | Lista].
insertar(X, Lista, [X | Lista]).
%% eliminar
eliminar(X, [X|L],L).
eliminar(X, [C|L], [C|LX]) :- eliminar(X, L, LX).

