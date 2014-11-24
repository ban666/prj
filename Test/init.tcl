
proc initlib {ProjectLocation libary} {
set Location "$ProjectLocation\\$libary"
catch {glob -directory "$ProjectLocation\\$libary" *.tcl} msg
foreach file $msg {
source $file
	
}
}

proc StartExcute {ProjectLocation libary} {
set Location "$ProjectLocation\\$libary"
catch {glob -directory "$ProjectLocation\\$libary" *.app.tcl} msg
	
foreach file $msg {
source $file
}
}


initlib "[string range [info script] 0 [string first t\\init [info script]]]" "Globalinfo"
initlib "[string range [info script] 0 [string first t\\init [info script]]]" "lib"