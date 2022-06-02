Set stream = CreateObject("ADODB.Stream")
' 74 1F 48 63 D0 48 8D 0D ED 13 03 00 48 C1 E2 04 48 03 D1 48 8B CF 48 89 57 58 8B D0 E8 24 02 00 00
find1 = Chr(116)&Chr(31)&Chr(72)&Chr(99)&ChrW(208)&Chr(72)&ChrW(141)&Chr(13)&ChrW(237)&Chr(19)&Chr(3)&Chr(0)&Chr(72)&ChrW(193)&ChrW(226)&Chr(4)&Chr(72)&Chr(3)&ChrW(209)&Chr(72)&Chr(139)&ChrW(207)&Chr(72)&Chr(137)&Chr(87)&Chr(88)&Chr(139)&ChrW(208)&ChrW(232)&Chr(36)&Chr(2)&Chr(0)&Chr(0)
' rundll32.exe AppXDeploymentExtensions.OneCore.dll,ShellRefresh
find2 = Chr(114)&Chr(0)&Chr(117)&Chr(0)&Chr(110)&Chr(0)&Chr(100)&Chr(0)&Chr(108)&Chr(0)&Chr(108)&Chr(0)&Chr(51)&Chr(0)&Chr(50)&Chr(0)&Chr(46)&Chr(0)&Chr(101)&Chr(0)&Chr(120)&Chr(0)&Chr(101)&Chr(0)&Chr(32)&Chr(0)&Chr(65)&Chr(0)&Chr(112)&Chr(0)&Chr(112)&Chr(0)&Chr(88)&Chr(0)&Chr(68)&Chr(0)&Chr(101)&Chr(0)&Chr(112)&Chr(0)&Chr(108)&Chr(0)&Chr(111)&Chr(0)&Chr(121)&Chr(0)&Chr(109)&Chr(0)&Chr(101)&Chr(0)&Chr(110)&Chr(0)&Chr(116)&Chr(0)&Chr(69)&Chr(0)&Chr(120)&Chr(0)&Chr(116)&Chr(0)&Chr(101)&Chr(0)&Chr(110)&Chr(0)&Chr(115)&Chr(0)&Chr(105)&Chr(0)&Chr(111)&Chr(0)&Chr(110)&Chr(0)&Chr(115)&Chr(0)&Chr(46)&Chr(0)&Chr(79)&Chr(0)&Chr(110)&Chr(0)&Chr(101)&Chr(0)&Chr(67)&Chr(0)&Chr(111)&Chr(0)&Chr(114)&Chr(0)&Chr(101)&Chr(0)&Chr(46)&Chr(0)&Chr(100)&Chr(0)&Chr(108)&Chr(0)&Chr(108)&Chr(0)&Chr(44)&Chr(0)&Chr(83)&Chr(0)&Chr(104)&Chr(0)&Chr(101)&Chr(0)&Chr(108)&Chr(0)&Chr(108)&Chr(0)&Chr(82)&Chr(0)&Chr(101)&Chr(0)&Chr(102)&Chr(0)&Chr(114)&Chr(0)&Chr(101)&Chr(0)&Chr(115)&Chr(0)&Chr(104)
' 00 00 00 00 00 43 00 4E 00 00 00 00 00
find3 = Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(67)&Chr(0)&Chr(78)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0)
stream.Open
stream.Type = 2
stream.Charset = "Windows-1252"
stream.LoadFromFile WScript.Arguments(0)
data = stream.ReadText
stream.Close
If (CreateObject("Scripting.FileSystemObject").FileExists(CreateObject("WScript.Shell").ExpandEnvironmentStrings("%windir%\ru-RU\explorer.exe.mui"))) Then
	lang = "RU"
Else
	lang = "EN"
End If
If (WScript.Arguments(2) = 1 And InStr(data, find1) > 0) Or (WScript.Arguments(2) = 2 And InStr(data, find2) > 0) Or (WScript.Arguments(2) = 3 And InStr(data, find3) > 0) Then
	If WScript.Arguments(2) = 1 Then
		data = Replace(data, find1, ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144)&ChrW(144))
	ElseIf WScript.Arguments(2) = 2 Then
		data = Replace(data, find2, Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32)&Chr(0)&Chr(32))
	ElseIf WScript.Arguments(2) = 3 Then
		if lang = "RU" Then
			data = Replace(data, find3, Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(82)&Chr(0)&Chr(85)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0))
		Else
			data = Replace(data, find3, Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(85)&Chr(0)&Chr(83)&Chr(0)&Chr(0)&Chr(0)&Chr(0)&Chr(0))
		End If
	End If
	stream.Open
	stream.Type = 2
	stream.Charset = "Windows-1252"
	stream.WriteText data
	stream.SaveToFile WScript.Arguments(1), 2
	stream.Close
	result = "Done"
Else
	result = "Error"
End If
if lang = "RU" Then
	if result = "Done" Then
		WScript.Echo "Операция замены выполнена."
	Else
		WScript.Echo "Ошибка операции."
	End If
Else
	if result = "Done" Then
		WScript.Echo "Replace operation success."
	Else
		WScript.Echo "Operation error."
	End If
End If
Set stream = Nothing
