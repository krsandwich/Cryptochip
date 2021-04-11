# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Sun Apr 4 19:23:47 2021
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 19 signals
# End_DVE_Session_Save_Info

# DVE version: Q-2020.03-SP2_Full64
# DVE build date: Sep  1 2020 20:47:52


#<Session mode="View" path="/home/users/krzanich/EE272B/AES/design/my_awesome_wave.tcl" type="Debug">

#<Database>

gui_set_time_units 1ps
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Sun Apr 4 19:23:47 2021
# 19 signals
# End_DVE_Session_Save_Info

# DVE version: Q-2020.03-SP2_Full64
# DVE build date: Sep  1 2020 20:47:52


#Add ncecessay scopes
gui_load_child_values {AESTb.AESEncrypt_inst.AddRoundKey}
gui_load_child_values {AESTb.AESEncrypt_inst}
gui_load_child_values {AESTb.AESEncrypt_inst.SubBytes}
gui_load_child_values {AESTb.AESEncrypt_inst.ShiftRows}
gui_load_child_values {AESTb.AESEncrypt_inst.MixColumns}
gui_load_child_values {AESTb}

gui_set_time_units 1ps

set _wave_session_group_1 Group1
if {[gui_sg_is_group -name "$_wave_session_group_1"]} {
    set _wave_session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_1"

gui_sg_addsignal -group "$_wave_session_group_1" { {V1:AESTb.AESEncrypt_inst.AddRoundKey.in} {V1:AESTb.AESEncrypt_inst.AddRoundKey.key} {V1:AESTb.AESEncrypt_inst.AddRoundKey.out} {V1:AESTb.clk} {V1:AESTb.reset} {V1:AESTb.ready} {V1:AESTb.data_in} {V1:AESTb.data_out} {V1:AESTb.AESEncrypt_inst.key} {V1:AESTb.valid} {V1:AESTb.AESEncrypt_inst.state} {V1:AESTb.AESEncrypt_inst.round} {V1:AESTb.AESEncrypt_inst.MixColumns.in} {V1:AESTb.AESEncrypt_inst.MixColumns.out} {V1:AESTb.AESEncrypt_inst.encrypt_state} {V1:AESTb.AESEncrypt_inst.SubBytes.in} {V1:AESTb.AESEncrypt_inst.SubBytes.out} {V1:AESTb.AESEncrypt_inst.ShiftRows.in} {V1:AESTb.AESEncrypt_inst.ShiftRows.out} }
if {![info exists useOldWindow]} { 
	set useOldWindow true
}
if {$useOldWindow && [string first "Wave" [gui_get_current_window -view]]==0} { 
	set Wave.1 [gui_get_current_window -view] 
} else {
	set Wave.1 [lindex [gui_get_window_ids -type Wave] 0]
if {[string first "Wave" ${Wave.1}]!=0} {
gui_open_window Wave
set Wave.1 [ gui_get_current_window -view ]
}
}

set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 249736
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_select -id ${Wave.1} {AESTb.AESEncrypt_inst.key }
gui_seek_criteria -id ${Wave.1} {Any Edge}


gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group1}  -item {AESTb.AESEncrypt_inst.key[255:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 202248
gui_view_scroll -id ${Wave.1} -vertical -set 133
gui_show_grid -id ${Wave.1} -enable false
#</Session>

