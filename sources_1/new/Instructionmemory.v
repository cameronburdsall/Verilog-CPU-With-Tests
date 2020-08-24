module instructionmemory (clk, addrs, out);
    input clk;
    input [7:0] addrs;
    output reg [31:0] out;
    wire [31:0] instructions [255:0];
    
    //INSTRUCTIONS
    //Somehow instructions that I had completed got erased........
    
    //Label should be difference of current to desired mem location
    
    assign instructions [0] = 32'b11110000010000000000000011111111;//LDPC R1 0xFF (100 is too big, needs to be able to be incremented
    assign instructions [1] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [2] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [3] = 32'b01010000100000010000000000000000; //INC R2 R1 //should be 0x0100
    assign instructions [4] = 32'b01100000110000010000000000000000; //NEG R3 R1 
    assign instructions [5] = 32'b11110010100000000000000000001000;//LDPC R10 label1
    assign instructions [6] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [7] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [8] = 32'b10110000000010100000000000000000; //BRN R10
    assign instructions [9] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [10] = 32'b00000000000000000000000000000000;//NO Op
    assign instructions [11] = 32'b00000000000000000000000000000000;//NO Op
    assign instructions [12] = 32'b01010000100000100000000000000000; //INC R2 R2
    assign instructions [13] = 32'b00110000000000010000010000000000; //ST R1 R1          LABEL 1
    assign instructions [14] = 32'b00000000000000000000000000000000;//NO Op
    assign instructions [15] = 32'b00000000000000000000000000000000;//NO Op
    assign instructions [16] = 32'b11100001000000010000000000000000; //LD R4 R1
    assign instructions [17] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [18] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [19] = 32'b01000001010000010000100000000000; //ADD R5 R1
    assign instructions [20] = 32'b01110001100001000000010000000000; //SUb R6 R4 R1
    assign instructions [21] = 32'b11110010110000000000000000001000; //LDPC R11 Label2
    assign instructions [22] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [23] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [24] = 32'b10010000000010110000000000000000;//BRZ R11
    assign instructions [25] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [26] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [27] = 32'b00000000000000000000000000000000;//NO Op
    assign instructions [28] = 32'b01010000100000100000000000000000;//INC R2 R2
    assign instructions [29] = 32'b10100000000000010000000000000000;//JM R1             LABEL 2
    assign instructions [30] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [31] = 32'b00000000000000000000000000000000;//NO OP
    assign instructions [32] = 32'b00000000000000000000000000000000;//NO OP
    //assign instructions [33] = 32'b10000000000000010000000000000000;//J R1
    //END INSTRUCTIONS
    
    
    always@ (negedge clk) begin
        out = instructions [addrs];
    end
endmodule