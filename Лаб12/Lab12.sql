create trigger before_delete_company before
delete on calendar.company for each row
update calendar.participants set id_company=0 where id_company=OLD.id_company;

drop trigger before_delete_company;
create trigger delete_company after
delete on calendar.company for each row
update calendar.participants set Position='Безробітний' where id_company=OLD.id_company;

desc participants;

create trigger hide_password before insert 
on calendar.user for each row
set new.password = aes_encrypt(new.password,'key-key'); 

/*drop trigger wrong_update;
delimiter $$
create trigger wrong_update after
update on calendar.event for each row
begin
	if datediff(new.date,curdate())<0 then
		update event set date=old.date;
	else
		update event set date=new.date;
	end if;
end;$$
delimiter ;*/
desc event;
drop trigger update_position;
delimiter &&
create trigger update_position
after update on user for each row
begin
	if new.is_Admin=0
		then update (user inner join event) SET event.Status="Локальна"
        where NEW.id_User=event.id_user;
	end if;
end;&&
delimiter ;