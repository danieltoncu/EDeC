CREATE OR REPLACE PACKAGE manage_ingredients IS

function add_ingredient(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type,p_product_id ingredients.product_id%type);

function delete_ingredient(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type);

function change_concern_level(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type);

END manage_ingredients;



CREATE OR REPLACE PACKAGE BODY manage_ingredients IS

function add_ingredient(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type,p_product_id ingredients.product_id%type) IS
return varchar2
begin



end add_ingredient;



function delete_ingredient(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type) IS
return varchar2

begin



end delete_ingredient;



function change_concern_level(p_ingredient_id ingredients.ingredient_id%type,p_ingredient_name ingredients.ingredient_name%type,p_ingredient_concern_level ingredients.ingredient_concern_level%type) IS
return varchar2

begin


END change_concern_level;

    
    
END manage_ingredients; 