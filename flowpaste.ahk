; General AutoHotKey settings (optional)
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ; [force|ignore|off] Use the force option to restart the instance when running the same script again.

; run the script only when copying from text from selected application PDF viewer
; PXE is the ahk class for PDF-Xchange
; Run AHK Windows Spy to find your application's class.
#IfWinActive ahk_class PXE:{your_window_id_number}
^c:: 
    PDFclip := ClipboardAll
    clipboard := ""
    send ^c
    clipwait 0.1
    if clipboard = 
        clipboard := PDFclip
    else {     
        ; Search the clipboard for line breaks (\R)
            ; between: strings of one or more (?) non-line-break characters (.*),
            ; within: strings that start and end with a non-white-space character (\S)
        Reflowclip := RegExReplace(clipboard, "(\S.*?)\R(.*?\S)", "$1 $2")
        ; Remove blank lines
        Loop
            {Reflowclip := StrReplace(Reflowclip, "`r`n`r`n", "`r`n", Count)
            if (Count = 0)  ; No more replacements needed.
                break
            }        
        clipboard := Reflowclip
        ; Remove double spaces between letter , only at the beginning of the 'haystack'
        ; Replace with single space
        clipboard := StrReplace(clipboard, "  ", " ", A)
        clipwait 0.1
        }
    PDFclip := ""
    Reflowclip := ""
return
