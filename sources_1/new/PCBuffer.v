`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 04:33:09 PM
// Design Name: 
// Module Name: PCBuffer
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


module PCBuffer(in, clk, out);
    input [31:0] in;
    input clk;
    output reg [31:0] out;
    always@ (negedge clk) begin
        out = in;
    end
endmodule
