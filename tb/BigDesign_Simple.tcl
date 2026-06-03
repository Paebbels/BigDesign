if {![info exists ::env(CI)]} {
	log -rec /*
	if {[file exists "../tb/BigDesign_Simple.do"]} {
		do ../tb/BigDesign_Simple.do
	}
}
