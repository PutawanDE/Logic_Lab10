`include "1bit_ALU.v"

module stimulus_1bit_ALU;
    reg Cin, A, B;
    reg c1, c0;

    wire y;
    wire z;

    // instantiate the design block
    one_bit_ALU one_bit_ALU(y, z, Cin, A, B, c1, c0);

    // control the signals that drives the design block
    initial begin
        $dumpfile("1bitALU_TimingDiagram.vcd");
        $dumpvars(0, one_bit_ALU);
        Cin = 1'b0;
        A = 1'b0;
        B = 1'b0;
        c1 = 1'b0;
        c0 = 1'b0;

        // 0+0+0
        #5 begin
            A = 1'b0;
            B = 1'b0;
            Cin = 1'b0;
        end
        // 0+0+1
        #5 begin
            A = 1'b0;
            B = 1'b0;
            Cin = 1'b1;    
        end
        // 0+1+0
        #5 begin
            A = 1'b0;
            B = 1'b1;
            Cin = 1'b0;    
        end
        // 0+1+1
        #5 begin
            A = 1'b0;
            B = 1'b1;
            Cin = 1'b1;
        end
        // 1+0+0
        #5 begin
            A = 1'b1;
            B = 1'b0;
            Cin = 1'b0;
        end
        // 1+0+1
        #5 begin
            A = 1'b1;
            B = 1'b0;
            Cin = 1'b1;
        end
        // 1+1+0
        #5 begin
            A = 1'b1;
            B = 1'b1;
            Cin = 1'b0;
        end
        // 1+1+1
        #5 begin
            A = 1'b1;
            B = 1'b1;
            Cin = 1'b1;
        end

        #5 c0 = 1'b1;

        #5 begin
           A = 1'b0;
           B = 1'b0;
        end

        #5 begin
           A = 1'b0;
           B = 1'b1;
        end

        #5 begin
            A = 1'b1;
            B = 1'b0;
        end
        
        #5 begin
            c1 = 1'b1;
            c0 = 1'b0;
        end
       #5 begin
            A = 1'b0;
            B = 1'b0;
        end
        #5 begin
            A = 1'b0;
            B = 1'b1;
        end
        #5 begin
            A = 1'b1;
            B = 1'b0;
        end
        #5 begin
            A = 1'b1;
            B = 1'b1;
        end
        
        #5 c0 = 1'b1;
        #5 begin
            A = 1'b0;
            B = 1'b0;
        end
        #5 begin
            A = 1'b0;
            B = 1'b1;
        end
        #5 begin
            A = 1'b1;
            B = 1'b0;
        end
        #5 begin
            A = 1'b1;
            B = 1'b1;
        end

        #120 $finish;
    end

    initial
        $monitor($time, " Output Cin=%d A=%d B=%d c1=%d c0=%d y=%d z=%d", 
        Cin, A, B, c1, c0, y, z);
endmodule