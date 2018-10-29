%% @author exida
%% @doc

-module(helper).
-author('exida').
-export([list_element_after/2, list_element_before/2]).

list_element_after([_], _Element, First) -> First;
list_element_after([Element | [GotYou | _Tail]], Element, _) -> GotYou;
list_element_after([_|Tail], Element, First) -> list_element_after(Tail, Element, First).

list_element_after([First | Tail], Element) -> list_element_after([First | Tail], Element, First).

list_element_before([GotYou | [ Element | _Tail]], Element) -> GotYou;
list_element_before([_Skip | [NotElement | Tail]], Element) -> list_element_before([NotElement | Tail], Element);
list_element_before([NotFound], _Element) -> NotFound.

