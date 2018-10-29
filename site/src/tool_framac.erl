%% @author exida
%% @doc

-module(tool_framac).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, framac).
-define(FULLNAME, "framac").
-define(TOOL_CMD, "framac.sh").
-define(TOOL_OPTS, "-I data/include").
-define(SOURCE_PANEL, framac_source).

get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(tool_cmd) -> ?TOOL_CMD;
get(tool_opts) -> ?TOOL_OPTS;
get(source_panel) -> ?SOURCE_PANEL;

get(version) -> 
  Cmd = "frama-c -version | head -n1",
  {_, Sout} = launch:launch_exec(Cmd),
  "FramaC " ++ erlang:atom_to_list(Sout).

element(TestCase) ->
    #panel {
        body = [
            gen_source:element(?MODULE, TestCase)
        ]
    }.

about(homepage) -> "http://frama-c.com";
about(general) -> "Frama-C is a modular platform for source-code analysis of C software.";
about(ships) -> "Independant binary (open-source)";
about(dependency) -> "see documentation";
about(performance) -> "";
about(method) -> "";
about(arch) -> "";
about(limitations) -> "";
about(interface) -> "";
about(usage) -> "";
about(extra) -> "".

