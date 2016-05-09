CREATE OR REPLACE PACKAGE manage_users IS

Function add_user (p_username users.username%type,p_password users.password%type,p_check_password users.password%type,p_email users.email%type);

Function delete_user(p_username user.username%type,p_password user.password%type) ;

Function log_in(p_username user.username%type,p_password user.password%type );

Function change_passwd(p_username user.username%type,p_old_password users.password%type,p_new_password users.password%type);

Function change_email(p_username users.username%type,p_email users.email%type);

END manage_users;

CREATE OR REPLACE PACKAGE BODY manage_users IS

    Function add_user (p_username users.username%type,p_password users.password%type,p_check_password users.password%type,p_email users.email%type) IS 
    return varchar2

    p_message varchar2(32000):='';
    
    absent_username exception;
    absent_password exception;
    absent_email exception;
    passwords_not_equal exception;
    username_already_in_use exception;
    PRAGMA EXCEPTION_INIT(absent_username, -20001);
    PRAGMA EXCEPTION_INIT(absent_password, -20002);
    PRAGMA EXCEPTION_INIT(absent_email, -20003);
    PRAGMA EXCEPTION_INIT(passwords_not_equal, -20004);
    PRAGMA EXCEPTION_INIT(username_already_in_use, -20005);
    v_num integer:=0;
    v_id number(10);
    v_ids integer:=0;


    BEGIN

    select count(*) into v_num from users
    where upper(username)=upper(p_username);

    select count(*) into v_ids from users;


    if(v_ids==0) then
        v_id:=1;
    else
        select user_id into v_id from users
        order by user_id desc
        where rownum=1;

        v_id:=v_id+1;
    end if;

    if(p_username is null) then
    	raise absent_username;
    end if;

    if(p_password is null) then
    	raise absent_password;
    end if;

    if(p_check_password is null) then
    	raise absent_password;
    end if;

    if(p_username!=p_check_password) then
    	raise passwords_not_equal;
    end if;

    if(p_email is null) then
    	raise absent_email;
    end if;

    if(v_num!=0) then
    	raise username_already_in_use;
    end if;

    insert into users values(p_username,p_password,p_email);

    p_message:='Registration succeded';

    return p_message;

    exception 
    	when absent_username then
    		raise_application_error (-20001,'Write your username');
    	when absent_password then
    		raise_application_error(-20002,'Write the password');
    	when absent_email then
    		raise_application_error(-20003,'Write your email addres');
    	when passwords_not_equal then
    		raise_application_error(-20004,'passwords are not the same');
    	when username_already_in_use then
    		raise_application_error(-20005,'username username_already_in_use');

    END add_user;
    

    Function delete_user(p_username user.username%type,p_password user.password%type) IS
    return varchar2

    p_message varchar2(32000):='';

    BEGIN

    delete from users where username==p_username and password=p_password;

    p_message:='User was deleted succesfully';

    return p_message;

    exception 
        when no_data_found 
            raise_application_error(-20006,'User doesn t exists');
        when others 
            raise_application_error(-20007,'Someting went wrong');

    END delete_user;


    Function log_in(p_username user.username%type,p_password user.password%type ) IS
    return varchar2

    v_validate integer:=0;

    p_message varchar2(32000):='';

    BEGIN

    select count(*) into v_validate from users
    where username=p_username and password=p_password;

    if(v_validate=1) then
        p_message:='succesfully logged';
    elss
        p_message:='Log in failed';
    end if;

    return p_message;
    END log_in;


    Function change_passwd(p_username user.username%type,p_old_password users.password%type,p_new_password users.password%type) is
    return varchar2

    p_message varchar2(32000):='';
    v_validate integer:=0;



    BEGIN

    select count(*) into v_validate from user 
    where username=p_username and password=p_old_password;

    if(p_new_password is not null and v_validate==1) then

        update user 
        set password=p_new_password;
        where username=p_username;
        p_message:='password updated';

    else
        p_message:='password not changed';

    end if;

    return p_message;

    END change_passwd;

    


    Function change_email(p_username users.username%type,p_email users.email%type) is
    return varchar2

    p_message varchar2(32000):='';
    v_validate integer:=0;



    BEGIN

    select count(*) into v_validate from user 
    where username=p_username;

    if(p_email is not null and v_validate==1) then

        update user 
        set email=p_email;
        where username=p_username;
        p_message:='email updated';

    else
        p_message:='email not changed';

    end if;

    return p_message;
    end change_email;


END manage_users;
