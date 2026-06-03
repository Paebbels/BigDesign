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
source ../lib/PoC/tools/OSVVM/poc.tcl

namespace import ::poc::*

namespace eval ::poc {
	variable myConfigFile  "../../../src/PoC/my_config_${::poc::boardName}.vhdl"
	variable myProjectFile "../../../src/PoC/my_project.vhdl"
}

namespace eval ::BigDesign {
	variable scalingFactor 100;  # scale length of simulation
}

build ../lib/OsvvmLibraries.pro [BuildName "${::poc::buildNamePrefix}OsvvmLibraries"]
checkForBuildErrors

# -s -stop <i>    set the stop counts to <i>
# -d -debug       enable debugging
# -w -waves       save waveforms
# -g -gui         disables system exit (i.e. on errors)
configureOSVVM -stop 1
if {$::osvvm::ToolName eq "GHDL"} {
	set ::BigDesign::scalingFactor 10

	library unisim
	analyze ../tb/unisim/vcomponents.pkg.vhdl

} elseif {$::osvvm::ToolName eq "RivieraPRO"} {
	set ::BigDesign::scalingFactor 1

	# FIXME: this is a hardcoded path
	LinkLibrary unisim {C:/Tools/precompiled/Riviera-PRO/2025.10/Vivado/2025.2/unisim}

} elseif {$::osvvm::ToolName eq "NVC"} {
	library unisim
	analyze ../tb/unisim/vcomponents.pkg.vhdl

}

# configurePoC
build ../lib/PoC/src/PoC.pro [BuildName "${::poc::buildNamePrefix}PoC"]
checkForBuildErrors

build ../src/BigDesign.pro   [BuildName "${::poc::buildNamePrefix}BigDesign"]
checkForBuildErrors

build ../tb/RunAllTests.pro  [BuildName "${::poc::buildNamePrefix}RunAllTests"]
checkForRunErrors
