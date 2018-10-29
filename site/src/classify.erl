%% @author exida

%% @doc

-module(classify).
-author('exida').
-export([get/1]).

-define(CLASS_NONE, none).
-define(CLASS_VAR, variable).
-define(CLASS_FUNC, function).
-define(CLASS_LINE, line).

get(none) -> ?CLASS_NONE;
get(var) -> ?CLASS_VAR;
get(func) -> ?CLASS_FUNC;
get(line) -> ?CLASS_LINE.


