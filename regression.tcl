# =============================================================================
# Authors:
#   Patrick Lehmann
#   Adrian Weiland
#
# License:
# =============================================================================
# Copyright 2025-2026 The BigDesign Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#		http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =============================================================================
source ../lib/OSVVM-Scripts/StartUp.tcl
# source ../lib/PoC/Tools/OSVVM/poc.tcl

namespace eval ::poc {
	proc getEnv {var {default ""}} {
		if {[info exists ::env($var)]} {
			return $::env($var)
		}
		return $default
	}

	variable vendorName [getEnv VENDOR "GENERIC"]
	variable boardName  [getEnv BOARD  "GENERIC"]

	variable myConfigFile  "../../../src/PoC/my_config_$boardName.vhdl"
	variable myProjectFile "../../../src/PoC/my_project.vhdl"

	variable vendor $vendorName; # GENERIC for vendor-less build; Xilinx, Altera,... for vendor specific build
}

namespace eval ::BigDesign {
	variable scalingFactor 100;  # scale length of simulation
}

if {[info exists ::env(GITLAB_CI)]} {
	set buildNamePrefix ""
} else {
	set buildNamePrefix "${::osvvm::ToolNameVersion}-"
}

build ../lib/OsvvmLibraries.pro [BuildName "${buildNamePrefix}OsvvmLibraries"]

if {$::osvvm::ToolName eq "GHDL"} {
	SetExtendedAnalyzeOptions {-frelaxed -Wno-specs -Wno-elaboration}
	SetExtendedSimulateOptions {-frelaxed -Wno-specs -Wno-binding}
	set ::BigDesign::scalingFactor 10

	library unisim
	analyze ../tb/unisim/vcomponents.pkg.vhdl

} elseif {$::osvvm::ToolName eq "RivieraPRO"} {
	set RivieraSimOptions {-unbounderror}
	set ::BigDesign::scalingFactor 1

	LinkLibrary unisim {C:/Tools/precompiled/Riviera-PRO/2025.10/Vivado/2025.2/unisim}

} elseif {$::osvvm::ToolName eq "NVC"} {
	SetExtendedAnalyzeOptions {--relaxed}

	library unisim
	analyze ../tb/unisim/vcomponents.pkg.vhdl

} elseif {$::osvvm::ToolName eq "Sigasi"} {

} else {
	error [format {
======================================
Unknown simulator selected: %s

Supported simulators:
  - GHDL
  - RivieraPRO
  - NVC
Other tools:
  - Sigasi in VSCode
======================================
} $::osvvm::ToolName]
}

set ::osvvm::AnalyzeErrorStopCount 1
set ::osvvm::SimulateErrorStopCount 1

build ../lib/PoC/src/PoC.pro [BuildName "${buildNamePrefix}PoC"]
build ../src/BigDesign.pro   [BuildName "${buildNamePrefix}BigDesign"]

# SetSaveWaves

build ../tb/RunAllTests.pro  [BuildName "${buildNamePrefix}RunAllTests"]
