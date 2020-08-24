`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2019 03:17:12 PM
// Design Name: 
// Module Name: IDEX
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


module IDEX(clk, RegWrt, MemToReg, PCtoReg, ALUOp, MemRead,
             MemWrt, BranchNeg, BranchZero, Jump, JumpMem, rs, rt, rd, offset, RegWrt_out, MemToReg_out, PCtoReg_out,
             ALUOp_out, MemRead_out, MemWrt_out, BranchNeg_out, BranchZero_out, Jump_out, JumpMem_out, rs_out, rt_out, rd_out, offset_out);
    input clk, RegWrt, MemToReg, PCtoReg, MemRead, MemWrt, BranchNeg, BranchZero, Jump, JumpMem;
    input [3:0] ALUOp;
    input [31:0] rs;
    input [31:0] rt;
    input [5:0] rd;
    input [31:0] offset;
    output reg RegWrt_out, MemToReg_out, PCtoReg_out, MemRead_out, MemWrt_out, BranchNeg_out, BranchZero_out, Jump_out, JumpMem_out;
    output reg [3:0] ALUOp_out;
    output reg [31:0] rs_out;
    output reg [31:0] rt_out;
    output reg [5:0] rd_out;
    output reg [31:0] offset_out;
    
    always@(posedge clk) begin //passes through values to align execution times
        RegWrt_out = RegWrt;
        MemToReg_out = MemToReg; 
        PCtoReg_out = PCtoReg; 
        ALUOp_out = ALUOp;
        MemRead_out = MemRead; 
        MemWrt_out = MemWrt;
        rs_out = rs;
        rt_out = rt;
        rd_out = rd;
        offset_out = offset;
        BranchNeg_out = BranchNeg;
        BranchZero_out = BranchZero;
        Jump_out = Jump;
        JumpMem_out = JumpMem;
    end
endmodule 
