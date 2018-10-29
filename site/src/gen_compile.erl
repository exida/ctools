%% @author exida
%% @doc

-module(gen_compile).
-author('exida').
-export([element/2, run_compile/2, run_compile_do/2]).

-include_lib("nitrogen_core/include/wf.hrl").

loading() -> "loading".

update_compile(Module, Content) ->
    wf:update(
        Module:get(compile_panel), 
        #panel {
            id = compile, 
            body = Content, 
            actions=#effect { effect=highlight }
        }
    ).

update_compile_output(Module, TestCase) ->
    Content = output:element(TestCase, Module:get(compiler_id)),
    update_compile(Module, Content).

update_compile_loading(Module) ->
    update_compile(Module, loading()).

run_compile(Module, TestCase) ->
    update_compile_loading(Module),
    apply(?MODULE, run_compile_do, [Module, TestCase]),
    update_compile_output(Module, TestCase).

get_compiler_params(Module) -> {
        Module:get(compiler_id),
        Module:get(compiler_cmd),
        Module:get(compiler_opts)
    }.

run_compile_do(Module, TestCase) -> 
    try
        {Compiler, CompilerCmd, CompilerOpts} = get_compiler_params(Module),
        Source = fs_path:source_path(TestCase),
        file:make_dir(fs_path:out_path(TestCase)),

        Cmd = io_lib:format("./data/compile.sh \"~s\" \"~s\" \"~s\" \"~s\" \"~s\" \"~s\" \"~s\"",
                      [CompilerCmd,
                       CompilerOpts,
                       Source,
                       fs_path:file_path(TestCase, Compiler, exe),
                       fs_path:file_path(TestCase, Compiler, stdout),
                       fs_path:file_path(TestCase, Compiler, stderr),
                       fs_path:file_path(TestCase, Compiler, time)]
                       ),

        wf:update(Module:get(compile_command_text_panel), compile_command_text(Module, TestCase)),
        os:cmd(Cmd),

        CmdAuto = io_lib:format("./data/scratch.sh \"~s\" \"~s\" \"~s\"",
                      [Source,
                       fs_path:file_path(TestCase, Compiler, stdout),
                       fs_path:file_path(TestCase, Compiler, stderr)]
                       ),

        launch:launch_exec(CmdAuto)
        %{ExitCode, Output} = utils:launch_exec(CmdAuto),
        %db:mnesia_write_update(Module, TestCase, list_to_atom(Output)),
        %error_logger:info_msg("compiled")
    catch 
        error:badarg -> error_logger:info_msg("not applicable for this tool");
        error:function_clause -> error_logger:info_msg("not applicable for this tool")
    end.

compile_button(Module, TestCase, Text) ->
    #button {
        text = Text,
        postback = {call, {?MODULE, run_compile, [Module, TestCase]}}
    }.

compile_command_text(Module, TestCase) ->
    io_lib:format("$ ~s ~s ~s", [Module:get(compiler_cmd), Module:get(compiler_opts), TestCase]).

element(Module, TestCase) ->
    Text = io_lib:format("Compile code for ~s", [Module:get(fullname)]),
    #panel {
        body =  [
            #hr{}, 
            compile_button(Module, TestCase, Text), #p{},
            #panel { id=Module:get(compile_command_text_panel), body=[compile_command_text(Module, TestCase)] }, #p{},
            #panel {
                id = Module:get(compile_panel),
                body = output:element(TestCase, Module:get(compiler_id))
            }
        ]
    }.

