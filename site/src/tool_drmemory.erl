%% @author exida
%% @doc

-module(tool_drmemory).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, drmemory).
-define(FULLNAME, "DrMemory").
-define(COMPILER_ID, drmemory_compiler).
-define(COMPILER_CMD, "gcc").
%-define(COMPILER_OPTS, "-O0 -std=c99 -ggdb -fno-inline -fno-omit-frame-pointer -m32 -Idata/include").
-define(COMPILER_OPTS, "-O0 -std=c99 -ggdb -fno-inline -fno-omit-frame-pointer -Idata/include").
-define(TOOL_CMD, "drmemory -light").
-define(TOOL_OPTS, "--").
-define(EXEC_PANEL, drmemory_exec).
-define(COMPILE_PANEL, drmemory_compile).
-define(COMPILE_COMMAND_PANEL, drmemory_compile_command).

get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(compiler_id) -> ?COMPILER_ID;
get(compiler_cmd) -> ?COMPILER_CMD;
get(compiler_opts) -> ?COMPILER_OPTS;
get(tool_cmd) -> ?TOOL_CMD;
get(tool_opts) -> ?TOOL_OPTS;
get(exec_panel) -> ?EXEC_PANEL;
get(compile_panel) -> ?COMPILE_PANEL;
get(compile_command_text_panel) -> ?COMPILE_COMMAND_PANEL.

element(TestCase) ->
    #panel {
        body = [
            gen_compile:element(?MODULE, TestCase),
            gen_exec:element(?MODULE, TestCase)
        ]
    }.

about(homepage) -> "http://drmemory.org/";
about(general) -> "Dr. Memory is a memory monitoring tool capable of identifying memory-related programming errors.";
about(ships) -> "";
about(dependency) -> "";
about(performance) -> "";
about(method) -> "";
about(arch) -> "";
about(limitations) -> "Run tool with 32-bit program";
about(interface) -> "";
about(usage) -> "";
about(extra) -> "".

