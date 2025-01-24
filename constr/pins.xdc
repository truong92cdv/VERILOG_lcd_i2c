set_property PACKAGE_PIN A8 [get_ports {rst_n}]
set_property PACKAGE_PIN F7 [get_ports {sda}]
set_property PACKAGE_PIN F8 [get_ports {scl}]

set_property IOSTANDARD LVCMOS18 [get_ports {rst_n}]
set_property IOSTANDARD LVCMOS18 [get_ports {sda}]
set_property IOSTANDARD LVCMOS18 [get_ports {scl}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets rst_n]