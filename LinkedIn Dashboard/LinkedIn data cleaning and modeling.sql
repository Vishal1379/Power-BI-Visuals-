create database date_demo;

use date_demo;
-------------------------------------------------Connection_Table---------------------------------------------------------

load data infile
'D:/Connections.csv'
into table connections
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows ;


create table connections(
First_Name varchar(30),
Last_Name varchar(30),
Email_Address varchar(30),
Company varchar(30),
`Position` varchar(30),
Connected_On varchar(30)
);

select * from connections;

select str_to_date(Connected_On,'%d-%m-%Y') from connections;

alter table connections
add column Connected_On_new date after Connected_On;

update connections
set Connected_On_new =str_to_date(Connected_On,'%d-%m-%Y');

alter table connections
add column year_new int after Connected_On_new;

alter table connections
add column month_new int after year_new;

alter table connections
add column day_new int after month_new;

update connections
set year_new =year(Connected_On_new);

update connections
set month_new =month(Connected_On_new);

update connections
set month_new =day(Connected_On_new);

update connections
set day_new =day(Connected_On_new);

select * from connections;

------------------------------------------------------Invitaion_Table---------------------------------------------------

create table if not exists invitations(
`From` varchar(30),
`To` varchar(30),
Sent_At varchar(30),
Direction varchar(30)
);

load data infile
'D:/Invitations.csv'
into table invitations
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows ;

select * from invitations;

select str_to_date(Sent_At,'%d-%m-%Y') from invitations;

alter table invitations
add column Sent_At_new date after Sent_At;

update invitations
set Sent_At_new =str_to_date(Sent_At,'%d-%m-%Y');

alter table invitations
add column year_new int after Sent_At_new;

alter table invitations
add column month_new int after year_new;

alter table invitations
add column day_new int after month_new;

update invitations
set year_new =year(Sent_At_new);

update invitations
set month_new =month(Sent_At_new);

update invitations
set day_new =day(Sent_At_new);

------------------------------------------------------------Reaction_Table------------------------------------------
create table if not exists reactions(
`Date` varchar(30),
`Type` varchar(30),
`Link` varchar(100)
);

drop table reactions;

load data infile
'D:/Reactions.csv'
into table reactions
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows ;

select * from reactions;

select str_to_date(`Date`,'%d-%m-%Y') from reactions;

alter table reactions
add column Date_new date after `Date`;

update reactions
set Date_new =str_to_date(`Date`,'%d-%m-%Y');

alter table reactions
add column year_new int after Date_new;

alter table reactions
add column month_new int after year_new;

alter table reactions
add column day_new int after month_new;

alter table connections
drop column Connected_On;

update reactions
set year_new =year(Date_new);

update reactions
set month_new =month(Date_new);

update reactions
set day_new =day(Date_new);

select * from reactions;

----------------------------------------messages_table------------------------------------------------------------------
create table if not exists messages(
CONVERSATION_ID varchar(100),
CONVERSATION_TITLE varchar(100),
`FROM` varchar(30),
SENDER_PROFILE_URL varchar(100),
`TO` varchar(30),
`DATE` varchar(30)
);

load data infile
'D:/messages.csv'
into table messages
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows ;

select * from messages;

alter table messages
add column flag varchar(30) after `FROM`;

update messages
set flag =if(`FROM`= 'Vishal Thorat', 'yes', 'no');

alter table messages
add column Date_new date after `DATE`;

update messages
set Date_new =str_to_date(`DATE`,'%d-%m-%Y');
