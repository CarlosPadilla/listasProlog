%% ------------------------------------------ %%
%% Nombre: Padilla Sainz Carlos Andres		  %%
%% Codigo: 209425551						  %%
%% Grado: 6 Ing.Computacion					  %%
%% ------------------------------------------ %%

/* el menu es ejecutado manualmente al compilar el archivo mostrando al usuario todas las opciones disponibles y la posibilidad de elegir una*/
menu :- write('elige una opcion \n\t1 - circulo \n\t2 - triangulo \n\t3 - pentagono \n\t4 - trapecio \n\t5 - rombo \n\t6 - salir\n'),
read(OP)
,ejecuta(OP).

/*
	si el usuario ingresa el numero 1
	este ejecuta el procedimiento para
	calcular el area de un circulo
*/
ejecuta(1) :- circulo, menu.
%% hace el mismo procedimiento para las siguientes opciones
ejecuta(2) :- triangulo, menu.
ejecuta(3) :- pentagono, menu.
ejecuta(4) :- trapecio, menu.
ejecuta(5) :- rombo, menu.
%% si la opcion elegida es 6 esta opcion no ejecuta nada y termina la ejecucion
ejecuta(6) :- write('BYE'), true.
/*
	si la opcion no es ninguna de las anteriores,
	solo se muestra un mensaje
	y se ejecuta de nuevo el menu.
*/
ejecuta(_) :- write("esa opcion no existe "), menu.

%% calcula el area de un circulo
circulo() :- write('ingresa el radio: '),
%% obtenemos el radio
read(RADIO),
nl,
%% multiplicamos radio por pi^2 para obtener el area
RESULT is pi*((RADIO)**(2)),
%% imprimimos el resultado de la operacion.
write(RESULT),
nl.

%% PARA EL RESTO DE LOS PROCEDIMIENTOS LOS PASOS SON IGUALES O MUY PARECIDOS...

%% calcula el area de un triangulo
triangulo() :- write('ingresa altura: '),
read(LADOA),
write('ingresa base: '),
read(LADOB),
nl,
RESULT is (LADOB * LADOA) / 2,
write(RESULT),
nl.

%% area de un pentagono
pentagono() :- write('ingresa un lado: '),
read(LADO),
write('ingresa la medida desde el centro a un arista: '),
read(RADIO),
C is ((LADO)**(2) + (RADIO)**(2)),
APOTEMA is (C)**(1/2),
RESULT is (APOTEMA * (5 * LADO))/2,
write(RESULT),nl.

%%  area de un trapecio
trapecio() :- write('ingresa la base mayor: '),
read(LMAYOR),
write('ingresa la base menor: '),
read(LMENOR),
write('ingresa la altura: '),
read(ALTURA),
RESULT is ((LMAYOR + LMENOR)*ALTURA)/2,
write(RESULT),nl.

%% area de un rombo
rombo() :- write('ingresa la Diagonal mayor: '),
read(LMAYOR),
write('ingresa la Diagonal menor: '),
read(LMENOR),
RESULT is (LMAYOR * LMENOR)/2,
write(RESULT),nl.

/*
cateto(LADOA, Hipotenusa):-
C is ((LADOA)**(2) + (Hipotenusa)**(2)),
RESULT is (C)**(1/2),
RESULT.
*/
