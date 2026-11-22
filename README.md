# Full Adder – SystemVerilog Class-Based Testbench

Layered testbench (transaction, generator, driver, monitor, scoreboard, environment) verifying a gate-level full adder built from two half adders.

## Structure
- `design/` – `half_adder.sv`, `full_adder.sv` (DUT)
- `tb/` – `interface.sv`, `transaction.sv`, `generator.sv`, `driver.sv`, `monitor.sv`, `scoreboard.sv`, `environment.sv`, `test.sv`, `testbench.sv` (top)

## Run on EDA Playground
- Put `half_adder.sv` + `full_adder.sv` in the design pane (or just full_adder.sv with half_adder pasted above it).
- Add each `tb/` file as its own tab, `testbench.sv` as the top file.
- Simulator: one with SystemVerilog class support (Synopsys VCS, Aldec Riviera-PRO, Cadence Xcelium).
- Top module: `tbench_top`

## Run locally (example, VCS)
```
vcs -sverilog -timescale=1ns/1ps +incdir+design +incdir+tb design/full_adder.sv tb/testbench.sv && ./simv
```
The scoreboard prints a pass/fail summary for 16 random vectors (change `count` in `environment.sv`).
