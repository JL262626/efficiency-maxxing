#Requires AutoHotkey v2.0
#singleinstance Force

#HotIf
:*:;1::quoctrivt@gmail.com
#HotIf
:*:;2::tqtl054@uowmail.edu.au
#HotIf
:*:;3::jack.le@v-daq.com.au
#HotIf

:*:;c::
{
    SendText 'git commit -m ""'
    Send '{Left}'
}  

:*:;a::git add .
:*:;s::git status
 