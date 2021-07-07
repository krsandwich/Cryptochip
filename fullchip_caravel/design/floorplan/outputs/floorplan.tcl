#=========================================================================
# floorplan.tcl
#=========================================================================
#
# Author : George 
# Date   : May 18, 2021

#-------------------------------------------------------------------------
# Floorplan
#-------------------------------------------------------------------------


# set core_aspect_ratio   1.00; # Aspect ratio 1.0 for a square chip
# set core_density_target 0.75; # Placement density of 70% is reasonable

set core_width  2770;  # Based on https://github.com/efabless/caravel_user_project/blob/main/lef/user_project_wrapper.lef
set core_height 3320;  # Based on https://github.com/efabless/caravel_user_project/blob/main/lef/user_project_wrapper.lef

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

# floorPlan -r $core_aspect_ratio $core_density_target \
#              $core_margin_l $core_margin_b $core_margin_r $core_margin_t


floorPlan -s $core_width $core_height \
             $core_margin_l $core_margin_b $core_margin_r $core_margin_t

############ RAM512  ############ 860.200 BY 794.240
placeInstance chiptop_system_spad_mem_mem_ext_dffram_genblk1_width_macro_0__dffram 70.0 2508.0
placeInstance chiptop_system_spad_mem_mem_ext_dffram_genblk1_width_macro_1__dffram 70.0 1633.0
createPlaceBlockage -inst chiptop_system_spad_mem_mem_ext_dffram_genblk1_width_macro_0__dffram -outerRingBySide "20 20 20 20"
createPlaceBlockage -inst chiptop_system_spad_mem_mem_ext_dffram_genblk1_width_macro_1__dffram -outerRingBySide "20 20 20 20"
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 71 2509 928.2 3300.2 -exceptpgnet
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 71 1634 928.2 2425.2 -exceptpgnet

############ RAM8  ############ 399.280 BY 32.640
placeInstance chiptop_system_tile_prci_domain_tile_reset_domain/tile_dcache/tag_array_tag_array_ext_dffram_genblk1_width_macro_0__dffram 1768.0 419.0
createPlaceBlockage -inst chiptop_system_tile_prci_domain_tile_reset_domain/tile_dcache/tag_array_tag_array_ext_dffram_genblk1_width_macro_0__dffram -outerRingBySide "20 20 20 20"
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 1769 420 2165.28 450.64 -exceptpgnet

############ RAM32  ############ 409.860 BY 106.080 
placeInstance chiptop_system_tile_prci_domain_tile_reset_domain/tile_dcache/data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 1768 244.0 
placeInstance chiptop_system_tile_prci_domain_tile_reset_domain/tile_dcache/data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 2274.0 244.0 
placeInstance chiptop_system_tile_prci_domain_tile_reset_domain/tile_dcache/data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram 1768 88.0 
placeInstance chiptop_system_tile_prci_domain_tile_reset_domain/tile_dcache/data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram 2274.0 88.0
createPlaceBlockage -inst chiptop_system_tile_prci_domain_tile_reset_domain/tile_dcache/data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "20 20 20 20"
createPlaceBlockage -inst chiptop_system_tile_prci_domain_tile_reset_domain/tile_dcache/data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "20 20 20 20"
createPlaceBlockage -inst chiptop_system_tile_prci_domain_tile_reset_domain/tile_dcache/data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_1__depth_macro_0__dffram -outerRingBySide "20 20 20 20"
createPlaceBlockage -inst chiptop_system_tile_prci_domain_tile_reset_domain/tile_dcache/data_data_arrays_0_data_arrays_0_ext_dffram_genblk1_width_macro_1__depth_macro_1__dffram -outerRingBySide "20 20 20 20"
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 1769 245 2175.86 348.08 -exceptpgnet
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 2275 245 2681.86 348.08 -exceptpgnet
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 1769 89 2175.86 192.08 -exceptpgnet
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 2275 89 2681.86 192.08 -exceptpgnet

############ RAM8  ############ 399.280 BY 32.640
placeInstance chiptop_system_tile_prci_domain_tile_reset_domain/tile_frontend/icache_tag_array_tag_array_0_ext_dffram_genblk1_width_macro_0__dffram 70.0 419.0
createPlaceBlockage -inst chiptop_system_tile_prci_domain_tile_reset_domain/tile_frontend/icache_tag_array_tag_array_0_ext_dffram_genblk1_width_macro_0__dffram -outerRingBySide "20 20 20 20"
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 71 420 468.28 450.64 -exceptpgnet

############ RAM32  ############ 409.860 BY 106.080 
placeInstance chiptop_system_tile_prci_domain_tile_reset_domain/tile_frontend/icache_data_arrays_1_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 77.0 244.0
placeInstance chiptop_system_tile_prci_domain_tile_reset_domain/tile_frontend/icache_data_arrays_1_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 583 244.0
placeInstance chiptop_system_tile_prci_domain_tile_reset_domain/tile_frontend/icache_data_arrays_0_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram 77.0 88.0
placeInstance chiptop_system_tile_prci_domain_tile_reset_domain/tile_frontend/icache_data_arrays_0_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram 583 88.0 
createPlaceBlockage -inst chiptop_system_tile_prci_domain_tile_reset_domain/tile_frontend/icache_data_arrays_1_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "20 20 20 20"
createPlaceBlockage -inst chiptop_system_tile_prci_domain_tile_reset_domain/tile_frontend/icache_data_arrays_1_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "20 20 20 20"
createPlaceBlockage -inst chiptop_system_tile_prci_domain_tile_reset_domain/tile_frontend/icache_data_arrays_0_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_0__dffram -outerRingBySide "20 20 20 20"
createPlaceBlockage -inst chiptop_system_tile_prci_domain_tile_reset_domain/tile_frontend/icache_data_arrays_0_data_arrays_0_0_ext_dffram_genblk1_width_macro_0__depth_macro_1__dffram -outerRingBySide "20 20 20 20"
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 78 245 484.86 348.08 -exceptpgnet
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 584 245 990.86 348.08  -exceptpgnet
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 78 89 484.86 192.08 -exceptpgnet
createRouteBlk -layer {met1 met2 met3 met4 met5 li} -box 584 89 990.86 192.08 -exceptpgnet


snapFPlan -macro

addHaloToBlock -allBlock 20 20 20 20
