main.

% RECURSION

father(zeb, john_boy_sr).
father(john_boy_sr, john_boy_jr).

ancestor(X, Y) :-
	father(X, Y).
ancestor(X, Y) :-
	father(X, Z), ancestor(Z, Y).

% Our call is tail recursive because the recursive subgoal,
% ancestor(Z, Y), is the last goal in the recursive rule.

% ----

% LISTS AND TUPLES

% List: [1,2,3] => Container of variable length
% Tuple: (1,2,3) => Container of fixed length

% UNIFICATION, PART 2

% | ?- (A, B, C) = (1, 2, 3).
% A = 1
% B = 2
% C = 3

% They unify if Prolog can make them the same.

% Lists have a capability that tuples don’t.
% You can deconstruct lists with [Head|Tail]. When you unify a list with
% this construct, Head will bind to the first element of the list, and
% Tail will bind to the rest:

% | ?- [a, b, c] = [Head|Tail].
% Head = a
% Tail = [b,c]

% You can get complicated by using various combinations:

% | ?- [a, b, c] = [a|Tail].
% Tail = [b,c]

% Prolog matched the a and unified the rest with Tail.

% | ?- [a, b, c] = [a|[Head|Tail]].
% Head =b
% Tail = [c]

% Grab the third element:
% | ?- [a, b, c, d, e] = [_, _|[Head|_]].
% Head = c

% _ is a wildcard and unifies with anything.
% Means “I don’t care what’s in this position.”

% ----

% LISTS AND MATH

count(0, []).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

sum(0, []).
sum(Total, [Head|Tail]) :- sum(Sum, Tail), Total is Head + Sum.

average(Average, List) :- sum(Sum, List), count(Count, List), Average is Sum/Count.

% USING RULES IN BOTH DIRECTIONS

% The rule append(List1, List2, List3) is true if List3 is List1 + List2.

% It’s a lie detector:

% | ?- append([oil], [water], [oil, water]).

% It’s a list builder:

% | ?- append([tiny], [bubbles], What).
% What = [tiny,bubbles]

% It does list subtraction:

% | ?- append([dessert_topping], Who, [dessert_topping, floor_wax]).
% Who = [floor_wax]

% And it computes possible permutations:

% | ?- append(One, Two, [apples, oranges, bananas]).
% One = [],
% Two = [apples, oranges, bananas] ;

% One = [apples],
% Two = [oranges, bananas] ;

% One = [apples, oranges],
% Two = [bananas];

% One = [apples, oranges, bananas],
% Two = [];

% ----

% Let’s rewrite the Prolog append, but we’ll call it concatenate

% Our first step is to concatenate an empty list to List1:

concatenate([], List, List).

% | ?- concatenate([], [harry], What).
% What = [harry]

% Let’s add a rule that concatenates the first element
% of List1 to the front of List2:

concatenate([], List, List).
concatenate([Head|[]], List, [Head|List]).

% We’ll break our third element into the head and tail,
% using List1’s head and List2 as the tail.

% Here's the concatenate using nested rules:

concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :-
	concatenate(Tail1, List, Tail2).

% Prolog works to match up both sides of a :- or =.

% ----

% Day 2 Self-Study

% Find:

% • Some implementations of a Fibonacci series and factorials. How do they work?

% TODO

% • A real-world community using Prolog. What problems are they solving with it today?

% stackoverflow.com/questions/130097/real-world-prolog-usage

% • An implementation of the Towers of Hanoi. How does it work?

% TODO

% • What are some of the problems of dealing with “not” expressions?

% TODO

% Why do you have to be careful with negation in Prolog?

% TODO 

% Do:

% • Reverse the elements of a list.

% TODO

% • Find the smallest element of a list.

% TODO

% • Sort the elements of a list.

% TODO