#SingleInstance, force

^!e::
Send, €
Return

^!a::
Send, ä
Return

+^!a::
Send, Ä
Return

^!o::
Send, ö
Return

+^!o::
Send, Ö
Return

^!u::
Send, ü
Return

+^!u::
Send, Ü
Return

^!n::
Send, ñ
Return

+^!n::
Send, Ñ
Return

^!\::
now := A_NowUTC
EnvSub, now, 1970, seconds
Send, %now%
Return
