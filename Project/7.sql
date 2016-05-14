CREATE OR REPLACE PACKAGE manage_products IS

procedure add_product(v_product_name product.product_name%type,v_category_id product.category_id%type,v_product_brand product.product_brand%type,v_description product.product_description%type,v_message out varchar2);

procedure delete_product(v_product_name product.product_name%type,v_message out varchar2);

procedure change_product_name(v_product_name_old product.product_name%type,v_product_name_new product.product_name%type,v_message out varchar2);

procedure change_product_category(v_product_name product.product_name%type,v_category_id_old product.category_id%type,v_category_id_new product.category_id%type,v_message out varchar2);

procedure change_product_brand(v_product_brand_old product.product_brand%type,v_product_brand_new product.product_brand%type,v_message out varchar2);

procedure change_product_description(v_product_name product.product_name%type,v_description product.product_description%type,v_message out varchar2);


END manage_products;



CREATE OR REPLACE PACKAGE BODY manage_products IS

procedure add_product(v_product_name product.product_name%type,v_category_id product.category_id%type,v_product_brand product.product_brand%type,v_description product.product_description%type,v_message out varchar2) IS

    
v_num integer:=0;
v_id number(10):=0;
v_ids integer:=0;

begin

select count(*) into v_num from product
where product_name=v_product_name;

select count(*) into v_ids from product;

if(v_num!=0) then
	v_message:='product already exists';

end if;

if(v_ids=0 and v_num=0 ) then
	v_id:=0;
elsif(v_ids>0 and v_num=0) then
	select product_id into v_id from product
	where rownum=1
	order by product_id desc;

	v_id:=v_id+1;
end if;

	insert into product values(v_id,v_product_name,v_category_id,v_product_brand,v_description);
	v_message:='product inserted';

end add_product;



procedure delete_product(v_product_name product.product_name%type,v_message out varchar2) IS
    v_validate integer:=0;
begin

select count(*) into v_validate from product
where upper(product_name)=upper(v_product_name);

    if(v_validate=1) then
        delete from product where  upper(product_name)=upper(v_product_name);
        v_message:='product was deleted succesfully';
    else
        v_message:='product dosent exitst';
    end if;

    return v_message;

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
        v_message:='product_name updated';

    else
        v_message:='product_name not changed';

    end if;



end change_product_name;
    


    
procedure change_product_category(v_product_name product.product_name%type,v_category_id_old product.category_id%type,v_category_id_new product.category_id%type,v_message out varchar2) IS

    v_validate integer:=0;

begin

select count(*) into v_validate from product 
    where product_name=v_product_name and category_id=v_category_id_old;


    if(v_category_id_new is not null and v_validate=1) then

        update product
        set category_id=v_category_id_new
        where product_name=v_product_name;
        v_message:='category of product updated';

    else
        v_message:='category of product not changed';

    end if;

    return v_message;

END change_product_category;




procedure change_product_brand(v_product_brand_old product.product_brand%type,v_product_brand_new product.product_brand%type,v_message out varchar2) IS
    v_validate integer:=0;

begin

select count(*) into v_validate from product 
    where product_brand=v_product_brand_old ;


    if(v_product_brand_new is not null and v_validate>0) then

        update product
        set product_brand=v_product_brand_new
        where product_brand=v_product_brand_old;
        v_message:=' brand  updated';

    else
        v_message:='brand  not changed';

    end if;

return v_message;




end change_product_brand;



procedure change_product_description(v_product_name product.product_name%type,v_description product.product_description%type,v_message out varchar2) IS

    v_validate integer:=0;

begin

select count(*) into v_validate from product 
    where product_name=v_product_name ;


    if( v_validate=1) then

        update product
        set product_description=v_description
        where product_name=v_product_name;
        v_message:='description of product updated';

    else
        v_message:='description of product not changed';

    end if;

end change_product_description;



END manage_products; 