%% @author exida
%% @doc

-module(gen_source).
-author('exida').
-export([element/2, run_source/2, run_source_do/2]).

-export([update_source_output/2, update_source_loading/1, get_source_params/1]).

-include_lib("nitrogen_core/include/wf.hrl").

loading() -> "loading".

update_source(Module, Content) ->
    wf:update(
        Module:get(source_panel), 
        #panel {
            id = compile, 
            body = Content,
            actions=#effect { effect=highlight }
        }
    ).

update_source_output(Module, TestCase) ->
    Content = output:element(TestCase, Module:get(output_id)),
    update_source(Module, Content).

update_source_loading(Module) ->
    update_source(Module, loading()).

run_source(Module, TestCase) ->
    update_source_loading(Module),
    apply(?MODULE, run_source_do, [Module, TestCase]),
    update_source_output(Module, TestCase),
    try Module:update_element(TestCase) of
        _ -> ok
    catch 
        error:undef -> this_may_happen_when_no_additional_update_needed
    end.

get_source_params(Module) -> {
        Module:get(output_id),
        Module:get(tool_cmd),
        Module:get(tool_opts)
    }.

run_source_do(Module, TestCase) -> 
    {Tool, ToolCommand, ToolOpts} = get_source_params(Module),
    file:make_dir(fs_path:out_path(TestCase)),
    Cmd = io_lib:format("./data/run.sh \"~s\" \"~s\" \"~s\" \"~s\" \"~s\" \"~s\"",
                  [ToolCommand,
                   ToolOpts,
                   fs_path:source_path(TestCase),
                   fs_path:file_path(TestCase, Tool, stdout),
                   fs_path:file_path(TestCase, Tool, stderr),
                   fs_path:file_path(TestCase, Tool, time)]),
%    io:format("~s", [Cmd]),
    os:cmd(Cmd),

    CmdAuto = io_lib:format("./data/scratch.sh \"~s\" \"~s\" \"~s\"",
                  [fs_path:source_path(TestCase),
                   fs_path:file_path(TestCase, Tool, stdout),
                   fs_path:file_path(TestCase, Tool, stderr)]
                   ),
    launch:launch_exec(CmdAuto).
    %{ExitCode, Output} = utils:launch_exec(CmdAuto),
    %db:mnesia_write_update(Module, TestCase, list_to_atom(Output)),
%    error_logger:info_msg("executed~n").

source_button(Module, TestCase, Text) ->
    #button {
        text = Text,
        postback = {call, {?MODULE, run_source, [Module, TestCase]}}
    }.

element(Module, TestCase) ->
    Text = "Run " ++ Module:get(fullname),
    #panel {
        body =  [
            #hr{},
            source_button(Module, TestCase, Text), #p{},
            evaluation:evaluation_panel(Module, TestCase),
            #panel {
                id = Module:get(source_panel),
                body = output:element(TestCase, Module:get(output_id))
            }
        ]
    }.

