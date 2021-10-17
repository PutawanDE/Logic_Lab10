`include "D_FF.v"

module two_way_count(q, x, clk, reset);
    input x, clk, reset;
    output [1:0] q;
    
    wire w_xor0, w_xor1, w_not0;

    xor xor1(w_xor1, q[0], q[1]);
    xor xor0(w_xor0, x, w_xor1);
    D_FF D0(q[0], w_not0, clk, reset);

    not not0(w_not0, q[0]);
    D_FF D1(q[1], w_xor0, clk, reset);
endmodule