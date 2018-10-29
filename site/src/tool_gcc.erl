%% @author exida
%% @doc

-module(tool_gcc).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, gcc).
-define(FULLNAME, "GNU gcc").
-define(COMPILER_ID, gcc_compiler).
-define(COMPILER_CMD, "gcc").
-define(COMPILER_OPTS, "-O0 -std=c99 \
        -fsanitize=undefined \
        -fsanitize=integer-divide-by-zero \
        -fsanitize=float-divide-by-zero \
        -fsanitize=signed-integer-overflow \
        -fsanitize=bounds \
        -Wall -Wextra -Wpedantic -Wcomment -Winit-self -Wmaybe-uninitialized -fstrict-overflow -Wstrict-overflow=5 -Wfloat-equal -Wtraditional-conversion -Wbad-function-cast -Wconversion -Wsign-compare -Waddress -Wlogical-op -ftree-vrp -Warray-bounds -Idata/include").
%-Wstrict-prototypes 
-define(COMPILE_PANEL, gcc_compile).
-define(COMPILE_COMMAND_PANEL, gcc_compile_command).
-define(EXEC_PANEL, "gcc_exec_panel").
-define(TOOL_CMD, "").
-define(TOOL_OPTS, "").



get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(exec_panel) -> ?EXEC_PANEL;
get(tool_cmd) -> ?TOOL_CMD;
get(tool_opts) -> ?TOOL_OPTS;
get(compiler_id) -> ?COMPILER_ID;
get(compiler_cmd) -> ?COMPILER_CMD;
get(compiler_opts) -> ?COMPILER_OPTS;
get(compile_panel) -> ?COMPILE_PANEL;
get(compile_command_text_panel) -> ?COMPILE_COMMAND_PANEL;

get(version) -> 
  Cmd = "gcc --version | head -n1",
  {_, Sout} = launch:launch_exec(Cmd),
  erlang:atom_to_list(Sout).

element(TestCase) ->
    #panel {
        body = [
            gen_compile:element(?MODULE, TestCase),
%            evaluation:evaluation_panel(?MODULE, TestCase)
            gen_exec:element(?MODULE, TestCase)
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

