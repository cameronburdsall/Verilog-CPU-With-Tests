`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2019 03:08:37 PM
// Design Name: 
// Module Name: IFID
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


module IFID(instruction, addrs, clk, instruction_out, addrs_out);
    input clk;
    input [31:0] instruction;
    input [31:0] addrs;
    output reg [31:0] instruction_out;
    output reg [31:0] addrs_out;
    always @(posedge clk) begin //passes through values to align execution times
        instruction_out = instruction;
        addrs_out = addrs;
    end
endmodule
