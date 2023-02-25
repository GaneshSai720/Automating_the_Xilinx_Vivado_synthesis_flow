create_project -force Test [pwd]/Automation -part xc7k325tffg900-2 
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
update_compile_order -fileset sources_1 

foreach module_name $argv {
    add_files -norecurse $module_name
        update_compile_order -fileset sources_1
}

close_project
