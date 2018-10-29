%% @author exida
%% @doc

-module(tool_leak).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, leak).
-define(FULLNAME, "Leak Sanitizer").
-define(COMPILER_ID, leak_compiler).
-define(COMPILER_CMD, "gcc").
-define(COMPILER_OPTS, "-Idata/include -fsanitize=leak").
-define(TOOL_CMD, "").
-define(TOOL_OPTS, "").
-define(EXEC_PANEL, leak_exec).
-define(COMPILE_PANEL, leak_compile).
-define(COMPILE_COMMAND_PANEL, leak_compile_command).

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

about(homepage) -> "https://code.google.com/p/address-sanitizer/wiki/LeakSanitizer";
about(general) -> "LeakSanitizer is a memory leak detector.";
about(ships) -> "";
about(dependency) -> "";
about(performance) -> "";
about(method) -> "https://code.google.com/p/address-sanitizer/wiki/LeakSanitizerDesignDocument";
about(arch) -> "";
about(limitations) -> "";
about(interface) -> "";
about(usage) -> "$ clang -fsanitize=leak -fPIE -pie -fno-omit-frame-pointer -g -O2 source.c -o program.exe
$ ./program.exe";
about(extra) -> "".

