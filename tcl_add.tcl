open_project [pwd]/Automation/Test.xpr
update_compile_order -fileset sources_1 

add_files -norecurse [pwd]/Modules/top_W_2R1_Reg_file.sv

update_compile_order -fileset sources_1

close_project
