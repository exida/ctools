%% @author exida
%% @doc

-module(fs_path).
-author('exida').
-export([out_path/1, file_name/1, file_path/3, source_path/1, load_file/1, load_raw_file/1, save_raw_file/2, delete_file/1, load_source_file/1, dirty_file_name/1]).

file_name(DirtyTestCase) ->
    binary_to_list(iolist_to_binary(re:replace(DirtyTestCase, ".*/", ""))).

dirty_file_name(TestCase) ->
    binary_to_list(iolist_to_binary(re:replace(source_path(TestCase), "data/src/", ""))).

out_path(TestCase) ->
    Path = "data/out/" ++ TestCase,
    file:make_dir(Path),
    Path.

file_path(TestCase, Tool, Stream) ->
    Path = out_path(TestCase),
    Path ++ "/" ++ atom_to_list(Tool) ++ "." ++ atom_to_list(Stream).

source_path(TestCase) ->
    case find_source_path(TestCase) of
        "" -> "data/src/" ++ TestCase;
        AnyPath -> AnyPath
    end.

find_source_path(TestCase) ->
    filelib:wildcard("data/src/**/" ++ TestCase).

delete_file(File) -> file:delete(File).

load_file(File) ->
    "<pre><code>" ++ load_raw_file(File) ++ "</pre></code>".

load_source_file(File) ->
    "<pre class=\"brush: cpp;\">" ++ load_raw_file(File) ++ "</pre>".

load_raw_file(File) ->
    case file:read_file(File) of
        {ok, <<>>} -> "No output";
        {ok, Binary} -> binary_to_list(Binary);
        _ -> io_lib:format("Could not open ~p.", [File])
    end.

save_raw_file(File, Content) ->
    file:write_file(File, list_to_binary(Content)),
    error_logger:info_msg("file updated").

