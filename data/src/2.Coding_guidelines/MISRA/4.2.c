char trigraphRaute[] = "??= -> #";        /* ERROR_LINE*/
char trigraphBackslash[] = "??/" -> \"";  /* ERROR_LINE*/
char trigraphCaret[] = "??' -> ^";        /* ERROR_LINE*/
char trigraphOpenBracket[] = "??( -> [";  /* ERROR_LINE*/
char trigraphCloseBracket[] = "??) -> ]"; /* ERROR_LINE*/
char trigraphPipe[] = "??! -> |";         /* ERROR_LINE*/
char trigraphOpenBrace[] = "??< -> {";    /* ERROR_LINE*/
char trigraphCloseBrace[] = "??> -> }";   /* ERROR_LINE*/
char trigraphTile[] = "??- -> ~";         /* ERROR_LINE*/

%:define MISRA_C_LIKES_DIGRAPHS
int a<::> = {1, 2, 3}; /* ERROR_LINE*/

int function(void)<%
  return 1;
%>

int main(void)
{
  return function();
}
