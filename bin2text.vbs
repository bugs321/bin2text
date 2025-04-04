''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Author Name: Naveen Nainegali
'File Name 	: bin2text
'About File : Script to covert Binary to Text and Text to Binary
'License	: Under MIT Open Source License 
'	 This scipt is to be used for community use and educational purpose only, no illegal or unauthorized use of this script is permitted. 
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Set oarg = wscript.Arguments
if oarg.Count <> 03 Then
        wscript.echo "format: " & wscript.ScriptName & " {bin2text|text2bin} {inputfile} {outputfile}"
        Err.Raise -1
End if
If oarg(0) = "bin2text" then ReadBinWriteText oarg(1) , oarg(2)
If oarg(0) = "text2bin" then ReadTextWriteBin oarg(1) , oarg(2)

Sub ReadBinWriteText (inpfile,outfile)
  Dim fso
  Dim inf
  Dim ouf
  Dim ins
  Dim ous
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set inf = fso.getFile(inpfile)
  Set ins = inf.OpenAsTextStream()
  Set ous = fso.createTextFile(outfile)
  While not ins.AtEndOfStream
         ch = ins.read(1)
         aa = asc(ch)
         ous.WriteLine aa
  Wend
  ins.Close
  ous.Close
End Sub


Sub ReadTextWriteBin (inpfile,outfile)
  Dim fso
  Dim inf
  Dim ouf
  Dim ins
  Dim ous
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set ins = fso.OpenTextFile(inpfile)
  Set ous = fso.createTextFile(outfile)
  While not ins.AtEndOfStream
        aa = ins.readline
        ch = chr(aa)
         ous.Write ch
  Wend
  ins.Close
  ous.Close
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'End of File
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''