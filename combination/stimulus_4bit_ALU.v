`include "4bitALU.v"

module stimulus_4bit_ALU;
    wire [3:0] y;
    wire z;

    reg [3:0] a;
    reg [3:0] b;

    reg c1, c0;

    four_bit_ALU four_bit_ALU(y, z, a, b, c1, c0);

    initial begin
        $dumpfile("4bitALU_TimingDiagram.vcd");
        $dumpvars(0, four_bit_ALU);
        a = 1'b0;
        b = 1'b0;
        c1 = 1'b0;
        c0 = 1'b0;
    end

    initial begin        
        repeat(8) begin
            b = 1'b0;
            repeat(8) begin
                #5 b = b + 1'b1;    
            end
            #5 a = a + 1'b1;
        end
        #5 a = a + 1'b1;
        a = 1'b0;

        c0 = 1'b1;
        repeat(8) begin
            b = 1'b0;
            repeat(8) begin
                #5 b = b + 1'b1;    
            end
            #5 a = a + 1'b1;
        end
        #5 a = a + 1'b1;
        a = 1'b0;

        c1 = 1'b1;
        c0 = 1'b0;
        repeat(8) begin
            b = 1'b0;
            repeat(8) begin
                #5 b = b + 1'b1;    
            end
            #5 a = a + 1'b1;
        end
        #5 a = a + 1'b1;
        a = 1'b0;

        c0 = 1'b1;
        repeat(8) begin
            b = 1'b0;
            repeat(8) begin
                #5 b = b + 1'b1;    
            end
            #5 a = a + 1'b1;
        end
        #5 a = a + 1'b1;
        
        #1200 $finish;
    end

    initial
        $monitor($time, " Output c1=%d, c0=%d, a=%b=%d, b=%b=%d, y=%b=%d, z=%d", c1, c0, a, a, b, b, y, y, z);
endmodule
