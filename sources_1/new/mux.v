`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SCU
// Engineer: Cameron Burdsall
// 
// Create Date: 10/03/2019 02:58:16 PM
// Design Name: 4-1 Mux
// Module Name: mux
// Project Name: Lab 1
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


module mux(d1,d2,d3,d4,sel,out);
    input [31:0] d1;
    input [31:0] d2;
    input [31:0] d3;
    input [31:0] d4;
    input [1:0] sel; 
    //input [1:0] sel;
    
    output reg [31:0] out;
    
always@ (d1, d2, d3, d4, sel)
begin
    if (sel == 2'b00)
        out = d1;
    else if (sel == 2'b01)
        out = d2;
    else if (sel == 2'b10)
        out = d3;
    else //if sel == 2'b11
        out = d4;
    end
endmodule
