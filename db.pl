/* Specifying gender to declare names */
male(carl).
male(ray).
male(mike).
male(evan).
male(jordan).
male(brian).
male(justin).
male(cory).
male(george).
male(nick).
male(austin).

female(tammy).
female(maureen).
female(julie).
female(tracy).
female(robin).
female(megan).
female(ella).

/* Specifying ages */
age(carl, 107).
age(tammy, 105).

age(ray, 84).
age(maureen, 81).

age(mike, 57).
age(julie, 56).

age(evan, 27).
age(jordan, 22).

age(brian, 62).
age(tracy, 59).

age(justin, 24).
age(cory, 27).

age(george, 78).
age(robin, 79).

age(nick, 58).
age(megan, 54).

age(ella, 23).

age(austin, 2).

/* Specifying child relationships */
child_of(ray, carl).
child_of(ray, tammy).
child_of(george, carl).
child_of(george, tammy).

child_of(julie, ray).
child_of(julie, maureen).
child_of(brian, ray).
child_of(brian, maureen).

child_of(evan, mike).
child_of(evan, julie).
child_of(jordan, mike).
child_of(jordan, julie).

child_of(justin, brian).
child_of(justin, tracy).
child_of(cory, brian).
child_of(cory, tracy).

child_of(megan, george).
child_of(megan, robin).

child_of(ella, megan).
child_of(ella, nick).

child_of(austin, ella).
child_of(austin, shane).

/* CLAUSES */
parent(X, Y) :-
    child_of(Y, X).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X\=Y.

grandparent(X, Y) :-
    parent(Z, Y),
    parent(X, Z).

first_cousin(X, Y) :-
    grandparent(Z, X),
    grandparent(Z, Y).

second_cousin(X, Y) :-
    grandparent(A, X),
    grandparent(B, Y),
    parent(C, A),
    parent(C, B).

second_cousin_once_removed(X, Y) :-
    parent(Z, Y),
    second_cousin(X, Z)
