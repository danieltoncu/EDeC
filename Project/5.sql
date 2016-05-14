CREATE OR REPLACE PACKAGE manage_users_dislikes IS

procedure dislike_product(v_user_id users.user_id%type, v_product_name product.product_name%type,v_message out varchar2)  ;

procedure dislike_brand(v_user_id users.user_id%type, v_product_brand product.product_brand%type,v_message out varchar2) ;

procedure dislike_ingredient(v_user_id users.user_id%type, v_ingredient_name ingredients.ingredient_name%type,v_message out varchar2) ;


procedure delete_dislike_product(v_user_id users.user_id%type, v_product_name product.product_name%type,v_message out varchar2) ;

procedure delete_dislike_brand(v_user_id users.user_id%type, v_product_brand product.product_brand%type,v_message out varchar2) ;

procedure delete_dislike_ingredient(v_user_id users.user_id%type, v_ingredient_name ingredients.ingredient_name%type,v_message out varchar2) ;

END manage_users_dislikes;





CREATE OR REPLACE PACKAGE BODY manage_users_dislikes IS

procedure dislike_product(v_user_id users.user_id%type, v_product_name product.product_name%type,v_message out varchar2) IS
v_validate integer:=0;
v_number number(10):=0;


BEGIN

select count(*) into v_validate from product
where upper(v_product_name)=upper(product_name);

select number_dislikes into v_number from user_dislikes
where user_id=v_user_id;

if(v_validate=1) then
	v_number:=v_number+1;
	insert into user_dislikes values(v_user_id,upper(v_product_name),null,null,v_number);
	v_message:='submited';
else
	v_message:='product name not found';
end if;


END dislike_product;

procedure dislike_brand(v_user_id users.user_id%type, v_product_brand product.product_brand%type,v_message out varchar2) IS
v_validate integer:=0;
v_number number(10):=0;

BEGIN

select count(*) into v_validate from product
where upper(product_brand)=upper( v_product_brand);

select number_dislikes into v_number from user_dislikes
where user_id=v_user_id;

if(v_validate=1) then
	v_number:=v_number+1;
	insert into user_dislikes values(v_user_id,null,upper(v_product_brand),null,v_number);
	v_message:='submited';
else
	v_message:='product brand not found';
end if;



END dislike_brand;



procedure dislike_ingredient(v_user_id users.user_id%type, v_ingredient_name ingredients.ingredient_name%type,v_message out varchar2) IS
v_validate integer:=0;
v_number number(10):=0;

BEGIN

select count(*) into v_validate from ingredients
where upper(ingredient_name)=upper( v_ingredient_name);

select number_dislikes into v_number from user_dislikes
where user_id=v_user_id;

if(v_validate=1) then
	v_number:=v_number+1;
	insert into user_dislikes values(v_user_id,null,null,upper(v_ingredient_name),v_number);
	v_message:='submited';
else
	v_message:='ingredient  not found';
end if;



END dislike_ingredient;


procedure delete_dislike_product(v_user_id users.user_id%type, v_product_name product.product_name%type,v_message out varchar2) IS
v_validate integer:=0;
v_number number(10):=0;
BEGIN

select count(*) into v_validate from user_dislikes
where user_id=v_user_id and upper(product_name)=upper(v_product_name);
	
if(v_validate=1) then
	delete from user_dislikes where upper(product_name)=upper(v_product_name) and user_id=v_user_id;
	v_message:='succefully deleted';
else
	v_message:='not such a product';
END if;

END delete_dislike_product;


procedure delete_dislike_brand(v_user_id users.user_id%type, v_product_brand product.product_brand%type,v_message out varchar2) IS 
v_validate integer:=0;
BEGIN

select count(*) into v_validate from user_dislikes
where user_id=v_user_id and upper(product_brand)=upper(v_product_brand);
	
if(v_validate=1) then
	delete from user_dislikes where upper(product_brand)=upper(v_product_brand) and user_id=v_user_id;
	v_message:='succefully deleted';
else
	v_message:='not such a product';
END if;

END delete_dislike_brand; 


procedure delete_dislike_ingredient(v_user_id users.user_id%type, v_ingredient_name ingredients.ingredient_name%type,v_message out varchar2) IS
v_validate integer:=0;
BEGIN

select count(*) into v_validate from user_dislikes
where user_id=v_user_id and upper(product_ingredient_name)=upper(v_ingredient_name);
	
if(v_validate=1) then
	delete from user_dislikes where upper(product_ingredient_name)=upper(v_ingredient_name) and user_id=v_user_id;
	v_message:='succefully deleted';
else
	v_message:='not such a product';
END if;

END delete_dislike_ingredient;


END manage_users_dislikes;
