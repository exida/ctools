%% @author exida
%% @doc

-module(general).
-author('exida').
-export([general_panel/1, update/0, refine/0]).
-include_lib("nitrogen_core/include/wf.hrl").

cell(Val) -> 
    #tablecell {text=Val}.

general_panel(Modules) ->
    #panel {
        body = #table { rows=[
        #tablerow { cells=[
            #tableheader { text="" } |
            lists:map(fun(Module) -> #tableheader { text=Module:get(fullname) } end, Modules)
          ]} |
    
        lists:map(
        fun(Row) ->
                #tablerow { cells=[ #tablecell{ body=Row } |
                        lists:map(fun(Module) -> cell(Module:about(Row)) end, Modules)
            ]}
        end,
        [homepage, general, dependency, performance, method, arch, limitations, usage, extra])
    ]}}.

update() -> refine:update_element(?MODULE, general_panel, refine_general).

refine() -> refine:refine(?MODULE, general_panel).

