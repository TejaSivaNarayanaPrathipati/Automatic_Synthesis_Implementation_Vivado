set pwd [pwd]
set file [open "$pwd/ProjectInformation/project_info.txt" r]
set project_name [gets $file]
set project_path [gets $file]
close $file

open_project $project_path/$project_name.xpr

set fp [open "$pwd/ProjectInformation/output.log" a]
puts $fp "Opened Project for running : $project_path/$project_name.xpr"
close $fp


update_compile_order -fileset sources_1
set_property source_mgmt_mode None [current_project]

set_property top [string trimright [lindex $argv 0] ".v"] [current_fileset]

set_property source_mgmt_mode None [current_project]

update_compile_order -fileset sources_1

reset_run synth_1
launch_runs synth_1 -jobs 12
wait_on_run synth_1

reset_run impl_1
launch_runs impl_1 -jobs 12
wait_on_run impl_1

open_run impl_1

set foldername [string trimright [lindex $argv 0] ".v"] 


report_power        -file  "$pwd/Results/$foldername/power.txt" 
report_timing       -file  "$pwd/Results/$foldername/timing.txt"
report_utilization  -file  "$pwd/Results/$foldername/utilization.txt"

set fp [open "$pwd/ProjectInformation/output.log" a]
puts $fp "Opened Project for running : $project_path/$project_name.xpr"
puts $fp "Results are generated"
close $fp


update_compile_order -fileset sources_1

close_project