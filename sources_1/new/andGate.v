`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 03:01:10 PM
// Design Name: 
// Module Name: andGate
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


module andGate(d1, d2, out);
    input d1, d2;
    output reg out;
    always@(d1, d2) begin
        if (d1 ==1 && d2 == 1) begin
            out = 1;
        end
        else begin
            out = 0;
        end
    end
endmodule
