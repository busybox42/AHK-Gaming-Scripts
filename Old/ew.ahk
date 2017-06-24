VARVAL=10

MsgBox, outside of function VARVAL="%VARVAL%"
RunFTest()

RunFTest()
{
global
MsgBox, inside function VARVAL="%VARVAL%"
}