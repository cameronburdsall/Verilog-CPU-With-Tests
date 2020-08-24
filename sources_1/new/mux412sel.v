`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2019 03:09:51 PM
// Design Name: 
// Module Name: mux412sel
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


module mux412sel(d1,d2,d3,/*d4*/sel1, sel2, out);
    input [31:0] d1;
    input [31:0] d2;
    input [31:0] d3;
    //input [31:0] d4;
    input sel1, sel2; 
    //input [1:0] sel;
    
    output reg [31:0] out;
    
always@ (d1, d2, d3, sel1, sel2)
begin
    if (sel1 == 0 && sel2 == 0)//00
        out = d1;
    else if (sel1 ==0 && sel2 == 1)//01
        out = d2;
    else if (sel1 == 1 && sel2 == 0)//10
        out = d3;
    /*else if (sel1 == 1 && sel2 == 1)//11
        out = d4;*/
    end
endmodule
