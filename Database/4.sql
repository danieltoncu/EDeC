CREATE OR REPLACE PACKAGE manage_score IS

	procedure add_health_score(v_product_id product.product_id%type,v_product_score health.health_score%type,v_message out varchar2) ;

	procedure add_environment_score(v_product_id product.product_id%type,v_product_score environment.environment_score%type,v_message out varchar2) ;

	procedure add_society_score(v_product_id product.product_id%type,v_product_score society.society_score%type,v_message out varchar2) ;

	procedure change_health_score(v_product_id product.product_id%type,v_product_score health.health_score%type,v_message out varchar2) ;

	procedure change_environment_score(v_product_id product.product_id%type,v_product_score environment.environment_score%type,v_message out varchar2) ;

	procedure change_society_score(v_product_id product.product_id%type,v_product_score society.society_score%type,v_message out varchar2) ;


	score_not_in_range EXCEPTION;
	PRAGMA EXCEPTION_INIT(score_not_in_range, -20014);
	product_score_dosnt_exists EXCEPTION;
	PRAGMA EXCEPTION_INIT(product_score_dosnt_exists, -20015);


END manage_score;



CREATE OR REPLACE PACKAGE BODY manage_score IS

	procedure change_health_score(v_product_id product.product_id%type,v_product_score health.health_score%type,v_message out varchar2) IS

		v_validate integer:=0;
		v_score1 number(3,1):=0;
		v_score2 number(3,1):=0;
		v_score_med number(3,1):=0;

	begin

		select count(*) into v_validate from health 
		where product_id=v_product_id and health_score=v_product_score;

		select environment_score into v_score1 from environment
		where product_id=v_product_id;

		select society_score into v_score2 from society
		where product_id=v_product_id;

		if(v_validate=1) then
		
			if(v_product_score>0 and v_product_score<11)then
				
				update health
				set health_score=v_product_score
				where product_id=v_product_id;

				v_score_med:=(v_product_score+v_score1+v_score2)/3;

				update overall_score
				set overall_score=v_score_med
				where product_id=v_product_id;

				v_message:='score changed';
	
			else
		
				v_message:='score not in range';
				raise score_not_in_range;
	
			end if;
		
		else
	
			v_message:='product dosent exists or the score is the same';
			raise product_score_dosnt_exists;

		end if;

		EXCEPTION
			WHEN score_not_in_range THEN
  				raise_application_error(-20014,v_message);
  			WHEN product_score_dosnt_exists then
  				raise_application_error(-20015,v_message);


	end change_health_score;



	procedure change_environment_score(v_product_id product.product_id%type,v_product_score environment.environment_score%type,v_message out varchar2) IS

		v_validate integer:=0;
		v_score1 number(3,1):=0;
		v_score2 number(3,1):=0;
		v_score_med number(3,1):=0;

	begin

		select count(*) into v_validate from environment 
		where product_id=v_product_id and environment_score=v_product_score;

		select health_score into v_score1 from health
		where product_id=v_product_id;

		select society_score into v_score2 from society
		where product_id=v_product_id;

		if(v_validate=1) then
	
			if(v_product_score>0 and v_product_score<11) then
	
				update environment
				set environment_score=v_product_score
				where product_id=v_product_id;

				v_score_med:=(v_product_score+v_score1+v_score2)/3;

				update overall_score
				set overall_score=v_score_med
				where product_id=v_product_id;

				v_message:='score changed';
	
			else
		
				v_message:='score not in range';
				raise score_not_in_range;
	
			end if;

		else
	
		v_message:='product dosent exists or the score is the same';
		raise product_score_dosnt_exists;

	end if;

	EXCEPTION
		WHEN score_not_in_range then
			raise_application_error(-20014,v_message);
		WHEN product_score_dosnt_exists then
			raise_application_error(-20015,v_message);


	end change_environment_score;



	procedure change_society_score(v_product_id product.product_id%type,v_product_score society.society_score%type,v_message out varchar2) IS

		v_validate integer:=0;
		v_score1 number(3,1):=0;
		v_score2 number(3,1):=0;
		v_score_med number(3,1):=0;

	begin

		select count(*) into v_validate from society 
		where product_id=v_product_id and society_score=v_product_score;

		select environment_score into v_score1 from environment
		where product_id=v_product_id;

		select health_score into v_score2 from health
		where product_id=v_product_id;

		if(v_validate=1) then
	
			if(v_product_score>0 and v_product_score<11)then
				update society
				set society_score=v_product_score
				where product_id=v_product_id;

				v_score_med:=(v_product_score+v_score1+v_score2)/3;

				update overall_score
				set overall_score=v_score_med
				where product_id=v_product_id;

				v_message:='score changed';	
			
			else
		
				v_message:='score not in range';
				raise score_not_in_range;
	
			end if;

		else
	
			v_message:='product dosent exists or the score is the same';
			raise product_score_dosnt_exists;

		end if;

		EXCEPTION
			WHEN score_not_in_range then
				raise_application_error(-20014,v_message);
			WHEN product_score_dosnt_exists THEN
				raise_application_error(-20015,v_message);

	end change_society_score;


	procedure add_health_score(v_product_id product.product_id%type,v_product_score health.health_score%type,v_message out varchar2) IS
		
		v_id number(10):=0;
		v_validate integer:=0;
		v_validate1 integer:=0;
		v_validate2 integer:=0;
		v_validate3 integer:=0;
		v_validate4 integer:=0;
		v_validate5 integer:=0;

		v_id1 number(10):=0;

		v_score1 number(3,1):=0;
		v_score2 number(3,1):=0;
		v_med number(3,1):=0;

	begin

		select count(*) into v_validate1 from health;

		if(v_validate1>0)then

			select health_id into v_id from health
			where rownum=1  
			order by health_id desc;

		end if;

		select count(*) into v_validate2 from environment;

		if(v_validate2>0) then

			select environment_score into v_score1 from environment
			where product_id=v_product_id;

		end if;

		select count(*) into v_validate3 from society;

		if(v_validate3>0) then


			select society_score into v_score2 from society
			where product_id=v_product_id;

		end if;

		v_id:=v_id+1;

		select count(*) into v_validate from health
		where product_id=v_product_id;


		select count(*) into v_validate4 from overall_score
		where product_id=v_product_id;

		select count(*) into v_validate5 from overall_score;

		if(v_validate5>0) then

			select overall_score_id into v_id1 from overall_score
			where rownum=1  
			order by overall_score_id desc;

		end if;


		if(v_validate=0) then

			if(v_product_score>0 and v_product_score<11) then

				insert into health values(v_id,v_product_score,null,v_product_id);
				v_med:=(v_score1+v_score2+v_product_score)/3;

				if(v_validate4=1) then

					update overall_score
					set overall_score=v_med
					where product_id=v_product_id;

				else

					insert into overall_score values(v_id1,v_med,null,v_product_id);
		
				end if;
	
				v_message:='score submited';

			else 
				
				v_message:='score not in range';
				raise score_not_in_range;

			end if;
		
		else

			v_message:='product dosent exists or the score is the same';
			raise product_score_dosnt_exists;

		end if;

		EXCEPTION
			WHEN score_not_in_range then
				raise_application_error(-20014,v_message);
			WHEN product_score_dosnt_exists then
				raise_application_error(-20015,v_message);


	end add_health_score;



	procedure add_environment_score(v_product_id product.product_id%type,v_product_score environment.environment_score%type,v_message out varchar2) IS

		v_id number(10):=0;
		v_validate integer:=0;
		v_score1 number(3,1):=0;
		v_validate1 integer:=0;
		v_validate2 integer:=0;
		v_validate3 integer:=0;

		v_score2 number(3,1):=0;
		v_med number(3,1):=0;

	begin

		select count(*) into v_validate1 from environment;

		if(v_validate1>0)then

			select environment_id into v_id from environment
			where rownum=1  
			order by environment_id desc;

		end if;

		select count(*) into v_validate2 from health;

		if(v_validate2>0) then

			select health_score into v_score1 from health
			where product_id=v_product_id;

		end if;

		select count(*) into v_validate3 from society;

		if(v_validate3>0) then

			select society_score into v_score2 from society
			where product_id=v_product_id;

		end if;


		v_id:=v_id+1;

		select count(*) into v_validate from environment
		where product_id=v_product_id;



		if(v_validate=0) then

			if(v_product_score>0 and v_product_score<11) then

				insert into environment values(v_id,v_product_score,null,v_product_id);

				v_med:=(v_score1+v_score2+v_product_score)/3;

				update overall_score
				set overall_score=v_med
				where product_id=v_product_id;
				v_message:='score submited';

			else
			
				v_message:='score not in range';
				raise score_not_in_range;

			end if;

		else
	
			v_message:='product dosent exists or the score is the same';
			raise product_score_dosnt_exists;

		end if;

		EXCEPTION
			WHEN score_not_in_range then
				raise_application_error(-20014,v_message);
			WHEN product_score_dosnt_exists then
				raise_application_error(-20015,v_message);

	end add_environment_score;


	procedure add_society_score(v_product_id product.product_id%type,v_product_score society.society_score%type,v_message out varchar2) IS

		v_id number(10):=0;
		v_validate integer:=0;
		v_score1 number(3,1):=0;
		v_validate1 integer:=0;
		v_validate2 integer:=0;
		v_validate3 integer:=0;

		v_score2 number(3,1):=0;
		v_med number(3,1):=0;

	begin

		select count(*) into v_validate1 from society;

		if(v_validate1>0)then

			select society_id into v_id from society
			where rownum=1  
			order by society_id desc;

		end if;

		select count(*) into v_validate2 from health;

		if(v_validate2>0) then

			select health_score into v_score1 from health
			where product_id=v_product_id;

		end if;

		select count(*) into v_validate3 from environment;

		if(v_validate3>0) then

			select environment_score into v_score2 from environment
			where product_id=v_product_id;

		end if;

		v_id:=v_id+1;

		select count(*) into v_validate from society
		where product_id=v_product_id;

		if(v_validate=0) then

			if(v_product_score>0 and v_product_score<11) then	
	
				insert into society values(v_id,v_product_score,null,v_product_id);

				v_med:=(v_score1+v_score2+v_product_score)/3;

				update overall_score
				set overall_score=v_med
				where product_id=v_product_id;

				v_message:='score submited';

			else

				v_message:='score not in range';
				raise score_not_in_range;

			end if;

		else
	
			v_message:='product dosent exists or the score is the same';
			raise product_score_dosnt_exists;

		end if;

		EXCEPTION
			WHEN score_not_in_range then
				raise_application_error(-20014,v_message);
			WHEN product_score_dosnt_exists then
				raise_application_error(-20015,v_message);


	end add_society_score;


end manage_score;