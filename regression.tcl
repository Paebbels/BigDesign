namespace eval ::poc {
	variable myConfigFile  "../../../src/PoC/my_config.vhdl"
	variable myProjectFile "../../../src/PoC/my_project.vhdl"
	variable vendor "GENERIC"; # GENERIC for vendor-less build; Xilinx, Altera,... for vendor specific build
}

source ../lib/OSVVM-Scripts/StartUp.tcl
# source ../lib/OSVVM-Scripts/StartNVC.tcl

build ../lib/OsvvmLibraries.pro

if {$::osvvm::ToolName eq "GHDL"} {
    SetExtendedAnalyzeOptions {-frelaxed -Wno-specs -Wno-elaboration}
    SetExtendedSimulateOptions {-frelaxed -Wno-specs -Wno-binding}
}

if {$::osvvm::ToolName eq "RiveraPRO"} {
    SetExtendedSimulationOptions {-unbounderror}
}

if {$::osvvm::ToolName eq "NVC"} {
    SetExtendedAnalyzeOptions {--relaxed}
}

set ::osvvm::AnalyzeErrorStopCount 1
set ::osvvm::SimulateErrorStopCount 1

LinkLibrary unisim {C:/Tools/precompiled/Riviera-PRO/2025.10/Vivado/2025.2/unisim}
# LinkLibrary axi_infrastructure_v1_1_0 {C:/Tools/precompiled/Riviera-PRO/2025.10/Vivado/2025.2/axi_infrastructure_v1_1_0}
# LinkLibrary axi_vip_v1_1_22 {C:/Tools/precompiled/Riviera-PRO/2025.10/Vivado/2025.2/axi_vip_v1_1_22}
# LinkLibrary zynq_ultra_ps_e_vip_v1_0_22 {C:/Tools/precompiled/Riviera-PRO/2025.10/Vivado/2025.2/zynq_ultra_ps_e_vip_v1_0_22}

build ../lib/PoC/src/PoC.pro
build ../src/BigDesign.pro

#SetSaveWaves

build ../tb/RunAllTests.pro
