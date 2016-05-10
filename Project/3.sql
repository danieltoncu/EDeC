CREATE OR REPLACE PACKAGE manage_users_likes IS

function like_product(p_user_id users.user_id%type, p_product_name product.product_name%type) return varchar2;

function like_brand(p_user_id users.user_id%type, p_product_brand product.product_brand%type)return varchar2;

function like_ingredient(p_user_id users.user_id%type, p_ingredient_name ingredients.ingredient_name%type)return varchar2;


function delete_like_product(p_user_id users.user_id%type, p_product_name product.product_name%type)return varchar2;

function delete_like_brand(p_user_id users.user_id%type, p_product_brand product.product_brand%type)return varchar2;

function delete_like_ingredient(p_user_id users.user_id%type, p_ingredient_name ingredients.ingredient_name%type)return varchar2;


END manage_users_likes;



CREATE OR REPLACE PACKAGE BODY manage_users_likes IS

function like_product(p_user_id users.user_id%type, p_product_name product.product_name%type) 
return varchar2 IS

v_validate integer:=0;
v_message varchar2(32000):='';
v_number number(10):=0;


BEGIN

select count(*) into v_validate from product
where upper(p_product_name)=upper(product_name);

select number_likes into v_number from user_likes
where user_id=p_user_id;

if(v_validate=1) then
	v_number:=v_number+1;
	insert into user_likes values(p_user_id,upper(p_product_name),null,null,v_number);
	v_message:='submited';
else
	v_message:='product name not found';
end if;

return v_message;

END like_product;

function like_brand(p_user_id users.user_id%type, p_product_brand product.product_brand%type) 
return varchar2 IS

v_validate integer:=0;
v_message varchar2(32000):='';
v_number number(10):=0;

BEGIN

select count(*) into v_validate from product
where upper(p_product_brand)=upper( product_brand);

select number_likes into v_number from user_likes
where user_id=p_user_id;

if(v_validate=1) then
	v_number:=v_number+1;
	insert into user_likes values(p_user_id,null,upper(p_product_brand),null,v_number);
	v_message:='submited';
else
	v_message:='product brand not found';
end if;

return v_message;


END like_brand;



function like_ingredient(p_user_id users.user_id%type, p_ingredient_name ingredients.ingredient_name%type) 
return varchar2 IS

v_validate integer:=0;
v_message varchar2(32000):='';
v_number number(10):=0;

BEGIN

select count(*) into v_validate from ingredients
where upper( p_ingredient_name)=upper( ingredient_name);

select number_likes into v_number from user_likes
where user_id=p_user_id;

if(v_validate=1) then
	v_number:=v_number+1;
	insert into user_likes values(p_user_id,null,null,upper(p_ingredient_name),v_number);
	v_message:='submited';
else
	v_message:='ingredient  not found';
end if;

return v_message;


END like_ingredient;


function delete_like_product(p_user_id users.user_id%type, p_product_name product.product_name%type) 
return varchar2 IS

v_validate integer:=0;
v_message varchar2(32000):='';
v_number number(10):=0;
BEGIN

select count(*) into v_validate from user_likes
where user_id=p_user_id and upper(product_name)=upper(p_product_name);
	
if(v_validate=1) then
	delete from user_likes where upper(product_name)=upper(p_product_name) and user_id=p_user_id;
	v_message:='succefully deleted';
else
	v_message:='not such a product';
END if;
return v_message;

END delete_like_product;


function delete_like_brand(p_user_id users.user_id%type, p_product_brand product.product_brand%type) 
return varchar2 IS

v_validate integer:=0;
v_message varchar2(32000):='';
BEGIN

select count(*) into v_validate from user_likes
where user_id=p_user_id and upper(product_brand)=upper(p_product_brand);
	
if(v_validate=1) then
	delete from user_likes where upper(product_brand)=upper(p_product_brand) and user_id=p_user_id;
	v_message:='succefully deleted';
else
	v_message:='not such a product';
END if;
return v_message;

END delete_like_brand; 


function delete_like_ingredient(p_user_id users.user_id%type, p_ingredient_name ingredients.ingredient_name%type) 
return varchar2 IS

v_validate integer:=0;
v_message varchar2(32000):='';
BEGIN

select count(*) into v_validate from user_likes
where user_id=p_user_id and upper(product_ingredient_name)=upper(p_ingredient_name);
	
if(v_validate=1) then
	delete from user_likes where upper(product_ingredient_name)=upper(product_name) and user_id=p_user_id;
	v_message:='succefully deleted';
else
	v_message:='not such a product';
END if;
return v_message;

END delete_like_ingredient;

END manage_users_likes;