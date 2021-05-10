# Adder Circuits on Verilog

## **Introduction**

This repository is comprising of adder circuits, both combinational as well as sequential along with a full adder made up off two half adders.

## **Pre-requisites**

- [Logisim](http://www.cburch.com/logisim/download.html) Software
- [Icarus Verilog](http://bleyer.org/icarus/) Simulator
- [GitHub](https://github.com/)
- [Git](https://git-scm.com/downloads)

## **Instructor**

- [Zeeshan Rafique](https://github.com/zeeshanrafique23)

## **Implementation** ##

First, a simple adder circuit has been implemented to have hands on practice on verilog. To get better understanding, both the combinational as well sequential circuit has been implemented. Then, by using the concept of digital logic design circuits of half adder and full adder have been created on logisim software. Lastly, in light of both the softwares, two half adders are used to make a full adder on the verilog software.

### ***Combinational Adder*** ###

This circuit add two one-bit numbers and displays the result in single bit.

### ***Sequential Adder*** ###

This circuit add two one-bit numbers on each positive edge of the clock and displays the result in single bit.

### ***Half Adder*** ###

This circuit also add two one bit numbers but in the output it is capable of displaying complete result i.e. two-bit numbers.

### ***Full Adder*** ###

This circuit, as the name describes is the modified form of half adder that is actually been implemented by two half adders allowing three inputs and displays complete result in two bit numbers.

## **Execution** ##

When the code has been written, then its time to execute it and check the result it on another simulator i.e. gtkwave which displays the waveforms. It is basically the part of Icarus Verilog comes along with the package when downloaded.

_Since, all the working has been done on Windows OS, therefore a slight difference would be seen for Linux OS users._

```
iverilog -o file_name_tb.vvp file_name_tb.v
vvp file_name_tb.vvp
gtkwave
```