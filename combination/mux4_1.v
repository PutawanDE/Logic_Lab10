module mux4_1 (y, x0, x1, x2, x3, c1, c0);
    input x0, x1, x2, x3, c1, c0;
    output y;
    
    wire w_A0, w_A1, w_A2, w_A3;
    wire w_r0, w_r2;

    wire w_N1, w_N0;

    not N1(w_N1, c1);
    not N0(w_N0, c0);

    and A0(w_A0, x0, w_N1, w_N0);
    and A1(w_A1, x1, w_N1, c0);
    and A2(w_A2, x2, c1, w_N0);
    and A3(w_A3, x3, c1, c0);

    or r0(w_r0, w_A0, w_A1);
    or r2(w_r2, w_A2, w_A3);
    or r3(y, w_r0, w_r2);
endmodule