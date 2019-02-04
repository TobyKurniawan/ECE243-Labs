# stop any simulation that is currently running
quit -sim

# if simulating with a MIF file, copy it to the working folder. Assumes inst_mem.mif
if {[file exists ../L2P6.mif]} {
	file delete L2P6.mif
	file copy ../L2P6.mif .
}
# in case Quartus generated an "empty black box" file for the memory, delete it
if {[file exists ../inst_mem_bb.v]} {
	file delete ../inst_mem_bb.v
}

# create the default "work" library
vlib work;

# compile the Verilog source code in the parent folder
vlog part3.v flipflop.v inst_mem.v seg7_scroll.v proc.v
# compile the Verilog code of the testbench
vlog testbench.v
# start the Simulator
vsim work.testbench -Lf 220model -Lf altera_mf_ver -Lf verilog
# show waveforms specified in wave.do
do wave.do
# advance the simulation the desired amount of time
run 7000 ns
