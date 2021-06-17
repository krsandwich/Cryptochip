lef read inputs/dffram/RAM8.lef
lef read inputs/dffram/RAM32.lef
lef read inputs/dffram/RAM512.lef

gds read inputs/design_merged.gds

load $::env(design_name)

select top cell
feedback save ./outputs/antenna.feedback.txt

antennacheck debug
antennacheck

quit
