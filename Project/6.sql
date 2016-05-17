CREATE OR REPLACE PACKAGE manage_caracteristics IS

procedure add_caracteristic(v_caracteristic_concern_level caracteristics.caracteristic_concern_level%type,v_caracteristic_name caracteristics.caracteristic_name%type,v_message out varchar2);

procedure delete_caracteristic(v_caracteristic_name caracteristics.caracteristic_name%type,v_message out varchar2);

procedure change_concern_level(v_caracteristic_name caracteristics.caracteristic_name%type,v_caracteristic_concern_level caracteristics.caracteristic_concern_level%type,v_message out varchar2);

procedure add_caracteristic_to_product(v_caracteristic_id caracteristics.caracteristic_id%type,v_product_id product.product_id%type,v_message out varchar2);


END manage_caracteristics;



CREATE OR REPLACE PACKAGE BODY manage_caracteristics IS

procedure add_caracteristic(v_caracteristic_concern_level caracteristics.caracteristic_concern_level%type,v_caracteristic_name caracteristics.caracteristic_name%type,v_message out varchar2) IS
v_validate integer:=0;
v_validate1 integer:=0;
v_id number(10):=0;
begin


select count(*) into v_validate from caracteristics
where upper(caracteristic_name)=upper(v_caracteristic_name);

select count(*) into v_validate1 from caracteristics;

if(v_validate1>0) then

select caracteristic_id into v_id from caracteristics
where rownum=1  
order by caracteristic_id desc;

end if;

v_id:=v_id+1;



if(v_validate=0) then
	insert into caracteristics values(v_id,v_caracteristic_concern_level,v_caracteristic_name);
	v_message:='submited';
else
	v_message:='problems';
end if;
	



end add_caracteristic;



procedure delete_caracteristic(v_caracteristic_name caracteristics.caracteristic_name%type,v_message out varchar2) IS
	v_validate integer:=0;
	v_id number(10):=0;
begin

select count(*) into v_validate from caracteristics
where upper(caracteristic_name)=upper(v_caracteristic_name);

select caracteristic_id into v_id from caracteristics
where upper(caracteristic_name)=upper(v_caracteristic_name);

if(v_validate=1) then
	delete from product_caracteristic where caracteristic_id=v_id;
	delete from caracteristics where caracteristic_id=v_id;
	v_message:='submited';
else
	v_message:='problems';
end if;


end delete_caracteristic;


procedure change_concern_level(v_caracteristic_name caracteristics.caracteristic_name%type,v_caracteristic_concern_level caracteristics.caracteristic_concern_level%type,v_message out varchar2) IS 
v_validate integer:=0;
v_id number(10):=0;
begin

select count(*) into v_validate from caracteristics
where upper(caracteristic_name)=upper(v_caracteristic_name);

select caracteristic_id into v_id from caracteristics
where upper(caracteristic_name)=upper(v_caracteristic_name);

if(v_validate=1) then
	update caracteristics
	set caracteristic_concern_level=v_caracteristic_concern_level
	where caracteristic_id=v_id;
	v_message:='submited';
else
	v_message:='problems';
end if;


END change_concern_level;


procedure add_caracteristic_to_product(v_caracteristic_id caracteristics.caracteristic_id%type,v_product_id product.product_id%type,v_message out varchar2) IS
v_validate1 integer:=0;
v_validate2 integer:=0;
v_id number(10):=0;
v_validate3 integer:=0;
begin

select count(*) into v_validate3 from product_caracteristic;

if(v_validate3>0)then
select product_caracteristic_id into v_id from product_caracteristic
where rownum=1  
order by product_caracteristic_id desc;
end if;

v_id:=v_id+1;



select count(*) into v_validate1 from caracteristics
where caracteristic_id=v_caracteristic_id;

select count(*) into v_validate2 from product
where product_id=v_product_id;

if(v_validate1=1 and v_validate2=1) then
	insert into product_caracteristic values(v_id,v_caracteristic_id,v_product_id);
	v_message:='submited';
else
	v_message:='problems';
end if;

end add_caracteristic_to_product;

    
    
END manage_caracteristics; 