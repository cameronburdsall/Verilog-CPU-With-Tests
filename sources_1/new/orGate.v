`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 03:08:19 PM
// Design Name: 
// Module Name: orGate
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


module orGate(d1, d2, d3, out);
    input d1, d2, d3;
    output reg out;
    always@(d1, d2, d3) begin
        if (d1 ==1 || d2 == 1 || d3 == 1) begin
            out = 1;
        end
        else if (d1 == 0 && d2 == 0 && d3 == 0) begin
            out = 0;
        end
    end
endmodule
