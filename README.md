# HSCA_Multipliers
FPGA implementation of 8*8 and 16*16 Wallace, Dadda, Array for High Speed Computer Arithmetic.

# Collaborators

Samarth Bonthala,
 Atharva Karaguppi,
 Tejas Bhagwat

# Sim

The RTL code for our implementation is located in rtl directory. The simulation test benches are located in sim directory. 
Download [Icarus Verilog](https://bleyer.org/icarus/) and [GTKWave](https://gtkwave.sourceforge.net/). The design can be then simulated using the following steps-

```
iverilog -o test sim/dadda_8_tb.v
vvp test
vcd dadda_8_tb.vcd
```

Note- Inorder to simulate the array multiplier, one needs to make sure the parameter 'n' is correctly modified to simulate the 8*8 and 16*16 variants. For the other multipliers these are stored as 2 seperate code variants.


