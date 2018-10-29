%% @author exida
%% @doc

-module(tool_cppcheck).
-author('exida').
-export([get/1, element/1, about/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, cppcheck).
-define(FULLNAME, "cppcheck").
-define(TOOL_CMD, "cppcheck").
-define(TOOL_OPTS, "-I data/include").
-define(SOURCE_PANEL, cppcheck_source).

get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(tool_cmd) -> ?TOOL_CMD;
get(tool_opts) -> ?TOOL_OPTS;
get(source_panel) -> ?SOURCE_PANEL;

get(version) -> 
  Cmd = "cppcheck --version | head -n1",
  {_, Sout} = launch:launch_exec(Cmd),
  erlang:atom_to_list(Sout).

element(TestCase) ->
    #panel {
        body = [
            gen_source:element(?MODULE, TestCase)
        ]
    }.

about(homepage) -> "http://cppcheck.sourceforge.net/";
about(general) -> "Cppcheck is a static analysis tool for C/C++ code.";
about(ships) -> "Independant binary";
about(dependency) -> "";
about(performance) -> "";
about(method) -> "http://sourceforge.net/projects/cppcheck/files/Articles/cppcheck-design.pdf/download";
about(arch) -> "";
about(limitations) -> "";
about(interface) -> "";
about(usage) -> "";
about(extra) -> "".

