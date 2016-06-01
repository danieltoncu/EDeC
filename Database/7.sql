CREATE OR REPLACE PACKAGE manage_products IS

    procedure add_product(v_product_name product.product_name%type,v_category_id product.category_id%type,v_product_brand product.product_brand%type,v_description product.product_description%type,v_message out varchar2);

    procedure delete_product(v_product_name product.product_name%type,v_message out varchar2);

    procedure change_product_name(v_product_name_old product.product_name%type,v_product_name_new product.product_name%type,v_message out varchar2);

    procedure change_product_category(v_product_name product.product_name%type,v_category_id_old product.category_id%type,v_category_id_new product.category_id%type,v_message out varchar2);

    procedure change_product_brand(v_product_brand_old product.product_brand%type,v_product_brand_new product.product_brand%type,v_message out varchar2);

    procedure change_product_description(v_product_name product.product_name%type,v_description product.product_description%type,v_message out varchar2);



    product_already_exists EXCEPTION;
    PRAGMA EXCEPTION_INIT(product_already_exists, -20017);
    category_dosent_exists EXCEPTION;
    PRAGMA EXCEPTION_INIT(category_dosent_exists,-20018);
    product_not_this_category EXCEPTION;
    PRAGMA EXCEPTION_INIT(product_not_this_category,-20019);
    brand_dosent_exists EXCEPTION;
    PRAGMA EXCEPTION_INIT(brand_dosent_exists,-20020);
    product_dosent_exists EXCEPTION;
    PRAGMA EXCEPTION_INIT(product_dosent_exists,-20021);

END manage_products;



CREATE OR REPLACE PACKAGE BODY manage_products IS

    procedure add_product(v_product_name product.product_name%type,v_category_id product.category_id%type,v_product_brand product.product_brand%type,v_description product.product_description%type,v_message out varchar2) IS

        v_num integer:=0;
        v_id number(10):=0;
        v_ids integer:=0;

    begin

        select count(*) into v_num from product
        where upper(product_name)=upper(v_product_name);

        select count(*) into v_ids from product;

        if(v_ids=0 and v_num=0 ) then
	
            v_id:=1;

        elsif(v_ids>0 and v_num=0) then
	       
           select product_id into v_id from product
	       where rownum=1
	       order by product_id desc;

	       v_id:=v_id+1;

        end if;

        if(v_num!=0) then
    
            v_message:='product already exists';
            raise product_already_exists;
        else
   
            insert into product values(v_id,v_product_brand,v_description,v_product_name,v_category_id);
            v_message:='product inserted';

        end if;

        EXCEPTION
            when product_already_exists then
                raise_application_error(-20017,v_message);



    end add_product;



    procedure delete_product(v_product_name product.product_name%type,v_message out varchar2) IS
    
        v_validate integer:=0;
        v_id number(10):=0;

    begin

        select count(*) into v_validate from product
        where upper(product_name)=upper(v_product_name);

        select product_id into v_id from product
        where upper(product_name)=upper(v_product_name);

        if(v_validate=1) then
        
            delete from product_caracteristic where product_id=v_id;
            delete from overall_score where product_id=v_id;
            delete from health where product_id=v_id;
            delete from environment where product_id=v_id;
            delete from society where product_id=v_id;
            delete from user_likes where product_id=v_id;
            delete from user_dislikes where product_id=v_id;
            delete from product where product_id=v_id;
            v_message:='product was deleted succesfully';
    
        else
        
            v_message:='product dosent exitst';
            raise product_already_exists;
    
        end if;

        EXCEPTION
            when product_already_exists then
                raise_application_error(-20017,v_message);


    END delete_product;


    procedure change_product_name(v_product_name_old product.product_name%type,v_product_name_new product.product_name%type,v_message out varchar2) IS
    
        v_validate integer:=0;
        v_id product.product_id%type;

    begin

        select count(*) into v_validate from product 
        where upper(product_name)=upper(v_product_name_old);

        select product_id into v_id from product
        where upper(product_name)=upper(v_product_name_old);

        if(v_product_name_new is not null and v_validate=1) then

            update product
            set product_name=v_product_name_new
            where product_id=v_id;
            v_message:='product name updated';

        else
        
            v_message:='product already exists';
            raise product_already_exists;

        end if;

        EXCEPTION
            when product_already_exists then
                raise_application_error(-20017,v_message);

    end change_product_name;
    


    
    procedure change_product_category(v_product_name product.product_name%type,v_category_id_old product.category_id%type,v_category_id_new product.category_id%type,v_message out varchar2) IS

        v_validate integer:=0;
        v_validate1 integer:=0;

    begin

        select count(*) into v_validate from product 
        where product_name=v_product_name and category_id=v_category_id_old;

        select count(*) into v_validate1 from category
        where category_id=v_category_id_new;

        if(v_category_id_new is not null and v_validate=1 and v_validate1=1) then

            update product
            set category_id=v_category_id_new
            where product_name=v_product_name;
            v_message:='category of product updated';

        elsif(v_validate=0) then
        
            v_message:='product not this category';
            raise product_not_this_category;

        elsif(v_validate1=0) then

            v_message:='category dosent exists';
            raise category_dosent_exists;

        end if;

        EXCEPTION
            when category_dosent_exists then
                raise_application_error(-20018,v_message);
            when product_not_this_category then
                raise_application_error(-20019,v_message);


    END change_product_category;



    procedure change_product_brand(v_product_brand_old product.product_brand%type,v_product_brand_new product.product_brand%type,v_message out varchar2) IS
        v_validate integer:=0;

    begin

        select count(*) into v_validate from product 
        where upper(product_brand)=upper(v_product_brand_old) ;

        if(v_product_brand_new is not null and v_validate>0) then

            update product
            set product_brand=v_product_brand_new
            where product_brand=v_product_brand_old;
            v_message:=' brand  updated';

        else
        
            v_message:='brand  dosent exists';
            raise brand_dosent_exists;

        end if;

        EXCEPTION
            when brand_dosent_exists then
                raise_application_error(-20020,v_message);


    end change_product_brand;



    procedure change_product_description(v_product_name product.product_name%type,v_description product.product_description%type,v_message out varchar2) IS

        v_validate integer:=0;

    begin

        select count(*) into v_validate from product 
        where upper(product_name)=upper(v_product_name) ;

        if( v_validate=1) then

            update product
            set product_description=v_description
            where product_name=v_product_name;
            v_message:='description of product updated';

        else
        
            v_message:='product dosent exists';
            raise product_dosent_exists;

        end if;

        EXCEPTION
            when product_dosent_exists then
                raise_application_error(-20021,v_message);

    end change_product_description;


END manage_products; 