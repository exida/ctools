%% @author exida
%% @doc
%% mnesia:create_table (evaluation, [{attributes, record_info (fields, evaluation)}, {disc_copies, [node()]}]);

-module(db).
-author('exida').
-export([mnesia_write/3, mnesia_write_update/3, mnesia_read/2]).

-include_lib("nitrogen_core/include/wf.hrl").
-include_lib("../include/records.hrl").

mnesia_write_update(Module, TestCase, EvalButton) ->
    EvalComment = wf:q(evaluation:eval_comment_id(Module)),
    mnesia_write(Module, TestCase, {EvalButton, EvalComment}),
    EvalId = evaluation:eval_id(Module),
    wf:update(
        EvalId, 
        #panel {
            id = EvalId, 
            body = evaluation:celltext(EvalButton, EvalComment),
            actions=#effect { effect=highlight }
        }
    ).

mnesia_write(Module, TestCase, Eval) ->
    Tool = Module:get(output_id),
    Fun = fun() -> mnesia:write(#evaluation{testtool={TestCase, Tool, wf:user()}, evaluation=Eval}) end,
    mnesia:transaction(Fun).

mnesia_read(Module, TestCase) ->
    Tool = Module:get(output_id),
    Fun = fun() ->
%MS: does not read without that username change for demo
%        Eval = #evaluation{testtool = {TestCase, Tool, wf:user()}, evaluation='$1'},
        Eval = #evaluation{testtool = {TestCase, Tool, exida}, evaluation='$1'},
    		mnesia:select(evaluation, [{Eval, [], ['$1']}])
        end,
    {atomic, Eval} = mnesia:transaction(Fun),
    Eval.

