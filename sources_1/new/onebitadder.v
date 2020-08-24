`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2019 02:30:08 PM
// Design Name: 
// Module Name: onebitadder
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


module onebitadder(d1, d2, Cin, out, Co);
    input d1, d2, Cin;
    output reg out;
    output reg Co;
always@ (d1, d2, Cin, out, Co)
begin
//using the truth table for a one bit adder, I made if statements that change the outputs to match the truth table
    if (!d1 & !d2 & !Cin)
    begin
        out = 0;
        Co = 0;
    end
    else if (!d1 & !d2 & Cin)
    begin
        out = 1;
        Co = 0;
    end
    else if (!d1 & d2 & !Cin)
    begin
        out = 1;
        Co = 0;
    end
    else if (!d1 & d2 & Cin)
    begin
        out = 0;
        Co = 1;
    end
    else if (d1 & !d2 & !Cin)
    begin
        out = 1;
        Co = 0;
    end
    else if (d1 & !d2 & Cin)
    begin
        Co = 1;
        out = 0;
    end
    else if (d1 & d2 & !Cin)
    begin
        Co = 1;
        out = 0;
    end
    else if (d1 & d2 & Cin)
    begin
        out = 1;
        Co = 1;
    end
   end
endmodule
