## Custom .xdc for VGA/HDMI Project

# Clock input
set_property PACKAGE_PIN H16 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset button
set_property PACKAGE_PIN E18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

# HDMI Clock
set_property IOSTANDARD TMDS_33 [get_ports hdmi_clk_p]
set_property PACKAGE_PIN U18 [get_ports hdmi_clk_p]
set_property PACKAGE_PIN U19 [get_ports hdmi_clk_n]
set_property IOSTANDARD TMDS_33 [get_ports hdmi_clk_n]

# HDMI Data channels
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_tx_p[0]}]
set_property PACKAGE_PIN V17 [get_ports {hdmi_tx_p[0]}]
set_property PACKAGE_PIN V18 [get_ports {hdmi_tx_n[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_tx_n[0]}]

set_property IOSTANDARD TMDS_33 [get_ports {hdmi_tx_p[1]}]
set_property PACKAGE_PIN N17 [get_ports {hdmi_tx_p[1]}]
set_property PACKAGE_PIN P18 [get_ports {hdmi_tx_n[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_tx_n[1]}]

set_property IOSTANDARD TMDS_33 [get_ports {hdmi_tx_p[2]}]
set_property PACKAGE_PIN N18 [get_ports {hdmi_tx_p[2]}]
set_property PACKAGE_PIN P19 [get_ports {hdmi_tx_n[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_tx_n[2]}]










create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_wiz/inst/clk_in1_clk_wiz_0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {counter_125_inst/counter[0]} {counter_125_inst/counter[1]} {counter_125_inst/counter[2]} {counter_125_inst/counter[3]} {counter_125_inst/counter[4]} {counter_125_inst/counter[5]} {counter_125_inst/counter[6]} {counter_125_inst/counter[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {counter_25_inst/counter[0]} {counter_25_inst/counter[1]} {counter_25_inst/counter[2]} {counter_25_inst/counter[3]} {counter_25_inst/counter[4]} {counter_25_inst/counter[5]} {counter_25_inst/counter[6]} {counter_25_inst/counter[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {cnt_25[0]} {cnt_25[1]} {cnt_25[2]} {cnt_25[3]} {cnt_25[4]} {cnt_25[5]} {cnt_25[6]} {cnt_25[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 10 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {py[0]} {py[1]} {py[2]} {py[3]} {py[4]} {py[5]} {py[6]} {py[7]} {py[8]} {py[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 10 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {px[0]} {px[1]} {px[2]} {px[3]} {px[4]} {px[5]} {px[6]} {px[7]} {px[8]} {px[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {cnt_125[0]} {cnt_125[1]} {cnt_125[2]} {cnt_125[3]} {cnt_125[4]} {cnt_125[5]} {cnt_125[6]} {cnt_125[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list clk_25MHz]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list clk_125MHz]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list hsync]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list video_active]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list vsync]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_in1_clk_wiz_0]
