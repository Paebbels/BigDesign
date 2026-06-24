# =============================================================================
# Authors:
#   Patrick Lehmann
#   Adrian Weiland
#
# Description:
#   This file is structured in a way that it can run in different modes locally
#   and on the CI server. Parameters can be set through arguments (a) if used
#   interactively and through environment variables (b).
#
#   (a) When in interactive mode, arguments can be set as shown below:
#       set ::argv <build_step>; set ::argc 1
#       (it has been tested with Riviera-PRO interactive, NVC interactive and tclsh with GHDL)
#
#   (b) One of the following environment variables can be set - REGRESSION_STEP has priority:
#       REGRESSION_FROM : <build_step> (similar to variant a)
#       REGRESSION_STEP : <build_step> - Execute only the selected step
#
#   Afterwards the file can be sourced as usual.
#   Note that (a) always has priority over (b). If none are specified all steps
#   are executed and everything is built.
#
#   Examples:
#     Riviera-PRO:
#       'set ::argv {poc}; set ::argc 1; source ../regression.tcl'
#       This will built everything starting with the PoC.
#     exec-NVC:
#       - 'REGRESSION_FROM="poc" exec-NVC.sh -n --tcl-file=regression.tcl'
#            This will build everything starting from the poc
#       - 'REGRESSION_STEP="test" exec-NVC.sh -n --tcl-file=regression.tcl'
#         'REGRESSION_FROM="poc" REGRESSION_STEP="test" exec-NVC.sh -n --tcl-file=regression.tcl'
#           This will only run the tests.
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

set root [file dirname [info script]]
# noqa: W300
source ${root}/lib/OSVVM-Scripts/StartUp.tcl
# noqa: W300
source ${root}/lib/PoC/tools/poc.tcl

namespace import ::poc::*
namespace import ::regression::*

#---------------------#
# Configuration space #
#---------------------#
set RivieraVersion "2026.04"
set VivadoVersion  "2025.2"

# FIXME: this is a hardcoded path
set precompiledLibPath "C:/Tools/precompiled/Riviera-PRO/${RivieraVersion}/Vivado/${VivadoVersion}"

set defaultStep "all"
set regressionLevels [createRegressionLevels osvvm poc dut test] ; # clean, all

# -P -projectRoot set project folder root for poc scripting
# -g -gui         disables system exit (i.e. on errors)
# -v -vendor      Vendor name
# -b -board       Board name
# -p -projectFile Path to the local_configuration file
# -c -configFile  Path to the project_configuration file
configurePoC \
	-P ${root} \
	-g \
	-v Xilinx \
	-b XCZU3EG \
	-p "../../../src/PoC/local_configuration.vhdl" \
	-c "../../../src/PoC/project_configuration_TE0802_ZU1EG.vhdl"

# -s -stop <i>    set the stop counts to <i>
# -d -debug       enable debugging
# -w -waves       save waveforms
configureOSVVM -stop 1 ;

#---------------------#

evaluateRegressionLevel $defaultStep $regressionLevels

# Currently not working because of paths being relative to project and submodule poc
# if {![file exists $::poc::localConfigurationPath] || $::regression::level == -1} {
# 	WriteLocalConfiguration
# } else {
# 	puts "${::poc::putsPrefix}Skipping local configuration file generation."
# }

puts "========================================"
puts "End of PoC configuration, start of build"
puts "========================================"
puts ""

namespace eval ::BigDesign {
	variable memoryScalingFactor 100;  # scale length of simulation for memory testcase
}

if {$::regression::level <= 0} {
	build "${root}/lib/OsvvmLibraries.pro" [BuildName "${::poc::buildNamePrefix}OsvvmLibraries"]
	if {[checkForBuildErrors] || $::regression::executeSingleStep} {
		return
	}
}

# Load vendor specific precompiled libraries
if {$::osvvm::ToolName eq "GHDL"} {
	set ::BigDesign::memoryScalingFactor 10
	# Precompile Vivado for GHDL
	#   execute compile-Xilinx-vivado.sh (can be found i.e. msys64/ucrt64/lib/ghdl/vendors)
	#   compile-Xilinx-vivado.sh --all --vhdl2008 --output /c/.../2025.2 -v
	LinkLibrary unisim {C:/Tools/precompiled/GHDL/7.0.0-dev/Vivado/2025.2}

} elseif {$::osvvm::ToolName eq "RivieraPRO"} {
	set ::BigDesign::memoryScalingFactor 1

	LinkLibrary xpm                   "$precompiledLibPath/xpm"
	LinkLibrary unisim                "$precompiledLibPath/unisim"
	LinkLibrary axi_sg_v4_1_21        "$precompiledLibPath/axi_sg_v4_1_21"
	LinkLibrary axi_datamover_v5_1_37 "$precompiledLibPath/axi_datamover_v5_1_37"
	LinkLibrary axi_dma_v7_1_37       "$precompiledLibPath/axi_dma_v7_1_37"

} elseif {$::osvvm::ToolName eq "NVC"} {
	# Precompile Vivado for NVC:
	#   export XILINX_VIVADO=/c/Xilinx/Vivado/2025.2/
	#   nvc --install vivado
	#   ls -l ~/.nvc/lib
	LinkLibrary unisim {C:/Tools/precompiled/NVC/1.21.0/Vivado/2025.2}
	LinkLibrary xpm {C:/Tools/precompiled/NVC/1.21.0/Vivado/2025.2}
}

if {$::regression::level <= 1} {
	build "${root}/lib/PoC/src/build.pro" [BuildName "${::poc::buildNamePrefix}PoC"]
	if {[checkForBuildErrors] || $::regression::executeSingleStep} {
		return
	}
}

if {$::regression::level <= 2} {
	build "${root}/src/BigDesign.pro" [BuildName "${::poc::buildNamePrefix}BigDesign"]
	if {[checkForBuildErrors] || $::regression::executeSingleStep} {
		return
	}
}

if {$::regression::level <= 3} {
	build "${root}/tb/RunAllTests.pro" [BuildName "${::poc::buildNamePrefix}RunAllTests"]
	if {[checkForRunErrors] || $::regression::executeSingleStep} {
		return
	}
}
