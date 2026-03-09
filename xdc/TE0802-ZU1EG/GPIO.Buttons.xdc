set_property PACKAGE_PIN U2       [ get_ports {GPIO_Button[0]} ];  # up
set_property PACKAGE_PIN R1       [ get_ports {GPIO_Button[1]} ];  # left
# set_property PACKAGE_PIN T1       [ get_ports {GPIO_Button[2]} ];  # center
# set_property PACKAGE_PIN U1       [ get_ports {GPIO_Button[3]} ];  # right
# set_property PACKAGE_PIN T2       [ get_ports {GPIO_Button[4]} ];  # down
set_property IOSTANDARD  LVCMOS18 [ get_ports -regexp {GPIO_Button\[\w+\]} ]
