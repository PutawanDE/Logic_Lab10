`include "two_way_count.v"

module stimulus_two_way_count;
    reg x;
    reg clk, reset;
    wire [1:0]q;

    two_way_count c0(q, x, clk, reset);

    initial begin
		$dumpfile("two_way_count.vcd");
        $dumpvars(0, c0);
		clk = 1'b0;
        x = 1'b0;
        reset = 1'b0;
	end
	always
		#5	clk = ~clk;
    // TODO: Test two count
	initial begin
        // x = 1'b0;
reset = 1'b1;
x = 1'b0;
#50 reset = 1'b0;
#50 x = 1'b1;
#0 reset = 1'b1;
#25 reset = 1'b0;
#50 reset = 1'b0;
#50 $finish;
	end
	
	initial
		$monitor($time, " input: x=%d reset=%d output: q=%d", x, reset, q);
endmodule