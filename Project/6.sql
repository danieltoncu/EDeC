CREATE OR REPLACE PACKAGE manage_caracteristics IS

procedure add_caracteristic(v_caracteristic_id caracteristics.caracteristic_id%type,v_caracteristic_name caracteristics.caracteristic_name%type,v_caracteristic_concern_level caracteristics.caracteristic_concern_level%type,v_product_id caracteristics.product_id%type,v_message out varchar2);

procedure delete_caracteristic(v_caracteristic_id caracteristics.caracteristic_id%type,v_caracteristic_name caracteristics.caracteristic_name%type,v_caracteristic_concern_level caracteristics.caracteristic_concern_level%type,v_message out varchar2);

procedure change_concern_level(v_caracteristic_id caracteristics.caracteristic_id%type,v_caracteristic_name caracteristics.caracteristic_name%type,v_caracteristic_concern_level caracteristics.caracteristic_concern_level%type,v_message out varchar2);

END manage_caracteristics;



CREATE OR REPLACE PACKAGE BODY manage_caracteristics IS

procedure add_caracteristic(v_caracteristic_id caracteristics.caracteristic_id%type,v_caracteristic_name caracteristics.caracteristic_name%type,v_caracteristic_concern_level caracteristics.caracteristic_concern_level%type,v_product_id caracteristics.product_id%type,v_message out varchar2) IS
v_validate integer:=0;
v_message varchar2(100);
begin

select count(*) into v_validate from caracteristics
where caracteristic_name=v_caracteristic_name;

if(v_validate=0) then

end if;
	



end add_caracteristic;



procedure delete_caracteristic(v_caracteristic_id caracteristics.caracteristic_id%type,v_caracteristic_name caracteristics.caracteristic_name%type,v_caracteristic_concern_level caracteristics.caracteristic_concern_level%type,v_message out varchar2) IS
begin



end delete_caracteristic;


procedure change_concern_level(v_caracteristic_id caracteristics.caracteristic_id%type,v_caracteristic_name caracteristics.caracteristic_name%type,v_caracteristic_concern_level caracteristics.caracteristic_concern_level%type,v_message out varchar2) IS 
begin


END change_concern_level;

    
    
END manage_caracteristics; 