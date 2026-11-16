# BigDesign

| Vivado Version | `2026.1` |
|---|---|

## Project setup

1. Open `project/BigDesign.2008.xpr` with Vivado (tested with 2026.1).
2. Configure `local_configuration.vhdl`:
   - Rename `src/PoC/local_configuration.vhdl.template` to `src/PoC/local_configuration.vhdl`.
   - Update the configuration according to the location of the project on your machine.
3. Launch synthesis.
   - This verifies the basic project setup and generates files required for simulation.

## Run simulation

BigDesign supports multiple simulators and versions. The simulator and its corresponding library paths must be configured before running the regression.

**Supported simulators:**
- [Aldec Riviera-PRO](https://www.aldec.com/en/products/functional_verification/riviera-pro)
- [NVC](https://github.com/nickg/nvc)
- [GHDL](https://github.com/ghdl/ghdl)

### Environment variables

The following environment variables can be used to configure the paths to the Vivado IP sources and precompiled simulation libraries:

| Environment Variable | Description |
|---|---|
| `XILINX_IP_DIR` | Path to the Xilinx IP sources of the selected Vivado installation |
| `PRECOMPILED_LIB_RIVIERA` | Path to Riviera-PRO precompiled Vivado libraries |
| `PRECOMPILED_LIB_NVC` | Path to NVC precompiled Vivado libraries |
| `PRECOMPILED_LIB_GHDL` | Path to GHDL precompiled Vivado libraries |

The paths can alternatively be configured manually in `regression.tcl`. See the corresponding `FIXME` comments.

**Note:** Make sure that the selected precompiled libraries match the configured simulator and Vivado versions.

### Running the regression

1. Open your preferred simulator.
   - Tested with:
     - Aldec Riviera-PRO 2025.10, 2026.04 and 2026.06
     - NVC 1.23.1 (DMA testcases are not supported)
     - GHDL (mcode/LLVM): TODO
2. Navigate to the `temp` directory.
3. Execute `regression.tcl`.
   - Refer to the header of `regression.tcl` for details about selecting individual regression steps and execution modes.
