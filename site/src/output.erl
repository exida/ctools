%% @author exida
%% @doc

-module(output).
-author('exida').
-export([element/2]).

-include_lib("nitrogen_core/include/wf.hrl").

stream_label(time) -> "Time:";
stream_label(stdout) -> "Standard output stream:";
stream_label(stderr) -> "Standard error stream:".

read_file(TestCase, ToolId, Suffix) ->
    fs_path:load_file(fs_path:file_path(TestCase, ToolId, Suffix)).

file_element(TestCase, ToolId, Suffix) -> 
    #panel {
        body = [
            stream_label(Suffix),
            #p{},
            read_file(TestCase, ToolId, Suffix)
        ]
    }.

element(TestCase, ToolId) ->
    #panel {
        body = [
            file_element(TestCase, ToolId, time),
            file_element(TestCase, ToolId, stdout),
            file_element(TestCase, ToolId, stderr)
        ]
    }.
