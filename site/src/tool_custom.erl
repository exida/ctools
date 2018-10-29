%% @author exida
%% @doc

-module(tool_custom).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, custom).
-define(FULLNAME, "Custom").
-define(COMPILER_ID, custom_compiler).
-define(COMPILER_CMD, "clang").
-define(COMPILER_OPTS, "-O0 -Wall -Wextra -Weverything -Warray-bounds -Wstrict-overflow -Wfloat-equal -Idata/include").
-define(COMPILE_PANEL, custom_compile).
-define(COMPILE_COMMAND_PANEL, custom_compile_command_panel).
-define(TOOL_CMD, "/opt/DrMemory-Linux-1.8.0-8/bin/drmemory").
-define(TOOL_OPTS, "--").
-define(EXEC_PANEL, custom_exec).


get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(compiler_id) -> ?COMPILER_ID;
get(compiler_cmd) -> wf:q(custom_compiler_cmd);
get(compiler_opts) -> wf:q(custom_compiler_opts);
get(tool_cmd) -> ""; %wf:q(custom_tool_cmd);
get(tool_opts) -> ""; %wf:q(custom_tool_opts);
get(exec_panel) -> custom_exec_panel;
get(compile_panel) -> ?COMPILE_PANEL;
get(compile_command_text_panel) -> ?COMPILE_COMMAND_PANEL.

element(TestCase) ->
    #panel {
        body = [
            "Compiler command: ", #textbox {id=custom_compiler_cmd, text="gcc"},
            "Compiler options: ", #textbox {id=custom_compiler_opts, text="-Idata/include", size=60}, #p {}, 
            gen_compile:element(?MODULE, TestCase), #hr {},
%            "Tool command: ", #textbox {id=custom_tool_cmd, text=""},
%            "Tool options: ", #textbox {id=custom_tool_opts, text=""}, 
%            #p {},
            gen_exec:element(?MODULE, TestCase),
            evaluation:evaluation_panel(?MODULE, TestCase)
        ]
    }.

about(homepage) -> "";
about(general) -> "";
about(ships) -> "";
about(dependency) -> "";
about(performance) -> "";
about(method) -> "";
about(arch) -> "";
about(limitations) -> "";
about(interface) -> "";
about(usage) -> "";
about(extra) -> "".

