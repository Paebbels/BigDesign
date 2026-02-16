# =============================================================================
# Authors:
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
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =============================================================================

library lib_BigDesign
analyze BigDesign/PS_settings_pkg.vhdl

library lib_test
analyze ../tb/PS_Stub.vhdl

library lib_BigDesign
analyze ../bd/BlockDesign/synth/BlockDesign.vhd
analyze ../bd/BlockDesign/hdl/BlockDesign_wrapper.vhd
analyze ../tb/BlockDesign_wrapper_conf.vhdl
analyze BigDesign/BlockDesign_top.2008.vhdl
analyze BigDesign/Design.2008.vhdl
analyze BigDesign/Toplevel_A0.2008.vhdl
