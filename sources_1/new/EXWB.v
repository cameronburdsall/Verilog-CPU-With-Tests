`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2019 03:31:46 PM
// Design Name: 
// Module Name: EXWB
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


module EXWB(clk, RegWrt, MemToReg, PCtoReg, Branching, BranchZero, Jump, JumpMem, N, Z, ALUResult,
             DataMemOutput, offset, rd, RegWrt_out, MemToReg_out, PCtoReg_out, Branching_out, BranchZero_out,
             Jump_out, JumpMem_out, N_out, Z_out, ALUResult_out, DataMemOutput_out, offset_out, rd_out);
    input clk, RegWrt, MemToReg, PCtoReg, Branching, BranchZero, Jump, JumpMem, N, Z;
    input [31:0] ALUResult;
    input [31:0] DataMemOutput;
    input [31:0] offset;
    input [5:0] rd;
    output reg RegWrt_out, MemToReg_out, PCtoReg_out, Branching_out, BranchZero_out, Jump_out, JumpMem_out, N_out, Z_out;
    output reg [31:0] ALUResult_out;
    output reg [31:0] DataMemOutput_out;
    output reg [31:0] offset_out;
    output reg [5:0] rd_out;
    
    always@(posedge clk) begin //passes through values to align execution times
        RegWrt_out = RegWrt;
        MemToReg_out = MemToReg;
        PCtoReg_out = PCtoReg;
        Branching_out = Branching;
        BranchZero_out = BranchZero;
        Jump_out = Jump;
        JumpMem_out = JumpMem;
        N_out = N;
        Z_out = Z;
        ALUResult_out = ALUResult;
        DataMemOutput_out = DataMemOutput;
        offset_out = offset;
        rd_out = rd;
    end
endmodule
