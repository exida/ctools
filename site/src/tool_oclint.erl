%% @author exida
%% @doc

-module(tool_oclint).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, oclint).
-define(FULLNAME, "oclint").
-define(TOOL_CMD, "oclint -enable-global-analysis").
-define(TOOL_OPTS, "-- -c -Idata/include").
-define(SOURCE_PANEL, oclint_source).

%oclint -enable-global-analysis -enable-clang-static-analyzer /opt/ctools/data/src/2.Non-Interference/2.1.Uninitialized/uninitialized_function_pointer.c  -- -c -I /opt/ctools/data/include

get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(tool_cmd) -> ?TOOL_CMD;
get(tool_opts) -> ?TOOL_OPTS;
get(source_panel) -> ?SOURCE_PANEL.

element(TestCase) ->
    #panel {
        body = [
            gen_source:element(?MODULE, TestCase)
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

