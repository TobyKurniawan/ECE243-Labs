onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label KEY /testbench/KEY
add wave -noupdate -label CLOCK_50 /testbench/CLOCK_50
add wave -noupdate -label SW -radix hexadecimal /testbench/SW
add wave -noupdate -label LEDR -radix hexadecimal /testbench/LEDR
configure wave -namecolwidth 98
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {250 ns}
