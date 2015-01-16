--Combine lists:

zip ["kirk"] ["spock"]
-- [("kirk","spock")]

zip "kirk" "spock"
-- [('k','s'),('i','p'),('r','o'),('k','c')]

zip ["kirk", "spock"] ["enterprise", "reliant"]
-- [("kirk","enterprise"),("spock","reliant")]

