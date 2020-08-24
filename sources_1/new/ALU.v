`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 02:27:34 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(a, b, opcode, out, zero, neg);
    input [31:0] a;
    input [31:0] b;
    input [3:0] opcode;
    wire [31:0] nega;
    wire [31:0] muxaout;
    wire [31:0] muxbout;
    reg [1:0] muxasel;
    reg [1:0] muxbsel;
    output reg [31:0] out;
    output reg zero;
    output reg neg;
    //twoscomp two(a, nega);
    //mux muxa(a , 1, nega, 0, muxasel, muxaout);
    //mux muxb(b, 0, a, 0, muxbsel, muxbout);
    //fullbitadder add(muxaout, muxbout, out);
    always@ (a, b, opcode)
    begin

        if (opcode == 4'b0000) //ADD Instruction
        begin
            out = a + b;
            //muxasel = 2'b00; //passes a
            //muxbsel = 2'b00; //passes b
        end
        else if (opcode == 4'b0001) //INCREMENT B Instruction
        begin
            out = a + 1;
            //muxasel = 2'b01; //passes 1
            //muxbsel = 2'b10; //passes a
        end
        else if (opcode == 4'b0010) //NEGATE A Instruction
        begin
            //muxasel = 2'b10; //passes neg a
            //muxbsel = 2'b01;//passes 0
            out = ~a + 1;
        end
        else if (opcode == 4'b0011) //SUB A from B Instruction
        begin
            //muxasel = 2'b10;//passes neg a
            //muxbsel = 2'b00;//passes b
            out = a + (~b + 1);
        end
        else if (opcode == 4'b0100)//PASS a 
        begin
            //muxasel = 2'b00;//passes a
            //muxbsel = 2'b01;//passes 0
            out = a;
        end
         //feeds whatever a and b are to ALU
        
    end
    
    
    
    always@ (out)
    begin
        if (opcode != 4'b0100) begin
            if (out == 32'd0) zero = 1;
            else zero = 0;
            if (out[31] == 1) neg = 1;
            else neg = 0;
        end
    /*
        zero = 0;
        neg = 0;
        if (out == 0)
        begin
            zero = 1;
        end
        else if (out[31] == 1)
        begin
            neg = 1;
        end*/
    end  
endmodule
