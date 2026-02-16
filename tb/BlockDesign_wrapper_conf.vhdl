-- =============================================================================
-- Authors:
--   Adrian Weiland
--
-- License:
-- =============================================================================
-- Copyright 2025-2026 The BigDesign Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- =============================================================================

library lib_BigDesign;
library lib_test;

configuration BlockDesign_wrapper_conf of BlockDesign_wrapper is
	for STRUCTURE
		for BlockDesign_i: BlockDesign
			use entity lib_BigDesign.BlockDesign(STRUCTURE);
			for STRUCTURE
				for PS: BlockDesign_PS_0
					use entity lib_test.BlockDesign_PS_0(Stub);
				end for;
			end for;
		end for;
	end for;
end configuration;
