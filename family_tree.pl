% ================================
% Family Tree Program in Prolog
% ================================

% --- Basic Facts ---
male(ram).
male(hari).
male(shyam).
male(gopal).
male(krishna).

female(sita).
female(geeta).
female(mamta).
female(goma).
female(radha).

% --- Parent Relationships ---
parent(ram, sita).
parent(ram, hari).
parent(sita, geeta).
parent(sita, shyam).
parent(hari, goma).
parent(hari, gopal).
parent(mamta, radha).
parent(shyam, krishna).

% --- Derived Relationships ---

% Rule: X is a grandparent of Y if X is a parent of Z and Z is a parent of Y.
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Rule: X and Y are siblings if they share the same parent and are not the same person.
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Rule: X and Y are cousins if their parents are siblings.
cousin(X, Y) :- parent(A, X), parent(B, Y), sibling(A, B), X \= Y.

% Rule: X is a child of Y if Y is a parent of X.
child(X, Y) :- parent(Y, X).

% Rule: X is a descendant of Y if Y is a parent of X (base case),
% or Y is a parent of Z and X is a descendant of Z (recursive case).
descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Y, Z), descendant(X, Z).