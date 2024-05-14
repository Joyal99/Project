set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk];
## Clock Signal
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [ get_ports { clk }];

## Reset Signal
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [ get_ports { reset }];

## Entry signal(x)
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [ get_ports { x }];

## Entry signal(y)
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [ get_ports { y }];

## Maximum Occupancy(m)
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [ get_ports { max_occupancy[1] }];
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [ get_ports { max_occupancy[2] }];
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [ get_ports { max_occupancy[3] }];
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [ get_ports { max_occupancy[1] }];
set_property -dict { PACKAGE_PIN T8 IOSTANDARD LVCMOS33 } [ get_ports { max_occupancy[2] }];
set_property -dict { PACKAGE_PIN U8 IOSTANDARD LVCMOS33 } [ get_ports { max_occupancy[3] }];
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [ get_ports { max_occupancy[2] }];
set_property -dict { PACKAGE_PIN T13 IOSTANDARD LVCMOS33 } [ get_ports { max_occupancy[3] }];

## Warning signal
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [ get_ports { warning }];
