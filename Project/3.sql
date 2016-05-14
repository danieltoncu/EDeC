CREATE OR REPLACE PACKAGE manage_users_likes IS

procedure like_product(v_user_id users.user_id%type, v_product_name product.product_name%type,v_message out varchar2) ;

procedure delete_like_product(v_user_id users.user_id%type, v_product_name product.product_name%type,v_message out varchar2) ;



END manage_users_likes;



CREATE OR REPLACE PACKAGE BODY manage_users_likes IS

procedure like_product(v_user_id users.user_id%type, v_product_name product.product_name%type,v_message out varchar2) IS
v_validate1 integer:=0;
v_validate2 integer:=0;
v_check_dislikes integer:=0;

v_number number(10):=0;
v_product_id product.product_id%type;


BEGIN

select count(*) into v_validate1 from product
where upper(product_name)=upper(v_product_name);

select product_id into v_product_id from product
where upper(product_name)=upper(v_product_name);

select count(*) into v_validate2 from user_likes 
where product_id=v_product_id;

select count(*) into v_check_dislikes from user_dislikes
where user_id=v_user_id and product_id=v_product_id;


if(v_validate1=1 and v_validate2=1) then
	insert into user_likes values(v_user_id,v_product_id);
	v_message:='like submited';
else
	v_message:='something went wrong';
end if;

if(v_check_dislikes=1) then
	delete from user_dislikes 
	where user_id=v_user_id and product_id=v_product_id;
end if;

return v_message;

END like_product;



procedure delete_like_product(v_user_id users.user_id%type, v_product_name product.product_name%type,v_message out varchar2) IS
v_validate integer:=0;
v_product_id product.product_id%type;
v_number number(10):=0;
BEGIN



select product_id into v_product_id from product
where upper(product_name)=upper(v_product_name);

select count(*) into v_validate from user_likes
where user_id=v_user_id and product_id=v_product_id;
	
if(v_validate=1) then
	delete from user_likes
	where user_id=v_user_id and product_id=v_product_id;
	v_message:='succefully deleted';
else
	v_message:='not such a product';
END if;

END delete_like_product;


END manage_users_likes;