lef read inputs/adk/stdcells.lef
lef read inputs/dffram/RAM8.lef
lef read inputs/dffram/RAM32.lef
lef read inputs/dffram/RAM512.lef
cif istyle sky130(vendor)
gds order true
gds noduplicates true
gds read ./inputs/design_merged.gds
load $::env(design_name)
select top cell
extract no all
extract do local
extract unique
extract
ext2spice lvs
ext2spice $::env(design_name).ext
exit
