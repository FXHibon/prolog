% ensemble de cases (x, y,) => (nord, sud, [...], "robot")

% Les faits

robot(premier).
rouge(premier).

grid([
	[premier, 0, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]
	]).

displayCase(Case) :-
	write(Case).

displayLine([X | END]) :-
	displayCase(X),
	displayLine(END).

displayGrid([X | END]) :-
	displayLine(X),
	writeln('\n'),
	displayGrid(END).


% Les règles

