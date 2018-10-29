%% @author exida
%% @doc

-module(gui).
-author('exida').
-export([launch_button/0]).

-include_lib("nitrogen_core/include/wf.hrl").

launch_button() -> launch_button(wf:user()).
launch_button(dirty) -> #p{};
launch_button(exida) -> 
    #button { id=launch, text="Launch all tools", postback=launch_all }, 
    #p{}.

event(launch_all) ->
	utils:zip_lists(config:all_modules(), testcase:gather_sources()).
