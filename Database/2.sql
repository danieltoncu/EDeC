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

    wrong_username_password exception;
    PRAGMA EXCEPTION_INIT(wrong_username_password,-20008);

    new_password_empty exception;
    PRAGMA EXCEPTION_INIT(new_password_empty,-20009);

    new_email_empty exception;
    PRAGMA EXCEPTION_INIT(new_email_empty,-20010);
    wrong_username_email exception;
    PRAGMA EXCEPTION_INIT(wrong_username_email,-20011);
    

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
       
            v_message:='username is null';
            raise absent_username;
    
        end if;

        if(v_password is null) then
        
            v_message:='password is null';
            raise absent_password;
   
        end if;

        if(v_check_password is null) then
       
            v_message:='password check is null';
            raise absent_password;
   
        end if;

        if(v_password!=v_check_password) then
        
            v_message:='passwords dosent match';
            raise passwords_not_equal;
    
        end if;

        if(v_email is null) then
            
            v_message:='email is null';
            raise absent_email;
   
        end if;

        if(v_num!=0) then
       
            v_message:='username already is used';
            raise username_already_in_use;
    
        end if;

        insert into users values(v_id,v_email,v_password,v_username);
        insert into users_role values(v_id,'ROLE_USER',v_id);

        exception 
            when absent_username then
                raise_application_error (-20001,v_message);
            when absent_password then
                raise_application_error(-20002,v_message);
            when absent_email then
                raise_application_error(-20003,v_message);
            when passwords_not_equal then
                raise_application_error(-20004,v_message);
            when username_already_in_use then
                raise_application_error(-20005,v_message);

    END add_user;
    

    procedure delete_user(v_username users.username%type,v_password users.password%type,v_message out varchar2) IS

        v_validate integer:=0;
        v_id number(10):=0;

    BEGIN

        select count(*) into v_validate from users
        where username=v_username;

        select user_id into v_id from users
        where username=v_username;

        if(v_validate=1) then
        
            delete from users_role where user_id=v_id;
            delete from user_likes where user_id=v_id;
            delete from user_dislikes where user_id=v_id;
            delete from users where username=v_username and password=v_password;
            v_message:='User was deleted succesfully';
    
        elsif(v_validate=0) then
        
            v_message:='user dosent exitst';
            raise user_dosent_exists;
    
        else
            
            v_message:='someting wrong';
            raise someting_wrong;
    
        end if;

        exception 
            when user_dosent_exists  then
                raise_application_error(-20006,v_message);
            when someting_wrong then
                raise_application_error(-20007,v_message);

    END delete_user;


    procedure log_in(v_username users.username%type,v_password users.password%type,v_message out varchar2) IS
        
        v_validate integer:=0;

    BEGIN

        select count(*) into v_validate from users
        where username=v_username and password=v_password;

        if(v_validate=1) then
        
            v_message:='succesfully logged';
        else
        
            v_message:='wrong username or/and password ';
            raise wrong_username_password;
    
        end if;

        exception
            when wrong_username_password then
                raise_application_error(-20008,v_message);

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

        elsif(v_new_password is null) then

            v_message:='new password is empty';
            raise new_password_empty;

        elsif(v_validate=0) then

            v_message:='wrong username or/and password';
            raise wrong_username_password;

    end if;

        exception 
            when new_password_empty then
                raise_application_error(-20009,v_message);
            when wrong_username_password then
                raise_application_error(-20008,v_message);


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

        elsif(v_new_email is null) then

            v_message:='new email is empty';
            raise new_email_empty;

        elsif(v_validate=0) then

            v_message:='wrong username or/and email';
            raise wrong_username_email;

        end if;

        exception 
            when new_email_empty then
                raise_application_error(-20010,v_message);
            when wrong_username_email then
                raise_application_error(-20011,v_message);

    end change_email;


END manage_users;