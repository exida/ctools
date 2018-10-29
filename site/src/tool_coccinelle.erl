%% @author exida
%% @doc

-module(tool_coccinelle).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, coccinelle).
-define(FULLNAME, "coccinelle").
-define(TOOL_CMD, "data/cocci.sh").
-define(TOOL_OPTS, "").
-define(SOURCE_PANEL, coccinelle_source).

get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(tool_cmd) -> ?TOOL_CMD;
get(tool_opts) -> ?TOOL_OPTS;
get(source_panel) -> ?SOURCE_PANEL;

get(version) -> 
  Cmd = 'spatch  --version | head -n1 | awk \'{sub(/([^ ]+ +){1}/,"")}1\'',
  {_, Sout} = launch:launch_exec(Cmd),
  "coccinelle " ++ erlang:atom_to_list(Sout).


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

