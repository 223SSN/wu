-makelib ies_lib/xil_defaultlib -sv \
  "E:/Xilinx/Vivado2018/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/Xilinx/Vivado2018/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "E:/Xilinx/Vivado2018/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_2 \
  "../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_2 \
  "../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_2 \
  "../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../../../src/ip/Fifo_In8x1024_Out8x1024/sim/Fifo_In8x1024_Out8x1024.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

