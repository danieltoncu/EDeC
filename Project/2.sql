CREATE OR REPLACE PACKAGE manage_users IS

procedure add_user (v_username users.username%type,v_password users.password%type,v_check_password users.password%type,v_email users.email%type,v_message out varchar2);

procedure delete_user(v_username users.username%type,v_password users.password%type,v_message out varchar2);

procedure log_in(v_username users.username%type,v_password users.password%type,v_message out varchar2 );

procedure change_passwd(v_username users.username%type,v_old_password users.password%type,v_new_password users.password%type,v_message out varchar2);

procedure change_email(v_username users.username%type,v_old_email users.email%type,v_new_email users.email%type,v_message out varchar2);

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
    user_dosent_exists exception;
    PRAGMA EXCEPTION_INIT(user_dosent_exists,-20006);
    someting_wrong exception;
    PRAGMA EXCEPTION_INIT(someting_wrong,-20007);


END manage_users;




CREATE OR REPLACE PACKAGE BODY manage_users IS

    procedure add_user (v_username users.username%type,v_password users.password%type,v_check_password users.password%type,v_email users.email%type,v_message out varchar2)  IS

    
    v_num integer:=0;
    v_id number(10);
    v_ids integer:=0;


    BEGIN
    

    select count(*) into v_num from users
    where username=v_username;

    select count(*) into v_ids from users;


    v_message:='Registration succeded';

    if(v_ids=0) then
        v_id:=1;
    else
        select user_id into v_id from users
        where rownum=1  
        order by user_id desc;

        v_id:=v_id+1;
    end if;



    if(v_username is null) then
        raise absent_username;
    end if;

    if(v_password is null) then
        raise absent_password;
    end if;

    if(v_check_password is null) then
        raise absent_password;
    end if;

    if(v_password!=v_check_password) then
        raise passwords_not_equal;
    end if;

    if(v_email is null) then
        raise absent_email;
    end if;

    if(v_num!=0) then
        raise username_already_in_use;
    end if;

    insert into users values(v_id,v_username,v_password,v_email);




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
    

    procedure delete_user(v_username users.username%type,v_password users.password%type,v_message out varchar2) IS

    v_validate integer:=0;

    BEGIN

    select count(*) into v_validate from users
    where username=v_username;

    if(v_validate=1) then
        delete from users where username=v_username and password=v_password;
        v_message:='User was deleted succesfully';
    else
        v_message:='user dosent exitst';
    end if;


    exception 
        when user_dosent_exists  then
            raise_application_error(-20006,'User doesn t exists');
        when someting_wrong then
            raise_application_error(-20007,'Someting went wrong');

    END delete_user;



    procedure log_in(v_username users.username%type,v_password users.password%type,v_message out varchar2) IS
    v_validate integer:=0;


    BEGIN

    select count(*) into v_validate from users
    where username=v_username and password=v_password;

    if(v_validate=1) then
        v_message:='succesfully logged';
    else
        v_message:='Log in failed';
    end if;

    END log_in;



    procedure change_passwd(v_username users.username%type,v_old_password users.password%type,v_new_password users.password%type,v_message out varchar2) IS
    v_validate integer:=0;



    BEGIN

    select count(*) into v_validate from users 
    where username=v_username and password=v_old_password;

    if(v_new_password is not null and v_validate=1) then

        update users
        set password=v_new_password
        where username=v_username;
        v_message:='password updated';

    else
        v_message:='password not changed';

    end if;


    END change_passwd;

    


    procedure change_email(v_username users.username%type,v_old_email users.email%type,v_new_email users.email%type,v_message out varchar2) IS
    v_validate integer:=0;



    BEGIN

    select count(*) into v_validate from users 
    where username=v_username and email=v_old_email;

    if(v_new_email is not null and v_validate=1) then

        update users 
        set email=v_new_email
        where username=v_username;
        v_message:='email updated';

    else
        v_message:='email not changed';

    end if;

    end change_email;


END manage_users;