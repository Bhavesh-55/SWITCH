/*
A snapshot is a read-only view of the database at a specific moment in time. 
It provides a consistent, unchanging state of data, even if other transactions are modifying the database. 
Snapshots are commonly used in transaction isolation (like Repeatable Read) to prevent data inconsistencies and are also useful for backups and recovery.
*/


#SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
#SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET SESSION TRANSACTION ISOLATION LEVEL READ repeatable read; 
#repeatble read-->always read from snapshot.

show variables like "transaction_isolation";

select * from moviesdb.movies m where industry ='Hollywood';
select max(movie_id) from moviesdb.movies m ;

update moviesdb.movies set imdb_rating =9 where movie_id =102;
update moviesdb.movies set imdb_rating =9 where movie_id =103;


insert into moviesdb.movies(movie_id,title) values(41,"bhsmovie");

##############serializable

SET SESSION TRANSACTION ISOLATION level serializable;
select * from moviesdb.movies where industry ='Hollywood' for update ;

# lock will be applied on row(according to primary key).
select * from moviesdb.movies where movie_id in ('102','103','115') for update ;




