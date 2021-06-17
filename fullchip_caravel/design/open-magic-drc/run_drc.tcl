# Adapted from Caravel: https://github.com/efabless/caravel/blob/master/gds/drc_on_gds.tcl


# Read design
gds read inputs/design_merged.gds

set fout [open ./$::env(design_name).drc w]
set oscale [cif scale out]

load $::env(design_name)

select top cell
drc euclidean on
drc style drc(full)
drc check

set drcresult [drc listall why]
set count 0
puts $fout "$::env(design_name)"
puts $fout "----------------------------------------"
foreach {errtype coordlist} $drcresult {
    puts $fout $errtype
    puts $fout "----------------------------------------"
    foreach coord $coordlist {
        set bllx [expr {$oscale * [lindex $coord 0]}]
        set blly [expr {$oscale * [lindex $coord 1]}]
        set burx [expr {$oscale * [lindex $coord 2]}]
        set bury [expr {$oscale * [lindex $coord 3]}]
        set coords [format " %.3f %.3f %.3f %.3f" $bllx $blly $burx $bury]
        puts $fout "$coords"
        set count [expr {$count + 1} ]
    }
    puts $fout "----------------------------------------"
}

puts $fout "\[INFO\]: COUNT: $count"
puts $fout "\[INFO\]: Should be divided by 3 or 4"

puts $fout ""
close $fout

save ./$::env(design_name).drc.drc.mag

quit