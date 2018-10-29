%% @author exida
%% @doc

-module(launch).
-author('exida').
-export([launch_exec/1]).


-include_lib("nitrogen_core/include/wf.hrl").
-include_lib("nitrogen_elements/include/nitrogen_elements.hrl").
launch_exec(Command) ->
    Port = open_port({spawn, Command}, [stream, in, eof, hide, exit_status]),
    get_data_from_shell(Port, []).

get_data_from_shell(Port, Sofar) ->
    receive
    {Port, {data, Bytes}} ->
        get_data_from_shell(Port, [Sofar|Bytes]);
    {Port, eof} ->
        Port ! {self(), close},
        receive
        {Port, closed} ->
            true
        end,
        receive
        {'EXIT',  Port,  _} ->
            ok
        after 1 ->              % force context switch
            ok
        end,
        ExitCode =
            receive
            {Port, {exit_status, Code}} ->
                Code
        end,
        {ExitCode, list_to_atom(lists:flatten(Sofar))}
    end.
