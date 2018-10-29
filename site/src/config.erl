%% @author exida
%% @doc

-module(config).
-author('exida').
-export([all_modules/0, evaluation_options/0]).

-include_lib("nitrogen_core/include/wf.hrl").

all_modules() -> [
%tool_custom, 
    tool_gcc, 
    tool_clang, 
    tool_splint,
    tool_cppcheck,
    tool_asan, 
    tool_leaksan,
    tool_msan, 
    tool_ubsan,
    tool_valgrind_memcheck,
    tool_framac, 
    tool_klee,
    tool_sparse,
    tool_smatch,
    tool_coccinelle,
    tool_clang_tidy
		 ].

%   	 tool_oclint,
%tool_pclint, tool_icf, tool_drmemory
%tool_msan, tool_leak, tool_safe, tool_soft, 

%evaluation_options() -> [not_detected, detected, well_detected, segfault, detected_by_compiler, timeout].
evaluation_options() -> [line, function, variable, none].

%not_detected - not detected
%detected - not precisely indicated / but notification appears
%well_detected - detected with precise notification


