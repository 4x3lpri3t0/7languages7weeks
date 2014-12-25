% BIT MATCHING

% Sometimes, you need to access data at the bit level. If you’re cramming
% more data into less space or dealing with predefined formats such as
% JPEGs or MPEGs, the location of each bit matters. Erlang lets you pack
% several pieces of data into one byte quite easily. To do these two things,
% you need two operations: pack and unpack. In Erlang, a bitmap works
% just like other types of collections. To pack a data structure, you’ll just
% tell Erlang how many bits to take for each item, like this:

W = 1.
X = 2.
Y = 3.
Z = 4.

All = <<W:3, X:3, Y:5, Z:5>>.

% The << and >> bracket binary patterns in this constructor.
% In this case, it means take 3 bits for the variable W,
% 3 bits for X, 5 bits for Y, and 5 bits for Z.

% Next, we need to be able to unpack:

<<A:3, B:3, C:5, D:5>> = All.

A.

D.

% Just like tuples and lists, we just supply the same syntax and let pattern
% matching do the rest. With these bitwise operations, Erlang is surprisingly
% powerful for low-level tasks.