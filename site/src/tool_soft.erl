%% @author exida
%% @doc

-module(tool_soft).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, soft).
-define(FULLNAME, "SoftBoundCETS").
-define(COMPILER_ID, soft_compiler).
-define(COMPILER_CMD, "/opt/llvm_softboundcets-34/softboundcets-llvm-clang34/Release/bin/clang").
-define(COMPILER_OPTS, "-Idata/include -fsoftboundcets -L/opt/llvm_softboundcets-34/softboundcets-lib").
-define(TOOL_CMD, "").
-define(TOOL_OPTS, "").
-define(EXEC_PANEL, soft_exec).
-define(COMPILE_PANEL, soft_compile).
-define(COMPILE_COMMAND_PANEL, soft_compile_command).


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

about(homepage) -> "http://www.cis.upenn.edu/acg/softbound/";
about(general) -> "SoftBound and CETS are compile-time transformations for enforcing spatial safety and temporal safety for C.";
about(ships) -> "";
about(dependency) -> "";
about(performance) -> "";
about(method) -> "http://www.cs.rutgers.edu/~santosh.nagarakatte/papers/cgo2014-final.pdf";
about(arch) -> "";
about(limitations) -> "";
about(interface) -> "";
about(usage) -> "$ clang -fsoftbounds -fPIE -pie -fno-omit-frame-pointer -g -O2 source.c -o program.exe";
about(extra) -> "".

