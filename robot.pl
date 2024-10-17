% Estado inicial del robot (posición inicial, orientación inicial)
% orientaciones posibles: norte, este, sur, oeste
estado_inicial(0, 0, norte). 

% Comandos básicos:
% avanzar un paso en la dirección actual
avanzar(X, Y, norte, X, Y1) :- Y1 is Y + 1.
avanzar(X, Y, este, X1, Y) :- X1 is X + 1.
avanzar(X, Y, sur, X, Y1) :- Y1 is Y - 1.
avanzar(X, Y, oeste, X1, Y) :- X1 is X - 1.

% girar a la izquierda
girar_izquierda(norte, oeste).
girar_izquierda(oeste, sur).
girar_izquierda(sur, este).
girar_izquierda(este, norte).

% girar a la derecha
girar_derecha(norte, este).
girar_derecha(este, sur).
girar_derecha(sur, oeste).
girar_derecha(oeste, norte).

% Simulación del robot en Marte
% mover_robot(Comando, X_actual, Y_actual, Orientacion_actual, X_nueva, Y_nueva, Orientacion_nueva)
mover_robot(avanzar, X, Y, Orientacion, X_nueva, Y_nueva, Orientacion) :-
    avanzar(X, Y, Orientacion, X_nueva, Y_nueva).

mover_robot(girar_izquierda, X, Y, Orientacion, X, Y, Orientacion_nueva) :-
    girar_izquierda(Orientacion, Orientacion_nueva).

mover_robot(girar_derecha, X, Y, Orientacion, X, Y, Orientacion_nueva) :-
    girar_derecha(Orientacion, Orientacion_nueva).

% Ejecución de múltiples comandos en secuencia
% ejecutar_comandos(ListaComandos, X_inicial, Y_inicial, Orientacion_inicial, X_final, Y_final, Orientacion_final)
ejecutar_comandos([], X, Y, Orientacion, X, Y, Orientacion).
ejecutar_comandos([Comando | RestoComandos], X_actual, Y_actual, Orientacion_actual, X_final, Y_final, Orientacion_final) :-
    mover_robot(Comando, X_actual, Y_actual, Orientacion_actual, X_nueva, Y_nueva, Orientacion_nueva),
    ejecutar_comandos(RestoComandos, X_nueva, Y_nueva, Orientacion_nueva, X_final, Y_final, Orientacion_final).
