/* =====================================================
   ACTIVIDAD 01 - LOGICA DE PREDICADOS Y PROLOG
   PROGRAMACION III
   ===================================================== */


/* =====================================================
   EJERCICIO 1 - ARBOL GENEALOGICO
   ===================================================== */


/* ---------- HECHOS DIRECTOS ---------- */

/* Abraham y Mona */

padre(abraham, herbert).
padre(abraham, homero).
padre(abraham, marge).

madre(mona, herbert).
madre(mona, homero).
madre(mona, marge).


/* Clancy y Jacqueline */

padre(clancy, patty).
padre(clancy, selma).

madre(jacqueline, patty).
madre(jacqueline, selma).


/* Homero y Marge */

padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).

madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).


/* Selma */

madre(selma, ling).


/* ---------- REGLA DE PROGENITOR ---------- */

progenitor(X, Y) :-
    padre(X, Y).

progenitor(X, Y) :-
    madre(X, Y).


/* ---------- REGLA DE HERMANOS ---------- */

hermano(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    X \= Y.


/* ---------- REGLA DE ABUELO ---------- */

abuelo(X, Y) :-
    padre(X, P),
    progenitor(P, Y).


/* ---------- REGLA DE ABUELA ---------- */

abuela(X, Y) :-
    madre(X, P),
    progenitor(P, Y).


/* ---------- REGLA DE NIETO ---------- */

nieto(X, Y) :-
    progenitor(Y, P),
    progenitor(P, X).


/* =====================================================
   EJERCICIO 2 - CORONEL WEST
   ===================================================== */


/* ---------- HECHOS ---------- */

estadounidense(west).

enemigo(corea_sur).

misil(misil1).
misil(misil2).

vendio(west, misil1, corea_sur).
vendio(west, misil2, corea_sur).


/* ---------- REGLA ---------- */

/*
   Un estadounidense que vende un misil
   a una nacion enemiga es criminal.
*/

criminal(X) :-
    estadounidense(X),
    vendio(X, Arma, Nacion),
    misil(Arma),
    enemigo(Nacion).


/* =====================================================
   CONSULTAS DE VALIDACION
   ===================================================== */

/*
   Ejecutar en SWI-Prolog:

   padre(abraham, homero).
   abuelo(abraham, bart).
   abuela(mona, bart).
   hermano(bart, lisa).
   hermano(lisa, maggie).
   nieto(bart, abraham).

   criminal(west).
*/
