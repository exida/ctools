%% @author exida
%% @doc

-module(tool_clang_tidy).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, clang_tidy).
-define(FULLNAME, "clang_tidy").
-define(TOOL_CMD, "./data/clang_tidy.sh").
-define(TOOL_OPTS, "").
-define(SOURCE_PANEL, clang_tidy_source).

get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(tool_cmd) -> ?TOOL_CMD;
get(tool_opts) -> ?TOOL_OPTS;
get(source_panel) -> ?SOURCE_PANEL;

get(version) -> 
  Cmd = "clang-tidy --version | head -n2 | tail -n1",
  {_, Sout} = launch:launch_exec(Cmd),
  "clang-tidy " ++ erlang:atom_to_list(Sout).

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

