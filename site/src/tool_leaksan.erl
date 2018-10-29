%% @author exida
%% @doc

-module(tool_leaksan).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, leaksan).
-define(FULLNAME, "Leak Sanitizer (clang)").
-define(COMPILER_ID, leaksan_compiler).
-define(COMPILER_CMD, "clang").
-define(COMPILER_OPTS, "-Idata/include -O0 -g -fsanitize=address -fno-common -fno-omit-frame-pointer -std=c99 -DTESTING").
-define(TOOL_CMD, "").
-define(TOOL_OPTS, "").
%-define(TOOL_OPTS, "ASAN_OPTIONS=detect_leaks=1").
-define(EXEC_PANEL, leaksan_exec).
-define(COMPILE_PANEL, leaksan_compile).
-define(COMPILE_COMMAND_PANEL, leaksan_compile_command).


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

about(homepage) ->
    "https://code.google.com/p/address-sanitizer/";

about(general) ->
     "AddressSanitizer (aka ASan) is a memory error detector for C/C++. AddressSanitizer is a part of LLVM starting with version 3.1 and a part of GCC starting with version 4.8";

about(dependency) -> "";

about(performance) ->
    "The average slowdown of the instrumented program is ~2x";

about(method) ->
    "https://code.google.com/p/address-sanitizer/wiki/AddressSanitizerAlgorithm";

about(arch) ->
    "x86 Linux and Mac, and ARM Android";

about(limitations) ->
    "AddressSanitizer uses its own memory allocator (malloc, free, etc). If your code depends on a particular feature or extension of glibc malloc, tcmalloc or some other malloc, it may not work as you expect.
%
%AddressSanitizer uses a lot of virtual address space (17T on x86_64 Linux).";

about(usage) -> 
    "Example of usage
    $ clang -fsanitize=address -fPIE -pie -fno-omit-frame-pointer -g -O2 source.c -o program.exe 
    $ ./program.exe";

about(extra) -> "".

