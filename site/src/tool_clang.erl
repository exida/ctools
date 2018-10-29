%% @author exida
%% @doc

-module(tool_clang).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, clang).
-define(FULLNAME, "clang").
-define(COMPILER_ID, clang_compiler).
-define(COMPILER_CMD, "clang").
-define(COMPILER_OPTS, "-O0 -std=c99 -Wall \
        -fsanitize=integer \
        -fsanitize=undefined \
        -fsanitize=unsigned-integer-overflow \
        -Wextra -Weverything -Warray-bounds -Wstrict-overflow -Wfloat-equal \
        -Wno-missing-prototypes -Wno-missing-variable-declarations \ 
        -Idata/include").
-define(COMPILE_PANEL, clang_compile).
-define(COMPILE_COMMAND_PANEL, clang_compile_command).
-define(EXEC_PANEL, "clang_exec_panel").
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
  Cmd = "clang --version | head -n1 | awk '{print $1 \" \" $2 \" \" $3}'",
  {_, Sout} = launch:launch_exec(Cmd),
  erlang:atom_to_list(Sout).

  

element(TestCase) ->
    #panel {
        body = [
            gen_compile:element(?MODULE, TestCase),
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

