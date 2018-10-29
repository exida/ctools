%% @author exida
%% @doc

-module(tool_valgrind_memcheck).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, valgrind_memcheck).
-define(FULLNAME, "Valgrind Memcheck").
-define(COMPILER_ID, valgrind_compiler).
-define(COMPILER_CMD, "gcc").
-define(COMPILER_OPTS, "-Idata/include -ggdb -g").
-define(TOOL_CMD, "valgrind").
-define(TOOL_OPTS, "--tool=memcheck --track-origins=yes --leak-check=full").
-define(EXEC_PANEL, valgrind_memcheck_exec).
-define(COMPILE_PANEL, valgrind_memcheck_compile).
-define(COMPILE_COMMAND_PANEL, valgrind_memcheck_compile_command).


get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(compiler_id) -> ?COMPILER_ID;
get(compiler_cmd) -> ?COMPILER_CMD;
get(compiler_opts) -> ?COMPILER_OPTS;
get(tool_cmd) -> ?TOOL_CMD;
get(tool_opts) -> ?TOOL_OPTS;
get(exec_panel) -> ?EXEC_PANEL;
get(compile_panel) -> ?COMPILE_PANEL;
get(compile_command_text_panel) -> ?COMPILE_COMMAND_PANEL;
get(version) -> 
  Cmd = "valgrind --version | head -n1",
  {_, Sout} = launch:launch_exec(Cmd),
  erlang:atom_to_list(Sout).


element(TestCase) ->
    #panel {
        body = [
            gen_compile:element(?MODULE, TestCase),
            gen_exec:element(?MODULE, TestCase)
        ]
    }.

about(homepage) -> "http://valgrind.org/docs/manual/mc-manual.html";
about(general) -> "Memcheck is a memory error detector. It can detect the following problems that are common in C and C++ programs.";
about(ships) -> "";
about(dependency) -> "";
about(performance) -> "";
about(method) -> "http://valgrind.org/docs/manual/mc-manual.html#mc-manual.machine";
about(arch) -> "";
about(limitations) -> "";
about(interface) -> "";
about(usage) -> "$ valgrind--tool=memcheck path_to/program.exe";
about(extra) -> "".

