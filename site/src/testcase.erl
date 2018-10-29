%% @author exida
%% @doc

-module(testcase).
-author('exida').
-export([sources_list/0, sources_dropdown/0, load_file/1, gather_sources/0]).
-export([create_testcase/0, read_testcase/0, read_testcase/1, update_testcase/1]).
-export([delete_testcase/1, delete_testcase_confirmed/1, new_testcase/0, edit_testcase/0, edit_testcase/1]).

-include_lib("nitrogen_core/include/wf.hrl").
-include_lib("nitrogen_elements/include/nitrogen_elements.hrl").
-include_lib("../include/records.hrl").

gather_sources() ->
    SourcesDirty = filelib:wildcard("data/src/**/*.c"),
    Sources = lists:map(fun(X) -> binary_to_list(iolist_to_binary(re:replace(X, "data/src/", ""))) end, SourcesDirty),
    lists:sort(Sources).


sources_list() -> #list{ body=(lists:map(
    fun(X) -> #listitem{ body=#link{text=X, postback={settest, X}}} end, 
    gather_sources()))
    }.

sources_dropdown() ->
    #dropdown { 
        id = testcase, 
        options = lists:sort(lists:map(
            fun(X) -> #option{ text=X, value=fs_path:file_name(X)} end, 
            gather_sources()))
    }.

load_file(File) ->
    case file:read_file(File) of
        {ok, <<>>} -> "No output";
        {ok, Binary} -> binary_to_list(Binary);
        _ -> io_lib:format("Could not open ~p.", [File])
    end.


delete_testcase(TestCase) ->
    wf:wire(#confirm {text="Are you sure?", postback={delete_testcase_confirmed, TestCase}}).

delete_testcase_confirmed(TestCase) ->
    fs_path:delete_file(fs_path:source_path(TestCase)),
    wf:redirect("").


new_testcase() ->
    wf:update(content, new_testcase_panel()).

new_testcase_panel() ->
    #panel {
            body= [
                #textbox {
                    id=testname,
                    text="testcasename.c"
                },
                #br{},
                #textarea {
                id=edittest,
                columns=120,
                rows=25
            },
            #br{},
            #button { id=save, text="Create!", postback=create_testcase}
        ],
        actions=#effect { effect=highlight } }.

edit_testcase_panel(TestCase) ->
    #panel {
            body= [#textarea {
                id=edittest,
                text=fs_path:load_raw_file(fs_path:source_path(TestCase)),
                columns=120,
                rows=25
            },
            #br{},
            #button { id=save, text="Save", postback={update_testcase, TestCase}}, " ",
            #button { id=delete, text="Delete", postback={delete_testcase, TestCase}}
        ],
        actions=#effect { effect=highlight }
    }.

edit_testcase() ->
    TestCase = wf:q(testcase),
    edit_testcase(TestCase).

edit_testcase(TestCase) ->
    wf:update(content, edit_testcase_panel(TestCase)).

update_testcase(TestCase) ->
    Content = wf:q(edittest),
    fs_path:save_raw_file(fs_path:source_path(TestCase), Content),
    read_testcase(TestCase).

create_testcase() ->
    TestCase = wf:q(testname),
    update_testcase(TestCase).

read_testcase() ->
    TestCase = wf:q(testcase),
    read_testcase(TestCase).

read_testcase(TestCase) ->
    wf:update(content, #panel {
        body=testcase_panel(TestCase),
        actions=[#effect { effect=highlight }, #syntax {}]
    }).

testcase_panel(TestCase) ->
    DirtyTestCase = fs_path:dirty_file_name(TestCase),
    Sources = testcase:gather_sources(),
    PrevTest = fs_path:file_name(helper:list_element_before(Sources, DirtyTestCase)),
    NextTest = fs_path:file_name(helper:list_element_after(Sources, DirtyTestCase)),
    TestDesc = "Edit Test (" ++ TestCase ++ ")",
    error_logger:info_msg(TestCase),
    error_logger:info_msg(hd(Sources)),
%    PrevTestDesc = "Select Previos (" ++ PrevTest ++ ")",
%    NextTestDesc = "Select Next (" ++ NextTest ++ ")",
    #panel {
        body = [
            #panel {
                class = centered,
                body = [
                    #button {id=next, text="Previous TestCase", postback={read_testcase, PrevTest}}, " ",
                    %#button {id=edit, text=TestDesc, postback={edit_testcase, TestCase} }, " ",
                    edit_testcase_button(TestDesc, TestCase),
                    #button {id=next, text="Next TestCase", postback={read_testcase, NextTest}}
                ]
            },
            fs_path:load_source_file(fs_path:source_path(TestCase)),
            #tabs {
                id=tabs,
                options=[{selected, 0}, {closable, true}],
                tabs=lists:map(fun(Module) -> #tab{title=Module:get(fullname), body=[Module:element(TestCase)] } end, config:all_modules())
            }
        ]
    }.

edit_testcase_button(TestDesc, TestCase) -> edit_testcase_button(TestDesc, TestCase, wf:user()).
edit_testcase_button(TestDesc, TestCase,dirty) -> " ";
edit_testcase_button(TestDesc, TestCase,exida) -> #button {id=edit, text=TestDesc, postback={edit_testcase, TestCase} }.
