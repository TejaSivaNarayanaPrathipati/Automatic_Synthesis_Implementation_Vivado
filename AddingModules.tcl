set pwd [pwd]
set file [open "$pwd/ProjectInformation/project_info.txt" r]
set project_name [gets $file]
set project_path [gets $file]
close $file



#open_project /home/teja24/ICDesignLab/TEST/TEST.xpr

open_project $project_path/$project_name.xpr

set fp [open "$pwd/ProjectInformation/output.log" a]
puts $fp "Opened Project : $project_path/$project_name.xpr"
close $fp

#puts "Opened Project : $project_path/$project_name.xpr"

add_files -norecurse "$pwd/Verilog_Files/[lindex $argv 0]"


update_compile_order -fileset sources_1

set file [open "$pwd/ProjectInformation/output.log" a]
puts $file "Added [lindex $argv 0]"
close $file

close_project