#=========================================================================
# floorplan.tcl
#=========================================================================
#
# Author : George 
# Date   : April 4, 2021

#-------------------------------------------------------------------------
# Floorplan
#-------------------------------------------------------------------------


set core_width  2920;  # Based on https://github.com/efabless/caravel_user_project/blob/main/lef/user_project_wrapper.lef
set core_height 3520;  # Based on https://github.com/efabless/caravel_user_project/blob/main/lef/user_project_wrapper.lef

set pwr_net_list {VDD VSS}; # List of power nets in the core power ring

set M1_min_width   [dbGet [dbGetLayerByZ 1].minWidth]
set M1_min_spacing [dbGet [dbGetLayerByZ 1].minSpacing]

set savedvars(p_ring_width)   [expr 48 * $M1_min_width];   # Arbitrary!
set savedvars(p_ring_spacing) [expr 24 * $M1_min_spacing]; # Arbitrary!

# Core bounding box margins

set core_margin_t [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]
set core_margin_b [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]
set core_margin_r [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]
set core_margin_l [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]

#-------------------------------------------------------------------------
# Floorplan
#-------------------------------------------------------------------------

# Calling floorPlan with the "-r" flag sizes the floorplan according to
# the core aspect ratio and a density target (70% is a reasonable
# density).
#
floorPlan -s $core_width $core_height \
             $core_margin_l $core_margin_b $core_margin_r $core_margin_t

setFlipping ss

# planDesign 
placeInstance system_spad_mem_mem_ext_dffram_genblk1_width_macro_0__dffram 70.0 2682.0
placeInstance system_spad_mem_mem_ext_dffram_genblk1_width_macro_1__dffram 70.0 1837.0
createPlaceBlockage -inst system_spad_mem_mem_ext_dffram_genblk1_width_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_spad_mem_mem_ext_dffram_genblk1_width_macro_1__dffram -outerRingBySide "10 10 10 10"


placeInstance system_tile_prci_domain_tile_reset_domain_tile/dcache_data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 141.0  1330.0
placeInstance system_tile_prci_domain_tile_reset_domain_tile/dcache_data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 555.0 1330.0
placeInstance system_tile_prci_domain_tile_reset_domain_tile/dcache_data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram 141.0  1185.0
placeInstance system_tile_prci_domain_tile_reset_domain_tile/dcache_data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram 555.0 1185.0
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/dcache_data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/dcache_data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/dcache_data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/dcache_data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram -outerRingBySide "10 10 10 10"

placeInstance system_tile_prci_domain_tile_reset_domain_tile/ptw/l2_tlb_ram_l2_tlb_ram_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 1902.2 396.0
placeInstance system_tile_prci_domain_tile_reset_domain_tile/ptw/l2_tlb_ram_l2_tlb_ram_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram 2332.2 396.0
placeInstance system_tile_prci_domain_tile_reset_domain_tile/ptw/l2_tlb_ram_l2_tlb_ram_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 1902.2 240.0
placeInstance system_tile_prci_domain_tile_reset_domain_tile/ptw/l2_tlb_ram_l2_tlb_ram_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram 2332.2 240.0
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/ptw/l2_tlb_ram_l2_tlb_ram_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/ptw/l2_tlb_ram_l2_tlb_ram_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/ptw/l2_tlb_ram_l2_tlb_ram_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/ptw/l2_tlb_ram_l2_tlb_ram_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram -outerRingBySide "10 10 10 10"

placeInstance system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_tag_array_tag_array_0_ext_dffram_genblk1_width_macro_0__dffram 141.0 673.0
placeInstance system_tile_prci_domain_tile_reset_domain_tile/dcache_tag_array_tag_array_ext_dffram_genblk1_width_macro_0__dffram 141.0  1092.0
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_tag_array_tag_array_0_ext_dffram_genblk1_width_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/dcache_tag_array_tag_array_ext_dffram_genblk1_width_macro_0__dffram -outerRingBySide "10 10 10 10"
# placeInstance system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_tag_array_tag_array_0_ext_dffram_genblk1_width_macro_1__dffram 1439.0 2440.0
# placeInstance system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_tag_array_tag_array_1_ext_dffram_genblk1_width_macro_0__dffram 1439.0 2295.0
# placeInstance system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_tag_array_tag_array_1_ext_dffram_genblk1_width_macro_1__dffram 1036.0 2295.0

placeInstance system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_data_arrays_1_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 141.0 923.0
placeInstance system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_data_arrays_1_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 555.0 923.0
placeInstance system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_data_arrays_0_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 555.0 773.0
placeInstance system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_data_arrays_0_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 141.0 773.0
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_data_arrays_1_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_data_arrays_1_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_data_arrays_0_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_tile_prci_domain_tile_reset_domain_tile/frontend/icache_data_arrays_0_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "10 10 10 10"

placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_0_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 1908.0 3360.5
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_0_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram 2332.2 3360.5
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_0_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 1908.0 3237.8
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_0_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram 2332.2 3237.8
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_0_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_0_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_0_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_0_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram -outerRingBySide "10 10 10 10"

placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_1_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 1908.0 3000.0
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_1_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram 2332.2 3000.0
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_1_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 1908.0 2852.3
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_1_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram 2332.2 2852.3
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_1_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_1_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_1_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_1_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram -outerRingBySide "10 10 10 10"

placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_2_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 1908.0 2647.5
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_2_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram 2332.2 2647.5
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_2_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 1908.0 2521.4
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_2_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram 2332.2 2521.4
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_2_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_2_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_2_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_2_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram -outerRingBySide "10 10 10 10"

placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_3_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 1908.0 2299.0
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_3_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram 2332.2 2299.0
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_3_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 1908.0 2152.0
placeInstance system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_3_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram 2332.2 2152.0
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_3_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_3_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_3_cc_banks_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "10 10 10 10"
createPlaceBlockage -inst system_subsystem_l2_wrapper_l2_mods_0/bankedStore_cc_banks_3_cc_banks_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram -outerRingBySide "10 10 10 10"


snapFPlan -macro

addHaloToBlock -allBlock 40 40 40 40
# placeInstance system_spad_mem_mem_ext_dffram_genblk1_width_macro_0__depth_macro_0__sram 154.163 2250.0
# placeInstance system_spad_mem_mem_ext_dffram_genblk1_width_macro_1__depth_macro_0__sram 892.585 2250.0
# placeInstance system_spad_mem_mem_ext_dffram_genblk1_width_macro_0__depth_macro_1__sram 154.163 2829.0
# placeInstance system_spad_mem_mem_ext_dffram_genblk1_width_macro_1__depth_macro_1__sram 892.585 2829.0
# placeInstance system_spad_mem_mem_ext_dffram_genblk1_width_macro_0__depth_macro_0__sram 144.538 2251.74
# placeInstance system_spad_mem_mem_ext_dffram_genblk1_width_macro_1__depth_macro_0__sram 1009.183 2258.569 
# placeInstance system_spad_mem_mem_ext_dffram_genblk1_width_macro_0__depth_macro_1__sram 154.163 2881.909
# placeInstance system_spad_mem_mem_ext_dffram_genblk1_width_macro_1__depth_macro_1__sram 996.818 2881.403


# system/spad/mem/mem_ext/dffram/genblk1_width_macro_0__depth_macro_1__sram
# system/tile_prci_domain/tile_reset_domain/tile/ptw/l2_tlb_ram/l2_tlb_ram_ext/dffram/genblk1_width_macro_0__depth_macro_1__sram
# system/tile_prci_domain/tile_reset_domain/tile/frontend/icache/data_arrays_1/data_arrays_0_0_ext/dffram/genblk1_width_macro_0__depth_macro_0__sram
# system/tile_prci_domain/tile_reset_domain/tile/dcache/data/data_arrays_0/data_arrays_0_ext/dffram/genblk1_width_macro_1__depth_macro_1__sram

