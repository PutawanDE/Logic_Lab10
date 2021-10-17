`include "adder.v"
`include "mux4_1.v"

module one_bit_ALU (y, z, Cin, A, B, c1, c0);
    input Cin, A, B, c1, c0;
    output y, z;

    wire w_Sum, w_Cout;
    wire w_A0, w_N0, w_xr0;

    adder Adder1(w_Sum, w_Cout, Cin, A, B);
    and A0(w_A0, A, B);
    not N0(w_N0, A);
    xor xr0(w_xr0, A, B);

    mux4_1 mux1(y, w_Sum, w_A0, w_N0, 1'b0, c1, c0);
    mux4_1 mux2(z, w_Cout, 1'b0, 1'b0, w_xr0, c1, c0);
endmodule