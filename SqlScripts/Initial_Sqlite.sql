begin transaction;

create table if not exists 'Books' (
	'Id' integer primary key autoincrement,
	'Title' text not null,
	'Author' text not null,
	'YearPublished' integer
);

commit transaction;
