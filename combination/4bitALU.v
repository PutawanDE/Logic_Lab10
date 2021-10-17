`include "1bit_ALU.v"

module four_bit_ALU (
    y, z,
    a, b,
    c1, c0
);

    input [3:0] a;
    input [3:0] b;

    output [3:0] y;
    output z;

    input c1, c0;

    wire w_z0, w_z1, w_z2;

    one_bit_ALU ALU0(y[0], w_z0, 1'b0, a[0], b[0], c1, c0);
    one_bit_ALU ALU1(y[1], w_z1, w_z0, a[1], b[1], c1, c0);
    one_bit_ALU ALU2(y[2], w_z2, w_z1, a[2], b[2], c1, c0);
    one_bit_ALU ALU3(y[3], z, w_z2, a[3], b[3], c1, c0);

endmodule