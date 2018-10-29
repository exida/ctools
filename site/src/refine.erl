%% @author exida
%% @doc

-module(refine).
-author('exida').
-export([get_modules/0, select_modules/2, refine/2, refine/3, update_element/3, element/3]).

-include_lib("nitrogen_core/include/wf.hrl").

select_modules(Modules, Postback) ->
    #panel {
        body = ["Select modules:",
            lists:map(fun(Module) -> #checkbox{id=Module, text=Module, checked=lists:member(Module, Modules)} end, config:all_modules()),
            #button { text="Refine", postback=Postback }
        ]
    }.

get_modules() ->
    lists:filter(fun(Module) -> wf:q(Module) == "on" end, config:all_modules()).

refine(Module, Panel) ->
    refine(Module, Panel, get_modules()).

refine(Module, Panel, Modules) ->
    wf:update(refine_content, Module:Panel(Modules)).

update_element(Module, Panel, Postback) ->
    wf:update(content, element(Module, Panel, Postback)).

element(Module, Panel, Postback) ->
    #panel {
        body = [
            select_modules(config:all_modules(), Postback),
            #panel {
                id=refine_content, 
                body=Module:Panel(config:all_modules())
            }
        ]
    }.

