set theFolder to POSIX path of ((the path to me as text) & "::")
set Controller to run script ("script s" & return & (read alias (POSIX file (theFolder & "/lib/controller.scpt")) as «class utf8») & return & "end script " & return & "return s")

Controller's control(39)
