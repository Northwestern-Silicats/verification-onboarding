# Silicats - Fall 2026 Verification Onboarding
Onboarding scripts and information for Fall 2026.

These files are intended to be used in conjunction with the Digital Design team's Median Pixel Filter onboarding project.
The Design Verification onboarding, which comes next, is meant to give new members the basic background needed to begin creating their 
own testbenches. The code here can therefore be used as an example of testbench design.

## Repository Structure
- Testbench Setups: miscellaneous files used to create a testbench environment
- Testbench Scripts: SystemVerilog testbench files
- Project Scripts: SV files from the Digital Design team's MPF project (V2, current as of 10/09/2026 @ 11AM CDT); used as DUT
- Other Information: information about using Cadence Xcelium (software used to test testbenches)

## Important Notes
The SV files here, in particular the testbenches, should not be assumed as "plug-and-play". Depending on the specific DUT being tested,
input/output names, parameters, and reset functionality may require edits. The testbenches here assume a clock triggered on a positive 
edge and a synchronous, active high reset.

Additionally, information about using Cadence Xcelium is only meant as a reference. The instructions are written with respect to the ECE/CS Student
Computing Lab in Tech EG20 & its related servers. The lab is primarily meant for coursework & may not be accessible; however, exposure to the Linux
command-line instructions themselves can be helpful.

## Authors
- Digital Design Team Members: Spencer Kogoma & Jacob (Project Scripts & Digital Design Team subfolders)
- Design Verification Team Members: Jeremiah Woods (Other Information and other written files)
