CREATE OR REPLACE PACKAGE manage_categorys IS

    procedure add_category(v_category_name category.category_name%type,v_message out varchar2);

    procedure delete_category(v_category_name category.category_name%type,v_message out varchar2);

    procedure change_category_name(v_category_name_old category.category_name%type,v_category_name_new category.category_name%type,v_message out varchar2);

    category_exists EXCEPTION;
    PRAGMA EXCEPTION_INIT(category_exists,-20022);
    category_dosent_exists EXCEPTION;
    PRAGMA EXCEPTION_INIT(category_dosent_exists,-20023);

END manage_categorys;



CREATE OR REPLACE PACKAGE BODY manage_categorys IS

    procedure add_category(v_category_name category.category_name%type,v_message out varchar2) IS

        v_num integer:=0;
        v_id number(10):=0;
        v_ids integer:=0;

    begin

        select count(*) into v_num from category
        where upper(category_name)=upper(v_category_name);

        select count(*) into v_ids from category;

        if(v_num!=0) then
	
            v_message:='category already exists';
            raise category_exists;

        end if;


        if(v_ids=0 and v_num=0 ) then
	
            v_id:=1;

        elsif(v_ids>0 and v_num=0) then
	
           select category_id into v_id from category
	       where rownum=1
	       order by category_id desc;

	       v_id:=v_id+1;

        end if;

	   insert into category values(v_id,v_category_name);
	   v_message:='category inserted';

       EXCEPTION
        when category_exists then
            raise_application_error(-20022,v_message);


    end add_category;



    procedure delete_category(v_category_name category.category_name%type,v_message out varchar2) IS
        
        v_validate integer:=0;
        v_id number(10):=0;

    begin

        select count(*) into v_validate from category
        where upper(category_name)=upper(v_category_name);

        select category_id into v_id from category
        where upper(category_name)=upper(v_category_name); 

        if(v_validate=1) then
        
            delete from product where category_id=v_id;
            delete from category where  category_id=v_id;
            v_message:='category was deleted succesfully';
    
        else
        
            v_message:='category dosent exitst';
            raise category_dosent_exists;
    
        end if;

        EXCEPTION
            when category_dosent_exists then
                raise_application_error(-20023,v_message);

    END delete_category;


    procedure change_category_name(v_category_name_old category.category_name%type,v_category_name_new category.category_name%type,v_message out varchar2) IS
    
        v_validate integer:=0;
        v_id category.category_id%type;

    begin

        select count(*) into v_validate from category 
        where upper(category_name)=upper(v_category_name_old);

        select category_id into v_id from category
        where upper(category_name)=upper(v_category_name_old);

        if(v_category_name_new is not null and v_validate=1) then

            update category
            set category_name=v_category_name_new
            where category_id=v_id;
            v_message:='category_name updated';

        else
        
            v_message:='category name dosent exists';
            raise category_dosent_exists;

        end if;

        EXCEPTION
            when category_dosent_exists then
                raise_application_error(-20022,v_message);

    end change_category_name;
    

END manage_categorys; 