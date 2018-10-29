%% @author exida
%% @doc

-module(tool_pclint).
-author('exida').
-export([get/1, element/1, about/1]).
-export([update_element/1]).

-include_lib("nitrogen_core/include/wf.hrl").

-define(OUTPUT_ID, pclint).
-define(FULLNAME, "pclint").
-define(COMPILER_ID, "").
-define(COMPILER_CMD, "").
-define(COMPILER_OPTS, "").
-define(TOOL_CMD, "./data/pclint/GenerateReport.sh").
-define(TOOL_OPTS, "").
-define(SOURCE_PANEL, "pclint_source").
-define(COMPILE_COMMAND_PANEL, "pclint_command_source").

get(output_id) -> ?OUTPUT_ID;
get(fullname) -> ?FULLNAME;
get(compiler_id) -> ?COMPILER_ID;
get(compiler_cmd) -> ?COMPILER_CMD;
get(compiler_opts) -> ?COMPILER_OPTS;
get(tool_cmd) -> ?TOOL_CMD;
get(tool_opts) -> ?TOOL_OPTS;
get(source_panel) -> ?SOURCE_PANEL;
get(compile_command_text_panel) -> ?COMPILE_COMMAND_PANEL.

pclint_path(TestCase) ->
    fs_path:out_path(TestCase) ++ "/pclint/Lint_Violations.html".

pclint_element(TestCase) ->
    #panel {
        id = pclint_output,
        body = fs_path:load_raw_file(pclint_path(TestCase))
    }.

update_element(TestCase) ->
    wf:update(pclint_output, pclint_element(TestCase)).

element(TestCase) ->
    #panel {
        body = [
            gen_source:element(?MODULE, TestCase),
            pclint_element(TestCase)
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

