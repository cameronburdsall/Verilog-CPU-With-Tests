`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 02:13:10 PM
// Design Name: 
// Module Name: twoscomp
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


module twoscomp(d1, out);
    input [31:0] d1;
    output [31:0] out;
    reg [31:0] temp;
    always@(d1)
    begin
        temp = ~d1;
    end
    fullbitadder twos(temp, 1, out);
endmodule
