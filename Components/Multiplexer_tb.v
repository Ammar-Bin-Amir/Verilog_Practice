`timescale 1ns/1ns
`include "Multiplexer.v"

module mux_tb;
    
    reg [3:0] in;
    reg [1:0] sel;
    wire out;

    mux uut(in,sel,out);

    initial begin
        $dumpfile("Multiplexer_tb.vcd");
        $dumpvars(0,mux_tb);
    end

    initial begin
        for (integer i = 0; i < 4; i = i + 1) begin
            #5 in = $random; sel = i;
        end
        #10 $finish;
    end

    initial $monitor("in=%b sel=%b out=%b", in, sel, out);

endmodule