%% @author exida
%% @doc

-module(utils).
-author('exida').
-import(lists,[any/2]).
-export([zip_lists/2, iter_module_list/2]).


-include_lib("nitrogen_core/include/wf.hrl").
-include_lib("nitrogen_elements/include/nitrogen_elements.hrl").
%-include_lib("../include/records.hrl").

process(Module, TestCase) ->
	TestCase2 = fs_path:file_name(TestCase),

    {_, Cout} =
    try
        Module:get(compile_panel),
        gen_compile:run_compile_do(Module, TestCase2)
    catch 
        error:badarg -> {0, classify:get(none)};
        error:function_clause -> {0, classify:get(none)}
    end,

    {_, Eout} = 
    try
        Module:get(exec_panel),
        gen_exec:run_exec_do(Module, TestCase2)
    catch 
        error:badarg -> {0, classify:get(none)};
        error:function_clause -> {0, classify:get(none)}
    end,

    {_, Sout} =
    try
        Module:get(source_panel),
        gen_source:run_source_do(Module, TestCase2)
    catch 
        error:badarg -> {0, classify:get(none)};
        error:function_clause -> {0, classify:get(none)}
    end,

    ResList = [Cout, Eout, Sout], 

    StNone = check_for_classify_result(ResList, classify:get(none)),
    StVar= check_for_classify_result(ResList,   classify:get(var)),
    StFunc= check_for_classify_result(ResList,  classify:get(func)),
    StLine = check_for_classify_result(ResList, classify:get(line)),

    %io:format("Results: ~p ~p ~p ~p~n", [StNone, StVar, StFunc, StLine]),
    
    Res =
    if
        StLine -> classify:get(line);
        StFunc -> classify:get(func);
        StVar -> classify:get(var);
        true -> classify:get(none)
    end,
        
    %io:format("~p | ~p | ~p~n", [Module, TestCase2, Res]),
    db:mnesia_write_update(Module, TestCase2, Res)
        .

check_for_classify_result(L, Cl) ->
    Pred = fun(E) -> E =:= Cl end,
    any(Pred, L).
    


iter_src_list(_, []) -> ok;
iter_src_list(Module, [H|T]) ->
	process(Module, H),
	iter_src_list(Module, T).

iter_module_list([], _) -> ok;
iter_module_list([H|T], SrcList) ->
	iter_src_list(H, SrcList), 
    %spawn(?MODULE, iter_src_list, [H, SrcList]),
	iter_module_list(T, SrcList).

zip_lists(ModuleList, SrcList)-> 
    %spawn(?MODULE, iter_module_list, [ModuleList, SrcList]).
	iter_module_list(ModuleList, SrcList).
