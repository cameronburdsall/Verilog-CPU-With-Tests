`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 02:26:51 PM
// Design Name: 
// Module Name: ProgramCounter
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


 module ProgramCounter(in, clk, out);
    input [7:0] in;
    input clk;
    output reg [31:0] out;
    
    initial begin
        out = 0;
    end
    
    always@ (negedge clk) begin
        if (in) begin
            out = in;
        end
    end
endmodule
