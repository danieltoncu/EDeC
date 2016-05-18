set SERVEROUTPUT ON
declare
	v_message varchar2(100):='';
	p_product varchar2(100):='';
	p_brand varchar2(100):='';
begin
	
	manage_users.add_user('mario','123','123','mario@gmail.com',v_message);
	DBMS_OUTPUT.PUT_LINE(v_message);
	v_message:='';

	manage_categorys.add_category('Food',v_message);
	DBMS_OUTPUT.PUT_LINE(v_message);
	v_message:='';

	manage_products.add_product('Green tea',1,'Greenfield','good taste',v_message);
	DBMS_OUTPUT.PUT_LINE(v_message);
	v_message:='';


	manage_users_likes.like_product(1,1,v_message);
	DBMS_OUTPUT.PUT_LINE(v_message);
	v_message:='';

	manage_users_dislikes.dislike_product(1,1,v_message);
	DBMS_OUTPUT.PUT_LINE(v_message);
	v_message:='';

	for i in 1..1000000 loop
		if(mod(i,1000)=0) then
			execute immediate'commit';
			DBMS_OUTPUT.PUT_LINE('commit');
		end if;

		p_product:='product'||to_char(i);
		p_brand:='brand'||to_char(i);
		manage_products.add_product(p_product,1,p_brand,'good',v_message);
		DBMS_OUTPUT.PUT_LINE(v_message);
		v_message:='';
		p_product:='';
		p_brand:='';
	end loop;

end;