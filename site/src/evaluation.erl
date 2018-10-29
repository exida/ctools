%% @author exida
%% @doc

-module(evaluation).
-author('exida').

-export([eval_id/1, eval_comment_id/1, evaluation_panel/2, celltext/1, celltext/2]).

-include_lib("nitrogen_core/include/wf.hrl").

celltext(EvalButton, "") -> atom_to_list(EvalButton);
celltext(EvalButton, undefined) -> atom_to_list(EvalButton);
celltext(EvalButton, EvalComment) -> atom_to_list(EvalButton) ++ " (" ++ EvalComment ++ ")".

celltext([]) -> "---";
celltext([{EvalButton, EvalComment}]) -> celltext(EvalButton, EvalComment).

eval_id(Module) ->
    list_to_atom("eval_" ++ atom_to_list(Module:get(output_id))).

eval_comment_id(Module) ->
    list_to_atom("eval_comment_" ++ atom_to_list(Module:get(output_id))).

eval_buttons(Module, TestCase) -> eval_buttons(Module, TestCase, wf:user()).
eval_buttons(Module, TestCase, dirty) -> #p{};
eval_buttons(Module, TestCase, exida) ->
    #panel {
        body = [
            "Evaluate tool:",
            lists:map(fun(Eval) -> #button {text = Eval, postback = {call, {db, mnesia_write_update, [Module, TestCase, Eval]}}} end,
                config:evaluation_options()),
            #textbox { id=eval_comment_id(Module) }
        ]            
    }.

evaluation_panel_edit_enable(Module, TestCase) ->
    #panel {
        body = [
            #panel {
            body = [
                "Current evaluation: ",
                    #panel {
                        id = eval_id(Module),
                        body = celltext(db:mnesia_read(Module, TestCase))
                    }
            ]},
            eval_buttons(Module, TestCase)
        ]
    }.

evaluation_panel(Module, TestCase) ->
    evaluation_panel_edit_enable(Module, TestCase).

