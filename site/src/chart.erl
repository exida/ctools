%% @author exida

%% @doc

-module(chart).
-compile(export_all).
-author('exida').

-export([chart_panel/1, update/0, refine/0]).

-include_lib("nitrogen_core/include/wf.hrl").

cell([]) -> #tablecell { text="---" };
cell([{EvalButton, EvalComment}]) -> 
    #tablecell {text=evaluation:celltext(EvalButton, EvalComment), class=EvalButton}.

chart_panel(Modules) ->
    #panel {
        body = #table { rows=[
        #tablerow { cells=[
            #tableheader { text="" } |
            lists:map(fun(Module) -> #tableheader { text=Module:get(fullname) } end, Modules)
          ]} |
    
        lists:map(
        fun(DirtyTestCase) ->
                TestCase = fs_path:file_name(DirtyTestCase),
%                io:format("~n~s | ~s~n", [TestCase, DirtyTestCase]),
                #tablerow { cells=[ #tablecell{ body=#link{ text=DirtyTestCase, postback={read_testcase, TestCase} } } |
                    lists:map(fun(Module) -> cell(db:mnesia_read(Module, TestCase)) end, Modules)
            ]}
        end,
        lists:sort(testcase:gather_sources()))
    ]}}.

update() -> refine:update_element(?MODULE, chart_panel, refine_chart).

refine() -> refine:refine(?MODULE, chart_panel).

