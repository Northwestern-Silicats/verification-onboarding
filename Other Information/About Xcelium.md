# About Cadence Xcelium
![Cadence](https://www.hpcwire.com/wp-content/uploads/2011/03/cadence-logo.jpg)

Xcelium is a EDA simulation tool used to test digital designs (those developed using RTL such as Verilog or VHDL).
It can be used both with and without considering for parasitic capacitance, allowing design functionally (RTL logic) and implementation validity (logic + chip performance) to be examined separately.
Usage of Xcelium typically requires a license and is only available on Linux systems; however, some courses (such as Comp_Eng 303) provide some exposure via the Student Computing Lab.

### Why understand Xcelium?
For digital designs, and especially in industry, Xcelium is very widely used. Many companies will have extensive experience integrating Xcelium as part of their workflows and will expect you to be able to adapt quickly.
Furthermore, while alternatives such as Synopsys VCS exist, having exposure to one will help adapting to the other be easier down the line. Since some courses already use Cadence tools and some people may already be familiar
with them, we've chosen to focus on Xcelium here to create a shared knowledge base.

## How can I use Xcelium?
Being an enterprise Linux application frequently accessed via server license, Xcelium typically does not have a simple icon that can be clicked to launch it. Instead, you must detail the file paths of both the Design Under Test (DUT; the actual RTL design code) and a corresponding testbench,
as well as include any command-line arguments needed to execute the program. As an example, look at the following command to test a bagel (torus) volume calculator:
- $ xrun -64bit -gui -access r bagel_volume.sv bagel_volume_test.sv

The above command runs Xcelium (xrun) in 64-bit mode (-64bit) and a graphical user interface (-gui). It also gives Xcelium read access (-access r) to the Design Under Test (bagel_volume.sv) and its testbench following it (bagel_volume_test.sv).
If this is a bit much at once, don't worry--we'll go into more detail later. For now, understand that adjusting these arguments is necessary to properly test designs, and you'll want to be comfortable checking how you start Xcelium before making any conclusions about your design's validity.
