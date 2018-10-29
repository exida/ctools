%% @author exida
%% @doc

-module(tool_safe).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, safe).
-define(FULLNAME, "SafeCODE").
-define(COMPILER_ID, safe_compiler).
-define(COMPILER_CMD, "/opt/llvm_safecode/build/bin/clang").
-define(COMPILER_OPTS, "-Idata/include -fmemsafety").
-define(TOOL_CMD, "").
-define(TOOL_OPTS, "").
-define(EXEC_PANEL, safe_exec).
-define(COMPILE_PANEL, safe_compile).
-define(COMPILE_COMMAND_PANEL, safe_compile_command).


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

about(homepage) -> "http://safecode.cs.illinois.edu/";
about(general) -> "The SAFECode project is a memory safety compiler for C/C++ programs. It instruments code with run-time checks to detect memory safety errors (e.g., buffer overflows) at run-time.";
about(ships) -> "";
about(dependency) -> "";
about(performance) -> "";
about(method) -> "http://safecode.cs.illinois.edu/pubs.html";
about(arch) -> "";
about(limitations) -> "";
about(interface) -> "";
about(usage) -> 
    "$ clang -fmemsafety -fPIE -pie -fno-omit-frame-pointer -g -O2 source.c -o program.exe
$ ./program.exe";
about(extra) -> "".

