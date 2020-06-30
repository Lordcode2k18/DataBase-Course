use calendar;

/*create function date_to_event(mydate date)
returns int deterministic
return Datediff(Curdate(),mydate);
*/

/*create function hello(helloid INT)
returns varchar(150) deterministic
return concat((select name from user
		where id_User=helloid),' ',
        (select Surname from user
        where id_User=helloid));
*/
delimiter //
create procedure date_to_event()
begin
	create table if not exists day_to_events(
			Name Varchar(200),
			Description text,
			Count_days text);
	insert into day_to_events
			select Name,Description
			from event;
	if(Datediff(date,Curdate()))<0 
		then insert into day_to_events(`Count_days`)
			values ('Подія відбулася');
	elseif (Datediff(date,Curdate()))=0 AND Timediff(mydate,Curdate())<0
		then insert into day_to_events(`Count_days`)
			values ('Подія відбулася сьогодні!');
	elseif (Datediff(date,Curdate()))>0
		then insert into day_to_events(`Count_days`)
			values ('Кількість днів до події: '+convert(Datediff(mydate,Curdate()),text));
	end if;
end//
delimiter ;

drop procedure count_days;

delimiter //
create procedure count_days()
begin
	select Name,Description,Datediff(date,Curdate()) as Count_days from event;
end//
delimiter ;
        