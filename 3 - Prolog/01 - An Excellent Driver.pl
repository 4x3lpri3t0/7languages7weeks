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