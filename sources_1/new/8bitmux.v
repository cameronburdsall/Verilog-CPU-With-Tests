`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2019 03:15:32 PM
// Design Name: 
// Module Name: 8bitmux
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


module eightbitmux(d1,d2,d3,/*d4*/sel1, sel2, out);
    input [7:0] d1;
    input [7:0] d2;
    input [7:0] d3;
    //input [31:0] d4;
    input sel1, sel2; 
    //input [1:0] sel;
    
    output reg [7:0] out;
    
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
