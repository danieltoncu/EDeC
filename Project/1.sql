
alter table product drop Constraint ref_category_id
/
alter table ingredients drop Constraint ref_product_id_ingredients
/
alter table certifications drop Constraint ref_product_id_certifications
/
alter table overall_score drop Constraint ref_product_id_overall_score
/
alter table health drop Constraint ref_product_id_health
/
alter table environment drop Constraint ref_product_id_environment
/
alter table society drop Constraint ref_product_id_society
/
drop index search_product_name;
/
drop index search_product_brand;
/
drop index search_product_ingredient_name;
/
drop index search_username;
/
drop index search_username_upper;
/
drop table users;
/
drop table product_category;
/
drop table product;
/
drop table ingredients;
/
drop table certifications;
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
create table users(
	user_id number(10),
	username varchar2(50),
	password varchar2(50) not null,
	email varchar2(50) not null,
	PRIMARY KEY(user_id),
	Constraint username_constraint unique(username)

)
/
create table product_category(
	category_id number(10),
	category_name varchar2(50),
	PRIMARY KEY(category_id),
	Constraint category_name_constraint unique(category_name)

)
/
create table product (
	product_id number(10),
	product_name varchar2(50),
	category_id number(10),
	product_brand varchar2(50) not null,
	product_owner varchar2(50) not null,
	product_description varchar2(10000),
	PRIMARY KEY(p_product_id),
	Constraint product_name_constraint unique(product_name)

)

/
create table ingredients(
	ingredient_id number(10),
	ingredient_name varchar2(50),
	ingredient_concern_level number(1) not null,
	product_id number(10) ,
	PRIMARY KEY(product_ingredient_id),
	Constraint ingredient_name_constraint unique(ingredient_name)

)
/
create table certifications(
	certifications_id number(10),
	certifications_name varchar2(50),
	product_id number(10),
	PRIMARY KEY(certifications_id)

)
/

create table overall_score(
	product_id number(10),
	product_overall_score number(3,1) not null

)
/
create table health(
	product_id number(10),
	product_score number(3,1) not null

)
/
create table environment(
	product_id number(10),
	product_score number(3,1) not null
)
/
create table society(
	product_id number(10),
	product_score number(3,1) not null
)
/

create table user_likes(
	user_id number(10),
	product_name number(10),
	product_brand varchar2(50),
	product_ingredient_name number(10),
	number_likes number(10)

)
/
create table user_dislikes(
	user_id number(10),
	product_id number(10),
	product_brand varchar2(50),
	product_ingredient_name number(10),
	number_dislikes number(10)
)

/

alter table product add Constraint ref_category_id foreign key(category_id)
  references product_category(category_id)
/
alter table ingredients add Constraint ref_product_id_ingredients foreign key(product_id)
  references product(product_id)
/
alter table certifications add Constraint ref_product_id_certifications foreign key(product_id)
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

create index search_product_name on product(upper(product_name));
	/
create index search_product_brand on product(upper(product_brand));
	/
create index search_product_ingredient_name on ingredients(upper(product_ingredient_name));
	/
create index search_username on users(username);
	/
create index search_username_upper on users(upper(username));
	/
