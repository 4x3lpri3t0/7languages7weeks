Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.AppActivate "Console writer app!"
For I = 0 to WScript.Arguments.Count - 1
    WshShell.SendKeys WScript.Arguments(I) & " "
Next
WshShell.SendKeys "{ENTER}"