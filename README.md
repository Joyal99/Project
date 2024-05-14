This project file contains my Project files for COEN313(Winter 2024).

My project files include the following deliverables:
- counter_code.vhd                  -> main VHDL code for the program
- counter_testbench.vhd             -> testbench of the program
- counter.xdc                       -> constraints file used to carry out the implementation and synthesis on Vivado
- runme_implementation.log          -> implementation log from Vivado
- runme_synthesis.log		    -> synthesis log from Vivado
- wave_test.bmp                     -> contains the Modelsim testbench waves trial
- schematic.jpg			    -> implemented design schematic from Vivado of VHDL system design


Some information on how to run the files:
1- Modelsim: To run the testbench to get the transcripts and wave, 
compile both the main VHDL code file and testbench file and then do the command [vsim counter_tb &]

2- Vivado: To get the synthesis and implementation from Vivado, use the main VHDL file 
along with the constraints file counter.xdc to be able to get the implentation file and synthesis file. 


The transcript file has been inputted on the wave_test.bmp file, which shows the Modelsim testbench trial. 

-----------------------------------------------------------------------------------------------------------------------
Thank You for understanding!