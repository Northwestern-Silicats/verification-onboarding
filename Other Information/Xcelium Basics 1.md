# More Xcelium Basics
![Cadence](https://www.hpcwire.com/wp-content/uploads/2011/03/cadence-logo.jpg)

To follow along here, it's best to read the About Xcelium markdown file first. This isn't required, however; if you already have a basic understanding of what Xcelium is, feel free to skip straight here. The below information also assumes you're familiar with command line interfaces, but a basic awareness (no images, text-only) is enough.

## How do I get in?
First, let's focus on a basic combo: an RTL design file and a testbench. The following example uses the Student Computing Lab (EG20) infrastructure as a reference. Again, specific commands may vary depending on your configuration.

Starting from the Terminal,
- $ cd ./Path/To/Project/Directory

This moves the terminal inside your project folder. While this may seem trivial to mention, it's important to try to do this before running Xcelium. It makes accessing the DUT easier by shortening its path in subsequent commands, which makes checking the commands for accuracy a bit easier.

From here,
- $ source /vol/ece303/genus_tutorial/cadence.env
- $ xrun -64bit -gui -access r Project_DUT.sv Project_Testbench.sv

These commands first source the cadence environment, then run Xcelium with a GUI in 64-bit (xrun -64bit -gui) mode, giving it read-only (-access r) access to the DUT and a corresponding testbench.

### What about synthesized designs?
As a brief overview, these are RTL designs that have been made into a list of physical gates (a gatelist) to make physical chips with. Among other software, this can be done with Cadence Genus, which you'll hear more about from the Physical Design team. For our purposes, the only thing that changes is the Xcelium startup command:
- $ xrun -64bit -gui -access r -xmelab_args "-warnmax 0 -delay_mode zero -maxdelays" ./Synthesis/Synthesized_DUT.v Project_Testbench.sv /vol/ece303/genus_tutorial/NangateOpenCellLibrary.v

This version adds arguments for the Xcelium elaboration tool (-xmelab_args "-warnmax 0 -delay_mode zero -maxdelays") that allow the simulator to incorporate timing delays, as well as the standard cell library (/vol/ece303/genus_tutorial/NangateOpenCellLibrary.v) the simulator needs to determine what those delays are.

## I'm in. Now what?
You should be seeing two screens. First is the console for the Simulation Analysis Environment (SimVision); this will generally be left alone. Feel free to minimize it.
<p align="center">
  <img width="727" height="283" alt="Screenshot from 2026-11-05 14-53-41" src="https://github.com/user-attachments/assets/3bf5d327-6e24-4ddc-b87d-113af1c96f6d" />
</p>

The second window is much more important, housing the Design Browser. This is where you'll access the simulations for your testbench.
<p align="center">
  <img width="728" height="538" alt="Screenshot from 2026-11-05 14-53-20" src="https://github.com/user-attachments/assets/0d274ef4-bb39-4338-b3fd-21d3e1e08940" />
</p>


As seen in the image above, click on your design and expand it to see all its components. Then, scroll (it may take a while; the list is in alphabetical order) until you find your testbench name. Right-click on it and select "Send to Waveform Window".
<p align="center">
  <img width="723" height="537" alt="Screenshot from 2026-11-05 15-14-18" src="https://github.com/user-attachments/assets/a24f9a7b-5d43-481a-943e-78bf2396150b" />
</p>

You should now see the Waveform Viewer for your testbench. From here, click Simulation -> Run. You may need to click Simulation -> Reset to Start beforehand.
<p align="center">
  <img width="1007" height="634" alt="Screenshot from 2026-11-05 16-08-19" src="https://github.com/user-attachments/assets/5e67e4ba-8070-4a0a-bfab-5240d4bf96b1" />
</p>

You should see your testbench execute and generate waveforms for each signal. Feel free to adjust the two pins at the bottom of the waveform section (near the horizontal scrolling bar) to zoom out and see the entire testbench execution.


