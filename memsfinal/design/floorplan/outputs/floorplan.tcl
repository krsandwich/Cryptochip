#=========================================================================
# floorplan.tcl
#=========================================================================
#
# Author : George 
# Date   : April 4, 2021

#-------------------------------------------------------------------------
# Floorplan
#-------------------------------------------------------------------------

set pwr_net_list {VDD VSS}; # List of power nets in the core power ring

set M1_min_width   [dbGet [dbGetLayerByZ 1].minWidth]
set M1_min_spacing [dbGet [dbGetLayerByZ 1].minSpacing]

set savedvars(p_ring_width)   [expr 48 * $M1_min_width];   # Arbitrary!
set savedvars(p_ring_spacing) [expr 24 * $M1_min_spacing]; # Arbitrary!

#-------------------------------------------------------------------------
# Floorplan
#-------------------------------------------------------------------------

# Calling floorPlan with the "-r" flag sizes the floorplan according to
# the core aspect ratio and a density target (70% is a reasonable
# density).
#
set core_aspect_ratio   1.0; # Aspect ratio 1.0 for a square chip
set core_density_target 0.75; # Placement density of 70% is reasonable

floorPlan -r $core_aspect_ratio $core_density_target

setFlipping ss

planDesign 


# system/spad/mem/mem_ext/dffram/genblk1_width_macro_0__depth_macro_1__sram
# system/tile_prci_domain/tile_reset_domain/tile/ptw/l2_tlb_ram/l2_tlb_ram_ext/dffram/genblk1_width_macro_0__depth_macro_1__sram
# system/tile_prci_domain/tile_reset_domain/tile/frontend/icache/data_arrays_1/data_arrays_0_0_ext/dffram/genblk1_width_macro_0__depth_macro_0__sram
# system/tile_prci_domain/tile_reset_domain/tile/dcache/data/data_arrays_0/data_arrays_0_ext/dffram/genblk1_width_macro_1__depth_macro_1__sram

