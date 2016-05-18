CREATE OR REPLACE PACKAGE manage_users_likes IS

	procedure like_product(v_user_id users.user_id%type, v_product_id product.product_id%type,v_message out varchar2) ;

	procedure delete_like_product(v_user_id users.user_id%type, v_product_id product.product_id%type,v_message out varchar2) ;


	product_dosent_exists EXCEPTION;
	PRAGMA EXCEPTION_INIT(product_dosent_exists,-20013);

END manage_users_likes;



CREATE OR REPLACE PACKAGE BODY manage_users_likes IS

	procedure like_product(v_user_id users.user_id%type, v_product_id product.product_id%type,v_message out varchar2) IS

		v_validate1 integer:=0;
		v_validate2 integer:=0;
		v_validate3 integer:=0;
		v_check_dislikes integer:=0;
		v_number number(10):=0;
		v_id number(10):=0;

	BEGIN

		select count(*) into v_validate1 from product
		where product_id=v_product_id;

		select count(*) into v_validate2 from user_likes 
		where product_id=v_product_id;

		select count(*) into v_check_dislikes from user_dislikes
		where product_id=v_product_id and user_id=v_user_id ;

		select count(*) into v_validate3 from user_likes;

		if(v_validate3>0) then
	
			select user_likes_id into v_id from user_likes
			where rownum=1  
			order by user_likes_id desc;
	
		end if;

		v_id:=v_id+1;

		if(v_validate1=1 and v_validate2=0) then
	
			insert into user_likes values(v_id,v_product_id,v_user_id);
			v_message:='like submited';

		elsif(v_validate2=1) then
	
			v_message:='like already exists';

		elsif(v_validate1=0) then
	
			v_message:='product dosent exists';
			raise product_dosent_exists;

		end if;

		if(v_check_dislikes=1) then
	
			delete from user_dislikes 
			where  product_id=v_product_id and user_id=v_user_id;

		end if;

		EXCEPTION
		when product_dosent_exists then
			raise_application_error(-20013,v_message);

	END like_product;



	procedure delete_like_product(v_user_id users.user_id%type, v_product_id product.product_id%type,v_message out varchar2) IS
		
		v_validate integer:=0;
		v_number number(10):=0;

	BEGIN

		select count(*) into v_validate from user_likes
		where  product_id=v_product_id and user_id=v_user_id;
	
		if(v_validate=1) then
	
			delete from user_likes
			where product_id=v_product_id and user_id=v_user_id;
			v_message:='succefully deleted';
		else
			v_message:='product dosent exists';
			raise product_dosent_exists;
		END if;

		EXCEPTION
			when product_dosent_exists then
				raise_application_error(-20013,v_message);

	END delete_like_product;


END manage_users_likes;