%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
-module (action_syntax).
-include_lib ("nitrogen_core/include/wf.hrl").
-include("../../include/records.hrl").
-export([
    render_action/1
]).

-spec render_action(#syntax{}) -> actions().
render_action(_Record = #syntax{}) ->
    "SyntaxHighlighter.highlight();".
