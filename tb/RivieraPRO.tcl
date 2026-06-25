if {![info exists ::env(CI)]} {
	log -rec /*
	if {[file exists "../tb/BigDesign.do"]} {
		do ../tb/BigDesign.do
	}
}
