# Silicats - Fall 2026 Verification Onboarding
<img width="1935" height="612" alt="Screenshot from 2026-10-13 07-56-38" src="https://github.com/user-attachments/assets/188d9679-77e5-4546-ba8a-f45065d71016" />

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

Additionally, while the majority of information about Cadence Xcelium is broadly applicable, certain instructions are written with respect to the ECE/CS Student
Computing Lab in Tech EG20 & related servers. CE, EE, and CS students should have access, but you may have to request it. Additionally, a remote-access option
is detailed here: http://it.eecs.northwestern.edu/info/2015/11/03/info-labs.html. The connection tends to be stable (if slightly slow), but requires using a VPN
if off-campus.

## Authors
- Digital Design Team Members: Spencer Kogoma & Jacob (Project Scripts & Digital Design Team subfolders)
- Design Verification Team (Cadence Xcelium information)
