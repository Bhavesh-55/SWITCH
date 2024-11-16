show variables like "transaction_isolation";

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
select * from moviesdb.movies m where industry ='Hollywood';

update moviesdb.movies set imdb_rating =1 where movie_id =103;
https://www.scaler.com/academy/mentee-dashboard/class/192181/session?joinSession=1


insert into moviesdb.movies(movie_id) values(select max(movie_id)+1 from moviesdb.movies);
insert into moviesdb.movies(movie_id) values(select max(movie_id)+2 from moviesdb.movies);
insert into moviesdb.movies(movie_id) values(select max(movie_id)+3 from moviesdb.movies);

###########serializable

SET SESSION TRANSACTION ISOLATION level serializable;

select * from moviesdb.movies where industry ='Hollywood' for update ;
select * from moviesdb.movies where industry ='Bollywood';

select * from moviesdb.movies m where movie_id in ('105','106','112');




