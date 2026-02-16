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

TestSuite BigDesign
library lib_test

global scalingFactor

analyze BigDesign_TestController.vhdl
analyze BigDesign_TestHarness.vhdl
analyze BigDesign_tb_pkg.vhdl

analyze BigDesign_Simple.vhdl
simulate BigDesign_Simple [generic PATTERN RepeatedSequentialBlockWrite]    [generic SCALING_FACTOR $scalingFactor]
simulate BigDesign_Simple [generic PATTERN RandomSequentialWrite_4MB_Range] [generic SCALING_FACTOR $scalingFactor]
simulate BigDesign_Simple [generic PATTERN RandomSequentialWrite_1TB_Range] [generic SCALING_FACTOR $scalingFactor]
