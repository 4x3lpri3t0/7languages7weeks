@ECHO off

DIR

SET /p prologFileName=Write the name of the file you want to interpret: 

START "" "D:\swipl\bin\swipl-win.exe"

START writer.vbs "['%prologFileName%']."