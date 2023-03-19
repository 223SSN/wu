# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7k325tffg900-3

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir F:/image_process/Sobel/prj/prj/prj.cache/wt [current_project]
set_property parent.project_path F:/image_process/Sobel/prj/prj/prj.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo f:/image_process/Sobel/prj/prj/prj.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  F:/image_process/Sobel/src/CalCore.v
  F:/image_process/Sobel/src/Matrix.v
  F:/image_process/Sobel/src/PluseDection.v
  F:/image_process/Sobel/src/Sobel.v
}
read_ip -quiet f:/image_process/Sobel/src/ip/Fifo_In8x1024_Out8x1024/Fifo_In8x1024_Out8x1024.xci
set_property used_in_implementation false [get_files -all f:/image_process/Sobel/src/ip/Fifo_In8x1024_Out8x1024/Fifo_In8x1024_Out8x1024.xdc]
set_property used_in_implementation false [get_files -all f:/image_process/Sobel/src/ip/Fifo_In8x1024_Out8x1024/Fifo_In8x1024_Out8x1024_clocks.xdc]
set_property used_in_implementation false [get_files -all f:/image_process/Sobel/src/ip/Fifo_In8x1024_Out8x1024/Fifo_In8x1024_Out8x1024_ooc.xdc]

read_ip -quiet f:/image_process/Sobel/src/ip/Square_Root/Square_Root.xci
set_property used_in_implementation false [get_files -all f:/image_process/Sobel/src/ip/Square_Root/Square_Root_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Sobel -part xc7k325tffg900-3


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Sobel.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Sobel_utilization_synth.rpt -pb Sobel_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]