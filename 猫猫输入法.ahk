#Include ck.ahk

;{{{ ͸������srf_icon
SplashImage, cn1.png,b X220 Y400 ,,,srf_icon,  ;����һ��ͼƬ����
WinSet, Transparent, !1000 , srf_icon,    ;������ȫ͸��
WinSet, ExStyle, +0x20, srf_icon,     ;������괩͸
WinSet, AlwaysOnTop, On , srf_icon,   ;�����ö�
;}}}

lshift & Lbutton::send +{Lbutton}                                         
;{{{ Lshift���л�ģʽ
Lshift::
srf_mode := !srf_mode
if  srf_mode
    WinSet, Transparent, 180 , srf_icon,
else
    WinSet, Transparent, 0 , srf_icon,
return
;}}}

;{{{ srf_for_select_array0ģʽ �ո񡢶��š���� ����
#if srf_for_select_array0
space::srf_select(1)
,::srf_select(2)
.::srf_select(3)
#if
;}}}

;{{{ srf_all_inputģʽ backspace����esc����enter����Lshift�� ����
#if srf_all_input
;{{{ backspace����
backspace::
  srf_all_input := SubStr(srf_all_input, 1, -1)
  if srf_all_input =
    gosub srf_value_off
  else
    gosub srf_tooltip
return
;}}}

esc::gosub srf_value_off

enter::
  send %srf_all_input%
  gosub srf_value_off
return

Lshift::
  send %srf_all_input%
  gosub srf_value_off
  WinSet, TransColor, FF0000  0 , srf_icon,
  srf_mode =
return

#if
;}}}

;{{{ srf_modeģʽ a-z����esc�������ķ��� ����
#if srf_mode
;{{{ a-z����
a::
b::
c::
d::
e::
f::
g::
h::
i::
j::
k::
l::
m::
n::
o::
p::
q::
r::
s::
t::
u::
v::                                                      
w::
x::
y::
z::
srf_all_input := srf_all_input . A_ThisHotkey
gosub srf_tooltip
return
;}}}

esc::
WinSet, TransColor, FF0000  0 , srf_icon,
srf_mode = 
return

,::send {��}
.::send {��}

+;::send {��}
+'::send {��}{��}{left}
#if                                                                  
;}}}

;{{{ ���� srf_select
srf_select(list_num)
{
    global 
    sendinput % srf_for_select_array%list_num%                                
    gosub srf_value_off
}
;}}}

;{{{ ��ǩsrf_tooltip
srf_tooltip:
tooltip, % srf_all_input . "`n" . %srf_all_input%, A_CaretX + 10 , A_CaretY + 20, 16         
StringSplit, srf_for_select_array, %srf_all_input%, %A_Space%, %A_Space%
return
;}}}

;{{{ ��ǩ srf_value_off
srf_value_off:
srf_for_select_array0=
tooltip, , , ,16
srf_all_input=
return
;}}}

;{{{ �Զ�reload
#IfWinActive,AutoHotkeyU32.ahk
~^s::
sleep 200
reload
return
#IfWinActive
;}}}