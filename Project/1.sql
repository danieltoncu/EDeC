
alter table product drop Constraint ref_category_id;
/
alter table product_caracteristic drop Constraint ref_caracteristic; 
/
alter table product_caracteristic drop Constraint ref_product; 
 /
alter table overall_score drop Constraint ref_product_id_overall_score;
/
alter table health drop Constraint ref_product_id_health;
/
alter table environment drop Constraint ref_product_id_environment;
/
alter table society drop Constraint ref_product_id_society;
/
alter table user_likes drop Constraint ref_user_likes;
/
alter table users_role drop Constraint ref_user_role;
/
alter table user_dislikes drop Constraint ref_user_dislikes;
/

drop index search_product_name;
/
drop index search_product_brand;
/
drop index search_caracteristic_name;
/
drop index search_username;
/
drop table product_caracteristic;
/
drop table users;
/
drop table category;
/
drop table product;
/
drop table caracteristics;
/
drop table overall_score;
/
drop table health;
/
drop table environment;
/
drop table society;
/
drop table user_likes;
/
drop table user_dislikes;
/
drop table users_role;
/

create table users(
	user_id number(10),
	email varchar2(50) not null,
	password varchar2(50) not null,			
	username varchar2(50),
	PRIMARY KEY(user_id),
	Constraint username_constraint unique(username)

)
/
create table category(
	category_id number(10),
	category_name varchar2(50),
	PRIMARY KEY(category_id),
	Constraint category_name_constraint unique(category_name)

)
/
create table product (
	product_id number(10),
	product_brand varchar2(50) not null,
	product_description varchar2(1000),
	product_name varchar2(50),
	category_id number(10),
	PRIMARY KEY(product_id),
	Constraint product_name_constraint unique(product_name)

)

/
create table caracteristics(
	caracteristic_id number(10),
	caracteristic_concern_level number(1) not null,	
	caracteristic_name varchar2(50),
	PRIMARY KEY(caracteristic_id),
	Constraint ingredient_name_constraint unique(caracteristic_name)

)
/
create table product_caracteristic(
	product_caracteristic_id number(10),
	caracteristic_id number(10),
	product_id number(10),
	PRIMARY KEY(product_caracteristic_id)
)
/
create table overall_score(
	overall_score_id number(10),
	overall_score number(3,1) not null,
	overall_score_text varchar2(50),
	product_id number(10),
	PRIMARY KEY(overall_score_id)
)	
/
create table health(
	health_id number(10),
	health_score number(3,1) not null,
	health_score_text varchar2(50),
	product_id number(10),
	PRIMARY KEY(health_id)

)
/
create table environment(
	environment_id number(10),
	environment_score number(3,1) not null,
	environment_score_text varchar2(50),
	product_id number(10),
	PRIMARY KEY(environment_id)
)
/
create table society(
	society_id number(10),
	society_score number(3,1) not null,
	society_score_text varchar2(50),
	product_id number(10),
	PRIMARY KEY(society_id)
)
/

create table user_likes(
	user_likes_id number(10),
	product_id number(10),
	user_id number(10),
	PRIMARY KEY(user_likes_id)
)
/
create table user_dislikes(
	user_dislikes_id number(10),
	product_id number(10),	
	user_id number(10),
	PRIMARY KEY(user_dislikes_id)
	)
/
create table users_role(
	users_role_id number(10),
	user_role varchar2(100),
	user_id number(10),
	PRIMARY KEY(users_role_id)
)
/
alter table users_role add Constraint ref_user_role foreign key(user_id)
references users(user_id)
/
alter table product add Constraint ref_category_id foreign key(category_id)
  references category(category_id)
/
alter table product_caracteristic add Constraint ref_caracteristic foreign key(caracteristic_id)
  references caracteristics(caracteristic_id)
/
 alter table product_caracteristic add Constraint ref_product foreign key(product_id)
  references product(product_id)
/

alter table overall_score add Constraint ref_product_id_overall_score foreign key(product_id)
  references product(product_id)
/
alter table health add Constraint ref_product_id_health foreign key(product_id)
  references product(product_id)
/
alter table environment add Constraint ref_product_id_environment foreign key(product_id)
  references product(product_id)
/
alter table society add Constraint ref_product_id_society foreign key(product_id)
  references product(product_id)
/
alter table user_likes add Constraint ref_user_likes foreign key(user_id)
  references users(user_id)
/
alter table user_dislikes add Constraint ref_user_dislikes foreign key(user_id)
  references users(user_id)
/

create index search_product_name on product(upper(product_name));
	/
create index search_product_brand on product(upper(product_brand));
	/
create index search_caracteristic_name on caracteristics(upper(caracteristic_name));
	/
create index search_username on users(upper(username));
	/
