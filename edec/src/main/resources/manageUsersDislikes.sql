CREATE OR REPLACE PACKAGE BODY manage_users_dislikes IS

	procedure dislike_characteristic(v_username users.username%type, v_characteristic_name characteristics.name%type,v_message out varchar2) IS

	v_validate1 integer:=0;
	v_validate2 integer:=0;
	v_validate3 integer:=0;
	v_validate4 number(19):=0;
	v_validate5 number(19):=0;
	v_validate6 integer:=0;
	v_user_id number(19):=0;
	v_characteristic_id number(19):=0;

	v_id number(19):=0;


	begin

		select id into v_user_id from users
		where username=v_username;

		select id into v_characteristic_id from characteristics
		where name=v_characteristic_name;

		select count(*) into v_validate6 from user_dislikes;

		if(v_validate6!=0) then 

			select id into v_id from user_dislikes
			where rownum=1  
			order by id desc;

		end if;

		v_id:=v_id+1;

		select count(*) into v_validate2 from user_dislikes
		where user_id=v_user_id and characteristic_id=v_characteristic_id;

		select count(*) into v_validate3 from user_likes
		where user_id=v_user_id and characteristic_id=v_characteristic_id;

		select count_dislikes into v_validate4 from user_pref_count
		where user_id=v_user_id ;

		select count_likes into v_validate5 from user_pref_count
		where user_id=v_user_id;

		if(v_validate2=1) then
			v_message:='already disliked';
		else
			insert into user_dislikes(id,user_id,characteristic_id) values(v_id,v_user_id,v_characteristic_id);
			v_message:='dislike submited';

			v_validate4:=v_validate4+1;

			update user_pref_count
			set count_dislikes=v_validate4
			where user_id=v_user_id;

		end if;

		if(v_validate3=1) then
			delete from user_likes
			where user_id=v_user_id and characteristic_id=v_characteristic_id;
		
			v_validate5:=v_validate5-1;

			update user_pref_count
			set count_likes=v_validate5
			where user_id=v_user_id;

		end if;

	end dislike_characteristic;



	procedure delete_dislike_characteristic(v_username users.username%type, v_characteristic_name characteristics.name%type,v_message out varchar2) IS

	v_validate1 integer:=0;
	v_validate2 number(19):=0;
	v_user_id number(19):=0;
	v_characteristic_id number(19):=0;

	begin

		select id into v_user_id from users
		where username=v_username;

		select id into v_characteristic_id from characteristics
		where name=v_characteristic_name;

		select count(*) into v_validate1 from user_dislikes
		where user_id=v_user_id and characteristic_id=v_characteristic_id;

		select count_dislikes into v_validate2 from user_pref_count
		where user_id=v_user_id ;

		if(v_validate1=1 ) then

			delete from user_dislikes
			where user_id=v_user_id and characteristic_id=v_characteristic_id;

			v_validate2:=v_validate2-1;

			update user_pref_count
			set count_dislikes=v_validate2
			where user_id=v_user_id;

		end if;


	end delete_dislike_characteristic;



END manage_users_dislikes;