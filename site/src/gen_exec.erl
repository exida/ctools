%% @author exida
%% @doc

-module(gen_exec).
-author('exida').
-export([element/2, run_exec/2, run_exec_do/2]).

-export([update_exec_output/2, update_exec_loading/1, get_exec_params/1]).

-include_lib("nitrogen_core/include/wf.hrl").

loading() -> "loading".

update_exec(Module, Content) ->
    wf:update(
        Module:get(exec_panel), 
        #panel {
            id = compile, 
            body = Content,
            actions=#effect { effect=highlight }
        }
    ).

update_exec_output(Module, TestCase) ->
    Content = output:element(TestCase, Module:get(output_id)),
    update_exec(Module, Content).

update_exec_loading(Module) ->
    update_exec(Module, loading()).

run_exec(Module, TestCase) ->
    update_exec_loading(Module),
    apply(?MODULE, run_exec_do, [Module, TestCase]),
    update_exec_output(Module, TestCase).

get_exec_params(Module) -> {
        Module:get(output_id),
        Module:get(tool_cmd),
        Module:get(tool_opts),
        Module:get(compiler_id)
    }.

run_exec_do(Module, TestCase) -> 
    try 
        {Tool, ToolCommand, ToolOpts, Compiler} = get_exec_params(Module),
        file:make_dir(fs_path:out_path(TestCase)),


        Cmd = io_lib:format("./data/run.sh \"~s\" \"~s\" \"~s\" \"~s\" \"~s\" \"~s\"",
    		  [ToolCommand,
    		   ToolOpts,
    		   fs_path:file_path(TestCase, Compiler, exe),
    		   fs_path:file_path(TestCase, Tool, stdout),
    		   fs_path:file_path(TestCase, Tool, stderr),
    		   fs_path:file_path(TestCase, Tool, time)]),
        %io:format("~s~n", [Cmd]),
        os:cmd(Cmd),

        CmdAuto = io_lib:format("./data/scratch.sh \"~s\" \"~s\" \"~s\"",
                      [fs_path:source_path(TestCase),
                       fs_path:file_path(TestCase, Tool, stdout),
                       fs_path:file_path(TestCase, Tool, stderr)]
                       ),

        launch:launch_exec(CmdAuto)
        %{ExitCode, Output} = utils:launch_exec(CmdAuto),
        %db:mnesia_write_update(Module, TestCase, list_to_atom(Output)),
        %error_logger:info_msg("executed~n")
    catch 
        error:badarg -> error_logger:info_msg("exec not applicable for this tool~n");
        error:function_clause -> error_logger:info_msg("exec not applicable for this tool~n")
    end.

exec_button(Module, TestCase, Text) ->
    #button {
        text = Text,
        postback = {call, {?MODULE, run_exec, [Module, TestCase]}}
    }.

element(Module, TestCase) ->
    Text = "Run " ++ Module:get(fullname),
    #panel {
        body =  [
            #hr{},
            exec_button(Module, TestCase, Text), #p{},
            evaluation:evaluation_panel(Module, TestCase),
            #panel {
                id = Module:get(exec_panel),
                body = output:element(TestCase, Module:get(output_id))
            }
        ]
    }.

