lef read inputs/dffram/RAM32.lef
lef read inputs/dffram/RAM512.lef
lef read inputs/dffram/RAM8.lef
cif istyle sky130(vendor)
gds flatten true
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
