%% @author exida
%% @doc

%% -*- mode: nitrogen -*-
-module(login).
-author('exida').
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Comparison of memory tools".

body() ->
    [
        #panel { 
            class=header,
            body = [
                #image { image="images/exida_logo_small.png" },
                "c source code verification tools"
            ]
        },
        #p{},
        login(wf:user())
           ].

login_info(undefined) -> "Please provide a password:";
login_info(User) -> "You are logged as " ++ atom_to_list(User).

login(undefined) ->
    #panel {
        body = [
            #label { text="Password" },
            #password { id=passTextBox, next=okButton },
            #p{},
            #button { id=okButton, text="OK", postback=ok, enter_clicks=[passTextBox] }
        ]
    };

login(User) -> #panel { body = [
        login_info(User),
        #button { id=logoutButton, text="Logout", postback=logout }
    ]}.


event(ok) ->
    Pass = wf:q(passTextBox),
    case Pass of
        "exidact" -> 
            wf:user(exida),
            wf:redirect_from_login("/index");
        "exidademo" -> 
            wf:user(dirty),
            wf:redirect_from_login("/index");
        _ -> wf:redirect("/login")
    end;

event(logout) ->
    wf:clear_session(),
    wf:redirect("/login").

