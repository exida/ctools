%% @author exida
%% @doc

-module(tool_smatch).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, smatch).
-define(FULLNAME, "smatch").
-define(TOOL_CMD, "smatch").
-define(TOOL_OPTS, "--spammy --two-passes --assume-loops --data=/opt/smatch -Idata/include").
-define(SOURCE_PANEL, smatch_source).

get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(tool_cmd) -> ?TOOL_CMD;
get(tool_opts) -> ?TOOL_OPTS;
get(source_panel) -> ?SOURCE_PANEL;

get(version) ->
  Cmd = "smatch --version | tail -n1",
  {_, Sout} = launch:launch_exec(Cmd),
  "smatch " ++ erlang:atom_to_list(Sout).

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

