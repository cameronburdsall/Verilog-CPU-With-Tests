`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 02:29:06 PM
// Design Name: 
// Module Name: SignExtend
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


module SignExtend(in, out);
    input [21:0] in;
    output reg [31:0] out;
    integer i;
    always@ (in) begin
        //copies contents of in into first 22bits of out
        for (i=0; i < 22; i = i + 1) begin
             out[i] = in[i];
        end
        
        if (in[21] == 0) begin //fill 0's
            for (i=22; i < 32; i = i + 1) begin
                out [i] = 0;
            end
        end
        else begin//fill 1's
            for (i=22; i < 32; i = i + 1) begin
                out [i] = 1;
            end
        end
    end
endmodule
