# reset
set_property PACKAGE_PIN BF41     [get_ports "pcie_perstn"] ;# Bank  65 VCCO - VCC1V8   - IO_T3U_N12_PERSTN0_65
set_property IOSTANDARD  LVCMOS18 [get_ports "pcie_perstn"] ;# Bank  65 VCCO - VCC1V8   - IO_T3U_N12_PERSTN0_65
set_property PACKAGE_PIN BG45     [get_ports "reset_rtl"] ;# Bank  65 VCCO - VCC1V8   - IO_L18N_T2U_N11_AD2N_D13_65
set_property IOSTANDARD  LVCMOS18 [get_ports "reset_rtl"] ;# Bank  65 VCCO - VCC1V8   - IO_L18N_T2U_N11_AD2N_D13_65


# Clock
set_property PACKAGE_PIN BK44     [get_ports "slr0_freerun_clk_clk_n"] ;# Bank  65 VCCO - VCC1V8   - IO_L11N_T1U_N9_GC_A11_D27_65
set_property IOSTANDARD  LVDS 	  [get_ports "slr0_freerun_clk_clk_n"] ;# Bank  65 VCCO - VCC1V8   - IO_L11N_T1U_N9_GC_A11_D27_65
set_property PACKAGE_PIN BK43     [get_ports "slr0_freerun_clk_clk_p"] ;# Bank  65 VCCO - VCC1V8   - IO_L11P_T1U_N8_GC_A10_D26_65
set_property IOSTANDARD  LVDS 	  [get_ports "slr0_freerun_clk_clk_p"] ;# Bank  65 VCCO - VCC1V8   - IO_L11P_T1U_N8_GC_A10_D26_65


set_property PACKAGE_PIN AL14     [get_ports "pcie_refclk_clk_n"] ;# Bank 227 - MGTREFCLK0N_227
set_property PACKAGE_PIN AL15     [get_ports "pcie_refclk_clk_p"] ;# Bank 227 - MGTREFCLK0P_227