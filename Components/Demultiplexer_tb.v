`timescale 1ns/1ns
`include "Demultiplexer.v"

module demux_tb;
    
    reg in;
    reg [1:0] sel;
    wire [3:0] out;

    demux uut(in,sel,out);

    initial begin
        $dumpfile("Demultiplexer_tb.vcd");
        $dumpvars(0,demux_tb);
    end

    initial begin
        for (integer i = 0; i < 4; i = i + 1) begin
            #5 in = $random; sel = i;
        end
        #10 $finish;
    end

    initial $monitor("in=%b sel=%b out=%b", in, sel, out);

endmodule