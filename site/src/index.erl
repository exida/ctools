%% @author exida
%% @doc

%% -*- mode: nitrogen -*-
-module (index).
-author('exida').
-compile(export_all).

-include_lib("nitrogen_core/include/wf.hrl").

main() -> 
    case wf:user() /= undefined of 
        true  -> main_authorized();
        false -> wf:redirect_to_login("/login")
    end.

main_authorized() -> #template { file="./site/templates/bare.html" }.

title() -> "Comparison of memory tools".

body() ->
    [
        #panel { 
            class=title,
            body = [
                #image { image="images/exida_logo_small.png" },
                "c source code verification tools"
            ]
        },
        #p{},
        #button { id=about, text="About", postback=about }, " ",
        #button { id=general, text="Tools", postback=general }, " ",
        testcase:sources_dropdown(), " ",
        #button { id=select, text="Select Test", postback=read_testcase }, " ",
        %#button { id=edit, text="Edit Test", postback=edit_testcase }, " ",
        edit_button(),
        new_button(),
        #button { id=chart, text="View Comparison Chart", postback=chart }, " ",
%        #button { id=launch, text="Launch all tools", postback=launch },
        launch_button(wf:user()),
%            #p{},
        #panel{ id=content, body=about_page() }
    ].


launch_button() -> launch_button(wf:user()).
launch_button(dirty) -> " ";
launch_button(exida) -> #button { id=launch, text="Launch all tools", postback=launch_all }.
    
new_button() -> new_button(wf:user()).
new_button(dirty) -> " ";
new_button(exida) -> #button { id=new, text="New Test", postback=new_testcase }.

edit_button() -> edit_button(wf:user()).
edit_button(dirty) -> " ";
edit_button(exida) -> #button { id=edit, text="Edit Test", postback=edit_testcase }.


% EVENT HANDLERS:
% generic
event({call, {Function, Args}}) ->
    apply(Function, Args);

event({call, {Module, Function, Args}}) ->
    apply(Module, Function, Args);

% test cases
event({read_testcase, TestCase}) ->
    testcase:read_testcase(TestCase);

event(read_testcase) ->
    testcase:read_testcase();

event({edit_testcase, TestCase}) ->
    testcase:edit_testcase(TestCase);

event(edit_testcase) ->
    testcase:edit_testcase();

event({delete_testcase, TestCase}) ->
    testcase:delete_testcase(TestCase);

event({delete_testcase_confirmed, TestCase}) ->
    testcase:delete_testcase_confirmed(TestCase);

event({update_testcase, TestCase}) ->
    testcase:update_testcase(TestCase);

event(create_testcase) ->
    testcase:create_testcase();

event(new_testcase) ->
    testcase:new_testcase(); 

event(launch_all) ->
	utils:zip_lists(config:all_modules(), testcase:gather_sources());

% chart
event(about) -> wf:update(content, about_page());

event(chart) -> chart:update();
event(refine_chart) -> chart:refine();

event(general) -> general:update();
event(refine_general) -> general:refine().

about_page() -> [
    "Welcome to simple framework for verification validity of C programs.",
    #p{},
    "It aims to provide easy interface to edit simple one file test cases and run tools on source code or compile and work with executable.",
    #p{},
    "The predefined set of test cases covers following:",
    #list { numbered=true, body=[
            #listitem{ body="out-of-bounds array indexing,"},
            #listitem{ body="erroneous pointer manipulation and dereferencing (NULL, uninitialized, and dangling pointers),"},
            #listitem{ body="memory allocations, deallocations,"},
            #listitem{ body="integer/floating-point division by zero,"},
            #listitem{ body="integer and floating-point arithmetic overflow,"},
            #listitem{ body="violation of optional user-defined assertions to prove additional runtime properties (similar to assert diagnostics),"},
            #listitem{ body="read access to uninitialized variables,"},
            #listitem { body="unreachable code under any circumstances." }
        ]
    },
    #p{},
    "Currently the following tools are available:",
    #list { numbered=true, body=[
        #listitem{ body=[
            "0. The detailed output of the compiler:",
            #list { numbered=true,
                body=[
                #listitem{ body=tool_gcc:get(version)},
                #listitem{ body=tool_clang:get(version)}]
            }
        ]},
        #listitem{ body=[
            "1. Static Analysis:",
            #list { numbered=true, 
                body=[
                %#listitem{ body="PC-lint for C/C++ (NT) Vers. 9.00k"},
                #listitem{ body=tool_splint:get(version)},
                #listitem{ body=tool_cppcheck:get(version)},
                #listitem{ body=tool_framac:get(version)},
                #listitem{ body=tool_klee:get(version)},
                #listitem{ body=tool_sparse:get(version)},
                #listitem{ body=tool_smatch:get(version)},
                #listitem{ body=tool_coccinelle:get(version)},
                #listitem{ body=tool_clang_tidy:get(version)}
                     ]
            }
        ]},
        #listitem{ body=[
            "2. Runtime verification:",
            #list { numbered=true,
                body=[
                #listitem{ body="address sanitizer (GCC module)"},
                #listitem{ body="memory sanitizer (clang module)"},
                %#listitem{ body="Dr.Memory"},
                #listitem{ body=tool_valgrind_memcheck:get(version)}
                %#listitem{ body="Exida Integer Check"}    
                     ]
            }
        ]}]
    },
    #p{},
    "Tools that have been checked, but are currently out-of-scope:",
    #list { numbered=true, body=[
                #listitem{ body="Valgrind SGCheck"},
                #listitem{ body="SAFECode"},
                #listitem{ body="SoftBounds-ECTS"},
                #listitem{ body="Polyspace"},
                #listitem{ body="Astree"}
                %#listitem{ body="Clang static analyzer"}
                                ]
            }
].

