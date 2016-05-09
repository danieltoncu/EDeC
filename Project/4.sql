CREATE OR REPLACE PACKAGE manage_score IS

function change_health_score(p_product_id product.product_id%type,p_product_score health.product_score%type);

function change_environment_score(p_product_id product.product_id%type,p_product_score environment.product_score%type);

function change_society_score(p_product_id product.product_id%type,p_product_score society.product_score%type);


end manage_score;

CREATE OR REPLACE PACKAGE BODY manage_score IS

function change_health_score(p_product_id product.product_id%type,p_product_score health.product_score%type) IS
return varchar2

v_validate integer:=0;
v_message:='';
v_score1 number(3,1):=0;
v_score2 number(3,1):=0;
v_score_med number(3,1):=0;


begin

select count(*) into v_validate from health 
where product_id=p_product_id and product_score=product_score;

select product_score into score1 from environment
where product_id=p_product_id;

select product_score into score2 from society
where product_id=p_product_id;

if(v_validate=1) then
	update health
	set product_score=p_product_score
	where product_id=p_product_id;

	v_score_med:=(p_product_score+score1+score2)/3;

	update overall_score
	set product_overall_score=v_score_med
	where product_id=p_product_id;

	v_message:='score updated';
else
	v_message:='problems';
end if;

return v_message;

end change_health_score;



function change_environment_score(p_product_id product.product_id%type,p_product_score environment.product_score%type) IS
return varchar2

v_validate integer:=0;
v_message:='';
v_score1 number(3,1):=0;
v_score2 number(3,1):=0;
v_score_med number(3,1):=0;


begin

select count(*) into v_validate from environment 
where product_id=p_product_id and product_score=product_score;

select product_score into score1 from health
where product_id=p_product_id;

select product_score into score2 from society
where product_id=p_product_id;

if(v_validate=1) then
	update environment
	set product_score=p_product_score
	where product_id=p_product_id;

	v_score_med:=(p_product_score+score1+score2)/3;

	update overall_score
	set product_overall_score=v_score_med
	where product_id=p_product_id;

	v_message:='score updated';
else
	v_message:='problems';
end if;

return v_message;

end change_environment_score;



function change_society_score(p_product_id product.product_id%type,p_product_score society.product_score%type) IS
return varchar2

v_validate integer:=0;
v_message:='';
v_score1 number(3,1):=0;
v_score2 number(3,1):=0;
v_score_med number(3,1):=0;


begin

select count(*) into v_validate from society 
where product_id=p_product_id and product_score=product_score;

select product_score into score1 from environment
where product_id=p_product_id;

select product_score into score2 from health
where product_id=p_product_id;

if(v_validate=1) then
	update society
	set product_score=p_product_score
	where product_id=p_product_id;

	v_score_med:=(p_product_score+score1+score2)/3;

	update overall_score
	set product_overall_score=v_score_med
	where product_id=p_product_id;

	v_message:='score updated';	
else
	v_message:='problems';
end if;

return v_message;

end change_society_score;

end manage_score;