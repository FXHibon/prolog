/* taille de la grille */
longueur_grille(10).
/* Emplacement de l'objectif */
index_objectif(14).

/* initialise la grille avec 1 pour les (le) robots et 2 pour les obstacles (sans obstacles pour le moment)*/
init_grille([], _, 0).
init_grille([1|R], 0, Len) :- NewLen is Len - 1, init_grille(R, -1, NewLen), !.
init_grille([2|R], -5, Len) :- NewLen is Len - 1, init_grille(R, -6, NewLen), !.
init_grille([0|R], Depart, Len) :- NewLen is Len - 1, NewDepart is Depart - 1, init_grille(R, NewDepart, NewLen).

/* affiche la grille */
affiche_grille(E) :- affiche_grille(E, 1).
affiche_grille([], _).
affiche_grille([L|R], I) :- longueur_grille(Len), Reste is I mod Len, Reste == 0, write(L),write(', '), nl, NI is I + 1, affiche_grille(R, NI), !.
affiche_grille([L|R], I) :- write(L), write(','), NI is I + 1, affiche_grille(R, NI).

/* la liste est en une dimesion, la méthode get_coords permet de transformer une coordonée x,y (deux dimesions) en coordonée de liste (une dimesion)*/
get_coords(I, X, Y) :- longueur_grille(Len), Y is I.
set_coords(X, Y, I) :- X >= 0, Y >= 0, longueur_grille(Len), X < Len, Y < Len, I is (Y * Len) + X.

/* different deplacemet possible */
/* vers la gauche */
deplacement_robot(Src, Dest, 0) :- get_coords(Src, XSrc, YSrc), YDest is YSrc, XDest is XSrc - 1, set_coords(XDest, YDest, Dest).
/* vers le haut */
deplacement_robot(Src, Dest, 1) :- get_coords(Src, XSrc, YSrc), YDest is YSrc + 1, XDest is XSrc, set_coords(XDest, YDest, Dest).
/* vers la droite */
deplacement_robot(Src, Dest, 2) :- get_coords(Src, XSrc, YSrc), YDest is YSrc, XDest is XSrc + 1, set_coords(XDest, YDest, Dest).
/* vers le bas */
deplacement_robot(Src, Dest, 3) :- get_coords(Src, XSrc, YSrc), YDest is YSrc - 1, XDest is XSrc, set_coords(XDest, YDest, Dest).

/* Modifier la grille avec la nouvelle valeur */
modifier([_|R], 0, Val, [Val|R]).
modifier([L|R], Index, Val, [L|R2]) :- NewIndex is Index - 1, modifier(R, NewIndex, Val, R2).

/* faire avancer le robot (non fonctionnel)*/
avance(Grille, Depart, Arrivee, Direction, Objectif) :- deplacement_robot(Depart, Arrivee, Direction), avance().
avance(Grille, Depart, Arrivee, Direction, Objectif) :- deplacement_robot(Depart, Arrivee, Direction).

/* Prédicat general */

/*deplace_robot(Grille, Depart) :- longueur_grille(Len), NbCases is Len * Len, init_grille(TmpGrille, Depart, NbCases), recherche_chemin(TmpGrille, Depart, 1, Grille).*/