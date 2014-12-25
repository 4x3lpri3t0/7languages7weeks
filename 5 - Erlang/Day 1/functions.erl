% FUNCTIONS

% Unlike Scala, Erlang is dynamically typed.

% You won’t have to worry too much about assigning types to data elements.

% Like Ruby, Erlang typing is dynamic.

% Erlang will bind types at run time, based on syntactic clues
% such as quotes or decimal points.

% ----

% The file contains code for a module, and you have to compile it to run it.

% The .beam compiled module will run in a virtual machine called the beam.

% Defines the name of the module:
-module(functions).

% Defines a function that you want to use outside of the module:
-export([mirror/1]).
% The function is called mirror, and the /1 means it has one parameter

mirror(Anything) -> Anything.

% After compiling, you can run it in the console like this:
% functions:mirror(some_stuff).

