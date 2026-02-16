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
