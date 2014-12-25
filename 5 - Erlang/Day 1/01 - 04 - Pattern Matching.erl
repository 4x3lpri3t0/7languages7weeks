-module(patmat).
%-export([funcname/1]).

% PATTERN MATCHING

% A match will work against a single value

% Let’s use pattern matching to extract the values from a tuple:

Person = {person, {name, "Agent Smith"}, {profession, "Killing Programs"}}.

% Let’s say we want to assign the name to Name,
% and the profession to Profession.

{person, {name, Name}, {profession, Profession}} = Person.

Name.
% "Agent Smith"

Profession.
% "Killing programs"

% ----

% List pattern matching is similar to Prolog’s:

[Head | Tail] = [1, 2, 3].

Head.
% 1

Tail.
% [2, 3]


% You can bind to more than one variable at the head of a list, too:

[One, Two|Rest] = [1, 2, 3].
% [1, 2, 3]

One.
% 1

Two.
% 2

Rest.
% [3]

% If there are not enough elements in the list, the pattern won’t match:

[X|Rest] = [].
% => ERROR

% ----

% If you forget to start your variables with an uppercase letter...
% You’ll get this error message:

one = 1.
% ** exception error: no match of right hand side value 1

% As you’ve seen before, the = statement is not a simple assignment.
% It is actually a pattern match.