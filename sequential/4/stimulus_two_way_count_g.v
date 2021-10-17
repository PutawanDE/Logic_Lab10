`include "two_way_count_g.v"

module stimulus_two_way_count_g;
    reg x;
    reg clk, reset;
    wire [1:0]q;

    wire l;
    assign L = l;

    two_way_count_g c0(q, l, x, clk, reset);

    initial begin
		$dumpfile("two_way_count_g.vcd");
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
		$monitor($time, " output L = %d  q = %d (%d%d) reset = %d x = %d",L, q, q[1], q[0], reset, x);
endmodule