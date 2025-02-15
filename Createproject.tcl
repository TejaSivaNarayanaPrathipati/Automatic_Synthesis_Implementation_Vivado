set timestamp [clock format [clock seconds] -format "%Y%m%d_%H%M%S"]

set project_name "TEST_$timestamp"
set pwd [pwd]
set project_path "$pwd/Projects/$project_name"

#xhub::refresh_catalog [xhub::get_xstores xilinx_board_store]
#xhub::install [xhub::get_xitems -of_objects [xhub::get_xstores xilinx_board_store]]
#xhub::update [xhub::get_xitems -of_objects [xhub::get_xstores xilinx_board_store]]

create_project $project_name $project_path -part xc7a35tcpg236-1
#set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]

set fp [open "$pwd/ProjectInformation/output.log" w]
close $fp

# Try setting the board again
set board_name "digilentinc.com:basys3:part0:1.1"
if {[lsearch [get_board_parts] $board_name] != -1} {
    set_property board_part $board_name [current_project]
} else {

    set fp [open "$pwd/ProjectInformation/output.log" a]
    puts $fp "Warning: Board not found! Using FPGA part instead."
    close $fp
    
}

set file [open "$pwd/ProjectInformation/project_info.txt" w]
puts $file "$project_name"
puts $file "$project_path"
close $file

#puts "Project '$project_name' created at $project_path"

set fp [open "$pwd/ProjectInformation/output.log" a]
puts $fp "Project '$project_name' is created at '$project_path' "
close $fp