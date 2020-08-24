`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 03:35:01 PM
// Design Name: 
// Module Name: ControlUnit
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
/*
CONTROL TRUTH TABLE

d1  d2  d3  d4  |   RegWrt  MemToReg    PCtoReg MemRead MemWrt  BranchNeg   BranchZero  Jump    JumpMem
0   0   0   0   |       0       0           0       0       0       0           0        0          0
0   0   0   1   |       1       1           0       1       0       0           0
0   0   1   0   |
0   0   1   1   |       0       0           0       0       1       0           0        0          0
0   1   0   0   |       1       0           0       0       0       0           0        0          0
0   1   0   1   |       1       0           0       0       0       0           0        0          0
0   1   1   0   |       1       0           0       0       0       0           0        0          0
0   1   1   1   |       1       0           0       0       0       0           0        0          0
1   0   0   0   |       0       0           0       0       0       0           0        1          0
1   0   0   1   |       0       0           0       0       0       0           1        0          0
1   0   1   0   |       0       0           0       1       0       0           0        0          1
1   0   1   1   |       0       0           0       0       0       1           0        0          0
1   1   0   0   |       
1   1   0   1   |   
1   1   1   0   |       1       1           0       1       0       0           0        0          0
1   1   1   1   |       1       0           1       0       0       0           0        0          0    
*/





module ControlUnit(clk, in, RegWrt, MemToReg, PCtoReg, ALUOp, MemRead, MemWrt, BranchNeg, BranchZero, Jump, JumpMem);
    input [3:0] in;
    
    input clk;
    
    output reg RegWrt, MemToReg, PCtoReg, MemRead, MemWrt, BranchNeg, BranchZero, Jump, JumpMem;

    output reg [3:0] ALUOp;
    
    always@ (negedge clk) begin
        
        //set all puts to 0;
        RegWrt = 0;
        MemToReg = 0;
        PCtoReg = 0;
        MemRead = 0; 
        MemWrt = 0;
        BranchNeg = 0;
        BranchZero = 0;
        Jump = 0;
        JumpMem = 0;
        
        if (in == 4'b0000) begin //No Operation
            //set no flags...
            //no ALU op...
            ALUOp = 4'b0100;
        end
        
        if (in == 4'b1111) begin //Load PC
            PCtoReg = 1; //Activate Program Counter to Register Flag
            RegWrt = 1;
            ALUOp = 4'b0100; //Sets ALU to PASS
        end
        
        if (in == 4'b1110) begin //Load
            RegWrt = 1; //Activate Register Write Flag
            MemRead = 1; //Activate Read from Memory flag
            MemToReg = 1; //Activate Memory to Register flag, manipulates mux 1
            ALUOp = 4'b0100; //Sets ALU to PASS memreg
        end
        
        if (in == 4'b0011) begin //Store
            MemWrt = 1; //Activate Write to Memory Flag
            ALUOp = 4'b0000; //Sets ALU to ADD
        end
        
        if (in == 4'b0100) begin //Add
            RegWrt = 1;
            ALUOp = 4'b0000; //Sets ALU to ADD
        end
        
        if (in == 4'b0101) begin //Increment
            RegWrt = 1;
            ALUOp = 4'b0001; //Sets ALU to increment
        end
        
        if (in == 4'b0110) begin //Negate
            RegWrt = 1;
            ALUOp = 4'b0010; //set ALU to NEGATE
        end
        
        if (in == 4'b0111) begin //Subtract
            RegWrt = 1;
            ALUOp = 4'b0011; //Set ALU to Subtract
        end
        
        if (in == 4'b1000) begin // Jump
            Jump = 1;
            ALUOp = 4'b0100; //pass reg value for jump
        end
        
        if (in == 4'b1001) begin //Branch if zero
            BranchZero = 1;
            ALUOp = 4'b0100; //Z flag raised if 0, Fed into AND GATE
        end
        
        if (in == 4'b1010) begin // Jump memory
            JumpMem = 1;
            MemRead = 1; //will need to read mem data from reg value
            ALUOp = 4'b0000; //pass reg to be read from mem
        end
        
        //!!!!!!!!!!!!!!!!!!!!!!!!
        if (in == 4'b1011) begin //Branch if Negative
            BranchNeg = 1;
            ALUOp = 4'b0100; //Passes value, ALU outputs N flag which gets fed into AND GATE
            
        end
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        if (in == 4'b0001) begin //SUM instruction
            //Need to write to a reg, read from memory, move from memory to reg, Jump? JumpMem?
            RegWrt = 1;
            MemRead = 1;
            MemToReg = 1;
            ALUOp = 4'b0000;
            
        end
    end
endmodule
