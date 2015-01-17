--On the left side, you’ll see an expression.
--On the right side, you’ll see generators and filters.

[x * 2 | x <- [1, 2, 3]]
--[2,4,6]

--“Collect x * 2 where x is taken from the list [1, 2, 3].”

----

--As with Erlang, we can also use pattern matching within our list comprehensions.

--Say we had a list of points representing a polygon and wanted to flip the polygon diagonally.

[ (y, x) | (x, y) <- [(1, 2), (2, 3), (3, 1)]]
--[(2,1),(3,2),(1,3)]

--Or, to flip the polygon horizontally, we could subtract x from 4:

[ (4 - x, y) | (x, y) <- [(1, 2), (2, 3), (3, 1)]]
--[(3,2),(2,3),(1,1)]

----

--We can also compute combinations.

--Find all the possible combinations:

let crew = ["Kirk", "Spock", "McCoy"]
[(a, b) | a <- crew, b <- crew]
--[("Kirk","Kirk"),("Kirk","Spock"),("Kirk","McCoy"),("Spock","Kirk"),("Spock","Spock"),("Spock","McCoy"),
--("McCoy","Kirk"),("McCoy","Spock"),("McCoy","McCoy")]

--That composition almost worked but did not remove duplicates.
--Add condition:

[(a, b) | a <- crew, b <- crew, a /= b]
--[("Kirk","Spock"),("Kirk","McCoy"),("Spock","Kirk"),("Spock","McCoy"),("McCoy","Kirk"),("McCoy","Spock")]

----

--Include only the options that appear in sorted order:

[(a, b) | a <- crew, b <- crew, a < b]
--[("Kirk","Spock"),("Kirk","McCoy"),("McCoy","Spock")]

