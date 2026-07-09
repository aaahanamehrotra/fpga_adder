
`timescale 1ns / 1ps

module tb_fpga_adder;
    reg         clk;
    reg         rst_n;
    reg  [7:0]  i_a;
    reg  [7:0]  i_b;
    wire [8:0]  o_sum;

    // Instantiate the adder unit
    fpga_adder uut (
        .clk(clk),
        .rst_n(rst_n),
        .i_a(i_a),
        .i_b(i_b),
        .o_sum(o_sum)
    );

    // Generate a 100MHz clock signal
    always #5 clk = ~clk;

    initial begin
        // Tell the simulator to save signal changes to a file
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_fpga_adder);

        // Initialize inputs
        clk = 0;
        rst_n = 0;
        i_a = 0;
        i_b = 0;

        #20 rst_n = 1; // Release reset after 20ns

        // Feed test data
        @(posedge clk); i_a = 8'd45;  i_b = 8'd55;
        @(posedge clk); i_a = 8'd48;  i_b = 8'd34;
        @(posedge clk); i_a = 8'd200; i_b = 8'd100;

        #40;
        $finish;
    end
endmodule
