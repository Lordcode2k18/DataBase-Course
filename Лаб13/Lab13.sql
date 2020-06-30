explain select straight_join types.Name, event.Name, user.Name
from (user inner join event)
inner join types on
types.id_type=event.id_type and
event.id_user=user.id_user
where event.date between "2020-05-19" AND '2020-05-29' AND Is_Admin=1;

show index from user;
desc user;
create index mail_index on user(`E-mail`);
drop index mail_index on user;

create index name_index on user(Name);
drop index name_index on user;

create index admin_index on user(Is_Admin);
drop index admin_index on user;
