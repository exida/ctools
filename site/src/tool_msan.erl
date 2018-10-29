%% @author exida
%% @doc

-module(tool_msan).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, msan).
-define(FULLNAME, "Memory Sanitizer").
-define(COMPILER_ID, msan_compiler).
-define(COMPILER_CMD, "clang").
-define(COMPILER_OPTS, "-Idata/include -g -O0 -std=c99 -fsanitize=memory -fsanitize-memory-track-origins -fPIE -fpie -fno-omit-frame-pointer -DTESTING").
-define(TOOL_CMD, "").
-define(TOOL_OPTS, "").
-define(EXEC_PANEL, msan_exec).
-define(COMPILE_PANEL, msan_compile).
-define(COMPILE_COMMAND_PANEL, msan_compile_command).

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
    "https://code.google.com/p/memory-sanitizer/";

about(general) ->
    "MemorySanitizer (MSan) is a detector of uninitialized memory reads in C/C++ programs.
     Ships as	MemorySanitizer is part of LLVM starting with 3.3 branch.";

about(dependency) -> "";

about(performance) ->
    "MemorySanitizer can track back each uninitialized value to the memory allocation where it was created, and use this information in reports. This behaviour is enabled with the -fsanitize-memory-track-origins flag. It comes with additional 1.5x-2.5x slowdown
MemorySanitizer implements a subset of functionality found in Valgrind (Memcheck tool). It is significantly faster than Memcheck. ";

about(method) ->
    "http://llvm.org/devmtg/2013-04/stepanov-slides.pdf";

about(arch) ->
    "supports Linux x86_64 only.";

about(limitations) ->
    "MemorySanitizer uses 2x more real memory than a native run, 3x with origin tracking.
MemorySanitizer maps (but not reserves) 64 Terabytes of virtual address space. This means that tools like ulimit may not work as usually expected.
Static linking is not supported.
Non-position-independent executables are not supported. Therefore, the fsanitize=memory flag will cause Clang to act as though the -fPIE flag had been supplied if compiling without -fPIC, and as though the -pie flag had been supplied if linking an executable.
Depending on the version of Linux kernel, running without ASLR may be not supported. Note that GDB disables ASLR by default. To debug instrumented programs, use 'set disable-randomization off'.";

about(usage) -> 
    "Example of usage
    $ clang -fsanitize=memory -fPIE -pie -fno-omit-frame-pointer -g -O2 source.c -o program.exe
    $ ./program.exe";

about(extra) -> "Origins tracking
MemorySanitizer can track back each uninitialized value to the memory allocation where it was created, and use this information in reports. This behaviour is enabled with the -fsanitize-memory-track-origins flag. It comes with additional 1.5x-2.5x slowdown.".

