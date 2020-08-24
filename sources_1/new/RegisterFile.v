`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 03:52:43 PM
// Design Name: 
// Module Name: Register File
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


module registerFile(clk, write, rd, rs, rt, data_in,
                    rs_out, rt_out);
    input clk, write;
    input [5:0] rd;
    input [5:0] rs;
    input [5:0] rt;
    input [31:0] data_in;
    output reg [31:0] rs_out;
    output reg [31:0] rt_out;
    reg [31:0] memory [63:0];
    always@ (negedge clk) begin
        if (write == 1) begin
            memory[rd] = data_in;
        end
            rs_out = memory [rs];
            rt_out = memory [rt];
    end
endmodule

