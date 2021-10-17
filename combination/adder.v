module adder (Sum, Cout, Cin, A, B);
    input Cin, A, B;
    output Sum, Cout;

    wire w_xr0, w_A0, w_A1;

    xor xr0(w_xr0, A, B);
    xor xr1 (Sum, Cin, w_xr0);

    and A0(w_A0, w_xr0, Cin);
    and A1(w_A1, A, B);

    or r0(Cout, w_A0, w_A1);
endmodule