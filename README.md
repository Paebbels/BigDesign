# BigDesign

## Project setup
1. Open `project/BigDesign.2008.xpr` with Vivado (tested with 2025.2).
1. Setup `local_configuration.vhdl`:
   * Rename `src/PoC/local_configuration.vhdl.template` to `src/PoC/local_configuration.vhdl`.
   * Fill in the field according to the location of the project on your machine.

## Run simulation
1. Open your preferred simulator
   * Has been tested with:
     * Aldec Riviera-PRO 2025.10, 2026.04
     * NVC 1.21.0: (does not support DMA testcases)
     * GHDL (mcode/llvm): todo
2. Navigate to the `temp` folder.
3. Run the `regression.tcl` file.
   * Review the header of the tcl-file for more details.
