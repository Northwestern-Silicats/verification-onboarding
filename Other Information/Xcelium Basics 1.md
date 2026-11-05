# More Xcelium Basics
![Cadence](https://www.hpcwire.com/wp-content/uploads/2011/03/cadence-logo.jpg)

To follow along here, it's best to read the About Xcelium markdown file first. This isn't required, however; if you already have a basic understanding of what Xcelium is, feel free to skip straight here. The below information also assumes you're familiar with command line interfaces, but a basic awareness (no GUI, text inputs) is enough.

## How do I get in?
First, let's focus on a basic combo: an RTL design file and a testbench. The following example uses the Student Computing Lab (EG20) infrastructure as a reference. Again, specific commands may vary depending on your configuration.

Starting from the Terminal,
- $ cd ./Path/To/Project/Directory

This moves the terminal inside your project folder. While this may seem trivial to mention, it's important to try to do this before running Xcelium. It makes accessing the DUT easier by shortening its path in subsequent commands, which makes checking the commands for accuracy a bit easier.

From here,
- $ source /vol/ece303/genus_tutorial/cadence.env
- $ xrun -64bit -gui -access r Project_DUT.sv Project_Testbench.sv

These commands first source the cadence environment, then run Xcelium with a GUI in 64-bit (xrun -64bit -gui) mode, giving it read-only (-access r) access to the DUT and a corresponding testbench.

## What about synthesized designs?
As a brief overview, these are RTL designs that have been made into a list of physical gates (a gatelist) to make physical chips with. Among other software, this can be done with Cadence Genus, which you'll hear more about from the Physical Design team. For our purposes, the only thing that changes is the Xcelium startup command:
- $ xrun -64bit -gui -access r -xmelab_args "-warnmax 0 -delay_mode zero -maxdelays" ./Synthesis/Synthesized_DUT.v Project_Testbench.sv /vol/ece303/genus_tutorial/NangateOpenCellLibrary.v

This version adds arguments for the Xcelium elaboration tool (-xmelab_args "-warnmax 0 -delay_mode zero -maxdelays") that allow the simulator to incorporate timing delays, as well as the standard cell library (/vol/ece303/genus_tutorial/NangateOpenCellLibrary.v) the simulator needs to determine what those delays are.
