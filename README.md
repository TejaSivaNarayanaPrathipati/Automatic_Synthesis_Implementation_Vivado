## Automatic_Synthesis_Implementation_Vivado
This repository automates the process of running **Vivado** in batch mode using Python and **TCL scripts**. It automates project creation, Verilog file addition, synthesis, implementation, and report generation.

##  Overview

The Python script invokes **Vivado HLS** using the **Vivado HLS Command Prompt** (Windows) and runs three TCL scripts:

1. **Project Creation** - Creates a Vivado project.
2. **Module Addition** - Adds Verilog files to the project.
3. **Synthesis & Reports** - Runs synthesis, implementation, and generates reports.

From these reports, we extract key parameters:
- **Data Path Delay** (from timing reports)
- **Slice LUTs** (from utilization reports)
- **Total On-Chip Power (W)** (from power reports)

##  Setup & Usage

### Prerequisites

System/server should have
- **Vivado installed** (Tested on Vivado 2019.2)
- **Python 3+ installed**
- **TCL scripts placed correctly** in the repository

### Folder structure 
```
📂 VivadoAutomation
 ├── 📂 ProjectInformation/
 │    ├── project_info.txt    # Stores project name & path
 │    ├── output.log          # Logs project execution
 │
 ├── 📂 Results/              # Stores power, timing, utilization reports
 │    ├── [Module_Folder]/
 │         ├── power.txt
 │         ├── timing.txt
 │         ├── utilization.txt
 │
 ├── scripting.py           # Python script to invoke Vivado & run TCL scripts
 ├── Createproject.tcl              # TCL script to create project
 ├── AddingModules.tcl        # TCL script to add Verilog files
 ├── Running.tcl     # TCL script for synthesis & report generation
 ├── README.md                # Project documentation

````
### Createproject.tcl

```
set timestamp [clock format [clock seconds] -format "%Y%m%d_%H%M%S"]           #For storing folders with name as time and date

set project_name "TEST_$timestamp"
set pwd [pwd]
set project_path "$pwd/Projects/$project_name"

#xhub::refresh_catalog [xhub::get_xstores xilinx_board_store]   
#xhub::install [xhub::get_xitems -of_objects [xhub::get_xstores xilinx_board_store]]  #Refreshing boards repository if required
#xhub::update [xhub::get_xitems -of_objects [xhub::get_xstores xilinx_board_store]]

create_project $project_name $project_path -part xc7a35tcpg236-1
#set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]

set fp [open "$pwd/ProjectInformation/output.log" w]
close $fp

# Try setting the board again                                                   #If board is missing continue with FPGA Part
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
```

### AddingModules.tcl

```
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
```

### Running.tcl

```
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
```

### Common Errors & Fixes
1. Delete the modules from the result which you are not using as these can cause file do not exist error in python
2. If running on windows make sure to add the following path in your path variables ``` C:\Xilinx\Vivado\2019.2\bin ```

   
