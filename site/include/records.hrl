%% Include the automatically generated plugins directory
-include("plugins.hrl").

-record(evaluation, {testtool, evaluation}).

%% Include any application-specific custom elements, actions, or validators below
-record(syntax, {?ACTION_BASE(action_syntax),
        attr1 :: any(),
        attr2 :: any()
    }).

