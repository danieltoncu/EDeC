CREATE OR REPLACE PACKAGE manage_ingredients IS

function add_ingredient(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type,p_product_id ingredients.product_id%type) return varchar2;

function delete_ingredient(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type)return varchar2;

function change_concern_level(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type)return varchar2;

END manage_ingredients;



CREATE OR REPLACE PACKAGE BODY manage_ingredients IS

function add_ingredient(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type,p_product_id ingredients.product_id%type) 
return varchar2 IS

v_validate integer:=0;
v_message varchar2(100);
begin

select count(*) into v_validate from ingredients
where ingredient_name=p_ingredient_name;

if(v_validate=0) then
	



end add_ingredient;



function delete_ingredient(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type)
return varchar2 IS

begin



end delete_ingredient;


function change_concern_level(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type) 
return varchar2 IS

begin


END change_concern_level;

    
    
END manage_ingredients; 