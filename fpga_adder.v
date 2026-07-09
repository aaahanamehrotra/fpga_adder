module fpga_adder (
    input  wire       clk,        // Clock signal
    input  wire       rst_n,      // Active-low Reset
    input  wire [7:0] i_a,        // 8-bit Input A
    input  wire [7:0] i_b,        // 8-bit Input B
    output reg  [8:0] o_sum       // 9-bit Output Sum
);

    reg [7:0] a_reg;
    reg [7:0] b_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_reg <= 8'h0;
            b_reg <= 8'h0;
            o_sum <= 9'h0;
        end else begin
            a_reg <= i_a;
            b_reg <= i_b;
            o_sum <= a_reg + b_reg; // Adder logic
        end
    end
endmodule
