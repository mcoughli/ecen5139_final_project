# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z020clg484-1
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.0 [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
set_property ip_repo_paths /home/michael/ecen5139_final_project/project_1/project_1.srcs [current_fileset]
read_verilog -library xil_defaultlib -sv /home/michael/ecen5139_final_project/project_1/project_1.srcs/sources_1/imports/CAV_Midterm_PriorityQueue/gpqueue.sv
read_xdc /home/michael/ecen5139_final_project/project_1/project_1.srcs/constrs_1/imports/verilog/runQueue.xdc
set_property used_in_implementation false [get_files /home/michael/ecen5139_final_project/project_1/project_1.srcs/constrs_1/imports/verilog/runQueue.xdc]

set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/michael/ecen5139_final_project/project_1/project_1.cache/wt [current_project]
set_property parent.project_dir /home/michael/ecen5139_final_project/project_1 [current_project]
catch { write_hwdef -file pqueue.hwdef }
synth_design -top pqueue -part xc7z020clg484-1
write_checkpoint pqueue.dcp
report_utilization -file pqueue_utilization_synth.rpt -pb pqueue_utilization_synth.pb
