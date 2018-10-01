#=========================================================================
# pre_synth.tcl
#=========================================================================
# This plug-in script is called before synthesis
#
# Author : Christopher Torng
# Date   : May 14, 2018

# Number of cores for multicore optimization

set dc_num_cores 16

# Add more link libraries (e.g., IO cells, hierarchical blocks)

set dc_extra_link_libraries  [join "
                                 iocells.db
                                 [glob -nocomplain $dc_collect_dir/*tt*.db]
                                 [glob /work/global/clt67/brgtc2-pin/pll*.db]
                             "]

# Enable additional area optimizations (skip false = enable optimizations)

set DC_SKIP_OPTIMIZE_NETLIST false

# Enable clock-gating

set DC_GATE_CLOCK true

# DC flatten effort
#
# - Effort 0: No auto-ungrouping / boundary optimizations (strict hierarchy)
# - Effort 1: No auto-ungrouping / boundary optimizations
#             DesignWare cells are ungrouped (var compile_ultra_ungroup_dw)
# - Effort 2: Enable auto-ungrouping / boundary optimizations
#             DesignWare cells are ungrouped (var compile_ultra_ungroup_dw)
# - Effort 3: Everything ungrouped + level param for how deep to ungroup
#
# Note that even with boundary optimizations off, DC will still propagate
# constants across the boundary, although this can be disabled with a
# variable if we really wanted to disable it.

set DC_FLATTEN_EFFORT 0

# When boundary optimizations are off, set this variable to true to still
# allow unconnected registers to be removed.

set compile_optimize_unloaded_seq_logic_with_no_bound_opt true

