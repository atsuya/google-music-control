set theFolder to POSIX path of ((the path to me as text) & "::")
set Controller to run script ("script s" & return & (read alias (POSIX file (theFolder & "/lib/controller.scpt")) as «class utf8») & return & "end script " & return & "return s")

set currentTrack to Controller's getCurrentSong()

set output to item 1 of currentTrack & " - " & item 2 of currentTrack

do shell script "echo " & quoted form of output
