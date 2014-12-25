-module(matching_function).
-export([number/1]).

number(one)   -> 1;
number(two)   -> 2;
number(three) -> 3.


% You can execute it like this:

% c(matching_function).

% matching_function:number(one).


% matching_function:number(four).
% ** exception error: no function clause matching matching_function:number(four)