library lib_test;

configuration BlockDesign_wrapper_conf of BlockDesign_wrapper is
	for STRUCTURE
		for BlockDesign_i: BlockDesign
			for STRUCTURE
				for PS: BlockDesign_PS_0
					use entity lib_test.BlockDesign_PS_0(Stub);
				end for;
			end for;
		end for;
	end for;
end configuration;
