/*:indentSize=4:tabSize=4:noTabs=true:wrap=soft:*/
/*Question: a) Build a view AvailableMovies that lists for each branch the branch ID and the titles of movies that are currently available (not rented out). (Your view should have two attributes, bid and mtitle.)*/
DROP VIEW IF EXISTS AvailableMovies;
CREATE VIEW AvailableMovies AS
    SELECT DISTINCT branch.bid, movie.title FROM branch
    JOIN copy ON copy.bid = branch.bid
    JOIN movie ON movie.mid = copy.mid
    JOIN rental ON rental.copyid = copy.copyid
    WHERE rental.returndate IS NOT NULL
    ORDER BY branch.bid, movie.title
;
