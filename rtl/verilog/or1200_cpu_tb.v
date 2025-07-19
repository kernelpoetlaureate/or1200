`timescale 1ns / 1ps

module or1200_cpu_tb;

  // Clock and reset signals
  reg clk;
  reg rst;

  // Instantiate the CPU
  or1200_cpu uut (
    .clk(clk),
    .rst(rst),
    // Connect other ports as needed
    .ic_en(),
    .icpu_adr_o(),
    .icpu_cycstb_o(),
    .icpu_sel_o(),
    .icpu_tag_o(),
    .icpu_dat_i(32'b0),
    .icpu_ack_i(1'b0),
    .icpu_rty_i(1'b0),
    .icpu_err_i(1'b0),
    .icpu_adr_i(32'b0),
    .icpu_tag_i(4'b0),
    .immu_en(),
    .id_void(),
    .id_insn(),
    .ex_void(),
    .ex_insn(),
    .ex_freeze(),
    .wb_insn(),
    .wb_freeze(),
    .id_pc(),
    .ex_pc(),
    .wb_pc(),
    .branch_op(),
    .spr_dat_npc(),
    .rf_dataw(),
    .ex_flushpipe(),
    .du_stall(1'b0),
    .du_addr(32'b0),
    .du_dat_du(32'b0),
    .du_read(1'b0),
    .du_write(1'b0),
    .du_except_stop(),
    .du_flush_pipe(1'b0),
    .du_except_trig(),
    .du_dsr(32'b0),
    .du_dmr1(25'b0),
    .du_hwbkpt(1'b0),
    .du_hwbkpt_ls_r(1'b0),
    .du_dat_cpu(),
    .du_lsu_store_dat(),
    .du_lsu_load_dat(),
    .abort_mvspr(1'b0),
    .abort_ex(1'b0),
    .dc_en(),
    .dcpu_adr_o(),
    .dcpu_cycstb_o(),
    .dcpu_we_o(),
    .dcpu_sel_o(),
    .dcpu_tag_o(),
    .dcpu_dat_o(),
    .dcpu_dat_i(32'b0),
    .dcpu_ack_i(1'b0),
    .dcpu_rty_i(1'b0),
    .dcpu_err_i(1'b0),
    .dcpu_tag_i(4'b0),
    .sb_en(),
    .dmmu_en(),
    .dc_no_writethrough(),
    .boot_adr_sel_i(1'b0),
    .sig_int(1'b0),
    .sig_tick(1'b0),
    .supv(),
    .spr_addr(),
    .spr_dat_cpu(),
    .spr_dat_pic(32'b0),
    .spr_dat_tt(32'b0),
    .spr_dat_pm(32'b0),
    .spr_dat_dmmu(32'b0),
    .spr_dat_immu(32'b0),
    .spr_dat_du(32'b0),
    .spr_cs(),
    .spr_we(),
    .mtspr_dc_done(1'b0)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Testbench logic
  initial begin
    // Initialize signals
    clk = 0;
    rst = 1;

    // Apply reset
    #10 rst = 0;

    // Add stimulus here
    // Example: Load instructions into memory, drive inputs, etc.

    // Finish simulation
    #100 $finish;
  end

endmodule
