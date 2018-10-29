%% @author exida
%% @doc

-module(mnesia_reset).
-author('exida').
-compile(export_all).

-include_lib("nitrogen_core/include/wf.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "Comparison of memory tools".

body() ->
    [
        #button { id=select, text="Reset", postback=reset }
    ].

event(reset) ->
    wf:wire(#confirm{ text="Are you sure?", postback=reset_confirmed});

event(reset_confirmed) ->
    mnesia:clear_table(evaluation).

