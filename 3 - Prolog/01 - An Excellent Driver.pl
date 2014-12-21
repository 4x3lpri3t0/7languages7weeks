% Prolog is a declarative language.
% You’ll throw some facts and inferences at Prolog and let it do the reasoning for you.

% You can leave gaps in your assertions, and Prolog will try to fill in the holes
% that would make your incomplete facts true.

% Like SQL, Prolog works on databases, but the data will consist of logical rules and relationships.
% Like SQL, Prolog has two parts: one to express the data and one to query the data.

% FACTS
% A fact is a basic assertion about some world.
% (Babe is a pig; pigs like mud.)

% RULES
% A rule is an inference about the facts in that world.
% (An animal likes mud if it is a pig.)

% QUERY
% A query is a question about that world.
% (Does Babe like mud?)

% Facts and rules will go into a knowledge base.
% A Prolog compiler compiles the knowledge base into a form that’s efficient for queries.

% Use Prolog to link rules together to tell you something you might not have known.

% ----

% Day 1: And Excellent Driver

% BASIC FACTS

% The case of the first letter is significant:
% If a word begins with a lowercase character, it’s an atom - a fixed value.
% If it begins with an uppercase letter or an underscore, it’s a variable.

likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).

% \+ does logical negation so \+(X = Y) means X is not equal to Y

main.

% FILLING IN THE BLANKS

food_type(velbeeta, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(twinkie, dessert).

flavor(sweet, dessert).
flavor(savory, meat).
flavor(savory, cheese).
flavor(sweet, soda).

food_flavor(X, Y) :- food_type(X, Z), flavor(Y, Z).

% Compile and ask some questions:

% | ?- food_type(What, meat).
% What = spam ?;
% What = sausage ?;

% 'What' is a variable

% ----

% Ex.: We do not want two states of the same color to touch

different(red, green). different(red, blue).
different(green, red). different(green, blue).
different(blue, red). different(blue, green).

coloring(Alabama, Mississippi, Georgia, Tennessee, Florida) :-
	different(Mississippi, Tennessee),
	different(Mississippi, Alabama),
	different(Alabama, Tennessee),
	different(Alabama, Mississippi),
	different(Alabama, Georgia),
	different(Alabama, Florida),
	different(Georgia, Florida),
	different(Georgia, Tennessee).

% Prolog is not about writing algorithms to solve logical problems.
% Prolog is about describing your world as it is and presenting logical
% problems that your computer can try to solve.

% ----

% UNIFICATION, PART 1

% Unification across two structures tries to make both structures identical:

cat(lion).
cat(tiger).

dorothy(X, Y, Z) :- X = lion, Y = tiger, Z = bear.
twin_cats(X, Y) :- cat(X), cat(Y).

% In this example, = means unify, or make both sides the same (match).

% We have two facts: lions and tigers are cats.

% We also have two simple rules.
% In dorothy/3, X, Y, and Z are lion, tiger, and bear, respectively.
% In twin_cats/2, X is a cat, and Y is a cat.

% ----

% twin_cats/2 : This rule says twin_cats(X, Y)
% is true if you can prove that X and Y are both cats.

% | ?- twin_cats(One, Two).
% One = Two, Two = lion ;
% One = lion,
% Two = tiger ;
% One = tiger,
% Two = lion ;
% One = Two, Two = tiger.

% Prolog is working through the list of all combinations of X and Y,
% given the information available in the goals and corresponding facts.

% ----

% DO:

% • Make a simple knowledge base. Represent some of your favorite books and authors.

% book(tolkien, [hobbit, lotr]).
% book(lovecraft, [cthulhu]).
% book(jon_skeet, [cSharpInDepth]).

% Or also:

book(tolkien, hobbit).
book(tolkien, lotr).
book(lovecraft, cthulhu).
book(jon_skeet, cSharpInDepth).

books_by_author(X, Y) :- book(X, Y).

% • Find all books in your knowledge base written by one author.

% ?- books_by_author(tolkien, Variable).
% Variable = hobbit ;
% Variable = lotr.

% • Make a knowledge base representing musicians and instruments.
% Also represent musicians and their genre of music.

musician(cobain, guitar).
musician(cobain, vocals).
musician(hendrix, guitar).
musician(timberlake, vocals).
musician(travis, drums).

genre(cobain, grunge).
genre(hendrix, rock).
genre(timberlake, pop).
genre(travis, punk).

musicians_by_instrument(X, Y) :- musician(X, Y).

% • Find all musicians who play the guitar.

% ?- musicians_by_instrument(X, guitar).
% X = cobain ;
% X = hendrix.