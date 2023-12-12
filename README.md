# Verilog Practice

Verilog is a hardware description language used to model and design digital systems. It allows engineers to describe the behavior and structure of electronic systems, such as integrated circuits and FPGA-based designs. Verilog is widely used in digital design, verification, and synthesis processes for creating hardware models, simulations, and testbenches. It's known for its ability to describe complex digital systems and its role in the design and verification of electronic circuits.

## Pre-Requisites

- Visual Studio Code Integrated Development Environment
- Icarus Verilog Simulator
- GTKWave Waveform Viewer

## Implementation and Execution

### Source File Creation

Start by creating a Verilog source file and writing the code according to the design requirements. This file describes the digital system's behavior and structure.

```
iverilog -o file_name_tb.vvp file_name_tb.v
```

### Testbench Development

Create a testbench for the designed file. Write code within the testbench to verify and validate the behavior of signals and modules declared in the source file. This testbench simulates the functionality of the designed system.

```
vvp file_name_tb.vvp
```

### Waveforms Generation

Generate a waveform file that captures the simulated behavior of signals during the testbench execution. This file can be visualized using a waveform viewer to analyze and understand the behavior of signals over time.

## Instructors

- [Zeeshan Rafique](https://github.com/zeeshanrafique23)
- [Sajjad Ahmed](https://github.com/sajjadahmed677)

## References

- [ChipVerify](https://www.chipverify.com/tutorials/verilog)
- [100 Days of RTL](https://github.com/raulbehl/100DaysOfRTL)

