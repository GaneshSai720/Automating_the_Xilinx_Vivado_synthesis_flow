open_project [pwd]/Automation/Test.xpr
set_property source_mgmt_mode None [current_project]
update_compile_order -fileset sources_1	

set file_name [lindex $argv 0]
set suffix [file extension $file_name]
set file_name_no_suffix [string trimright $file_name $suffix]

set_property top $file_name_no_suffix [current_fileset]
update_compile_order -fileset sources_1

reset_run synth_1
launch_runs synth_1 -jobs 16

reset_run impl_1
launch_runs impl_1 -jobs 16


set x 0
while {$x !=1 } {
	if {[catch {open_run impl_1}]} { 
		set x 0 
		continue } \
	else { set x 1 }
}


report_power > Impl/$file_name_no_suffix/power.txt
report_timing > Impl/$file_name_no_suffix/timing.txt
report_utilization > Impl/$file_name_no_suffix/utilization.txt

close_project

