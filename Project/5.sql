CREATE OR REPLACE PACKAGE manage_users_dislikes IS

procedure dislike_product(v_user_id users.user_id%type, v_product_id product.product_id%type,v_message out varchar2)  ;

procedure delete_dislike_product(v_user_id users.user_id%type, v_product_id product.product_id%type,v_message out varchar2) ;


END manage_users_dislikes;





CREATE OR REPLACE PACKAGE BODY manage_users_dislikes IS

procedure dislike_product(v_user_id users.user_id%type, v_product_id product.product_id%type,v_message out varchar2) IS
v_validate1 integer:=0;
v_validate2 integer:=0;
v_validate3 integer:=0;
v_number number(10):=0;
v_check_likes integer:=0;
v_id number(10):=0;


BEGIN

select count(*) into v_validate1 from product
where product_id=v_product_id;

select count(*) into v_validate2 from user_dislikes
where product_id=v_product_id;

select count(*) into v_check_likes from user_likes
where user_id=v_user_id and product_id=v_product_id;

select count(*) into v_validate3 from user_dislikes;

if(v_validate3>0) then

select user_dislikes_id into v_id from user_dislikes
where rownum=1  
order by user_dislikes_id desc;
end if;



v_id:=v_id+1;


if(v_validate1=1 and v_validate2=0) then
	v_number:=v_number+1;
	insert into user_dislikes values(v_id,v_product_id,v_user_id);
	v_message:='submited';
else
	v_message:='product name not found';
end if;

if(v_check_likes=1) then
	delete from user_dislikes 
	where user_id=v_user_id and product_id=v_product_id;
end if;


END dislike_product;




procedure delete_dislike_product(v_user_id users.user_id%type, v_product_id product.product_id%type,v_message out varchar2) IS
v_validate integer:=0;
v_number number(10):=0;
BEGIN

select count(*) into v_validate from user_dislikes
where user_id=v_user_id and product_id=v_product_id;
	
if(v_validate=1) then
	delete from user_dislikes where product_id=v_product_id and user_id=v_user_id;
	v_message:='succefully deleted';
else
	v_message:='not such a product';
END if;

END delete_dislike_product;



END manage_users_dislikes;
