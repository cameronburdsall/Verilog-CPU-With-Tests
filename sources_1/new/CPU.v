`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2019 02:47:59 PM
// Design Name: 
// Module Name: CPU
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


module CPU();
    
    //Clock
    reg clk;
    
    
    //Control Unit Wires
    wire RegWrt;
    wire MemToReg;
    wire PCtoReg;
    wire MemRead; 
    wire MemWrt;
    wire BranchNeg;
    wire BranchZero;
    wire Jump;
    wire JumpMem;
    wire logicOut;
    wire [3:0] ALUOp;
    //end Control Unit Wires
    
    
//    //Important Component wires Used across stages
    wire [31:0] Instruction;
    wire [31:0] WBmuxout;
//        /*
//        31-28 = OpCode
//        27 - 22 = Rd
//        21 - 16 = Rs
//        15 - 10 = Rt
//        */
    //wire [31:0] ALUout;
    //end
    
//    //INSTRUCTION FETCH COMPONENTS AND REGISTERS
    wire [31:0] PCout;
    wire [31:0] add1out;
    wire [7:0] PCmuxout;
    wire [31:0] PCBout;
    
//    //EXWB wires
    wire JumpMem_EXWB;
    wire RegWrt_EXWB;
    
    //switched mux inputs....
    //eightbitmux PCmux (ALUout_EXWB[7:0], add1out,/*Replace*/ /*Need to grab from buffer!!!!!!!*/ Dmemout_EXWB[7:0], RegWrt_EXWB, logicOut, PCmuxout);
    eightbitmux PCmux (add1out[7:0],/*Replace*/ ALUout_EXWB[7:0]/*Need to grab from buffer!!!!!!!*/, Dmemout_EXWB[7:0], JumpMem_EXWB, logicOut, PCmuxout);

    ProgramCounter PC (PCmuxout, clk, PCout); //for some reason, PCout never gets a value from PCmuxout..., tried changing PC file, see comments
    
    fullbitadder add1 (PCout, 1, add1out);
    
    PCBuffer PCB (PCout, clk, PCBout);
    
    instructionmemory Imem(clk, PCout[7:0], Instruction);
    //END INSTRUCTION FETCH COMPONENTS AND REGISTERS
    
    //IF/ID BUFFER
    
    wire [31:0] Instruction_Buffer;
    wire [31:0] PCout_Buffer;
    IFID IFIDBuffer (Instruction, PCBout, clk, Instruction_Buffer, PCout_Buffer);
    
   
    
//    //END IF/ID BUFFER
    
    
//    //INSTRUCTION DECODE COMPONENTS AND WIRES
//    //two read registers data
    wire [31:0] RsData;
    wire [31:0] RtData;
    //write register data
    
    wire [31:0] SEadderout;
    wire [31:0] SEval;
    
//    //EXWB wires
    wire [5:0] Rd_EXWB;
    
    SignExtend SE (Instruction_Buffer [21:0], SEval);
    fullbitadder SEadder (SEval, PCout_Buffer, SEadderout);
    ControlUnit Control(clk, Instruction_Buffer [31:28]/*Opcode for Control*/, RegWrt, MemToReg, PCtoReg, ALUOp, MemRead, MemWrt, BranchNeg, BranchZero, Jump, JumpMem);
    registerFile regFile(clk, RegWrt_EXWB, Rd_EXWB /*Rd*/, Instruction [21:16]/*Rs*/, Instruction [15:10]/*Rt*/, WBmuxout/*DataIn*/, RsData, RtData);
  
//    //END INSTRUCTION DECODE COMPONENTS AND WIRES
    
    
    //ID/EX BUFFER
    wire RegWrt_IDEX;
    wire MemToReg_IDEX;
    wire PCtoReg_IDEX;
    wire [3:0] ALUOp_IDEX;
    wire MemRead_IDEX;
    wire MemWrt_IDEX;
    wire BranchNeg_IDEX;
    wire BranchZero_IDEX;
    wire Jump_IDEX;
    wire JumpMem_IDEX;
    wire [31:0] RsData_IDEX;
    wire [31:0] RtData_IDEX;
    wire [5:0] Rd_IDEX;
    wire [31:0] SEadderout_IDEX;
    IDEX IDEXBuffer (clk, RegWrt, MemToReg, PCtoReg, ALUOp, MemRead, MemWrt, BranchNeg, BranchZero, Jump, JumpMem, RsData, RtData, Instruction_Buffer [27:22]/*Rd*/, SEadderout, RegWrt_IDEX, MemToReg_IDEX, PCtoReg_IDEX, ALUOp_IDEX, MemRead_IDEX, MemWrt_IDEX, BranchNeg_IDEX, BranchZero_IDEX, Jump_IDEX, JumpMem_IDEX, RsData_IDEX, RtData_IDEX, Rd_IDEX, SEadderout_IDEX);
    //END ID/EX BUFFER
    
    
//    //EXECUTION/MEMORY STAGE COMONENTS AND WIRES
    wire Z_flag, N_flag;
    wire [31:0] Dmemout;
    wire [31:0] ALUout;
    ALU alu (RsData_IDEX, RtData_IDEX, ALUOp_IDEX, ALUout, Z_flag, N_flag);
    dataMemory Dmem (clk, MemRead_IDEX, MemWrt_IDEX, RsData_IDEX, RtData_IDEX, Dmemout);
    //END EXECUTION STAGE
    
//    //EX/WB BUFFER
//    //  APPROPRIATE EXWB WIRES INITIALIZED WHERE NEEDED (IE IN DIFFERENT STAGES)
    wire MemToReg_EXWB;
    wire PCtoReg_EXWB;
    wire Z_flag_EXWB;
    wire N_flag_EXWB;
    wire BranchNeg_EXWB;
    wire BranchZero_EXWB;
    wire Jump_EXWB;
    //wire JumpMem_EXWB;
    wire [31:0] ALUout_EXWB;
    wire [31:0] Dmemout_EXWB;

    wire [31:0] SEadderout_EXWB;
    
    EXWB EXWBBuffer (clk, RegWrt_IDEX, MemToReg_IDEX, PCtoReg_IDEX, BranchNeg_IDEX, BranchZero_IDEX, Jump_IDEX, JumpMem_IDEX, N_flag, Z_flag, ALUout, Dmemout, SEadderout_IDEX, Rd_IDEX, RegWrt_EXWB, MemToReg_EXWB, PCtoReg_EXWB, BranchNeg_EXWB, BranchZero_EXWB, Jump_EXWB, JumpMem_EXWB, N_flag_EXWB, Z_flag_EXWB, ALUout_EXWB, Dmemout_EXWB, SEadderout_EXWB, Rd_EXWB);
//    //END EX/WB BUFFER
    
//    //LOGIC GATE GROUP
    wire and1out, and2out;
    andGate and1 (N_flag_EXWB, BranchNeg_EXWB, and1out);
    andGate and2 (Z_flag_EXWB, BranchZero_EXWB, and2out);
    orGate or1 (and1out, and2out, Jump_EXWB, logicOut);
    //END LOGIC GATE GROUP
    
//    //Write Back MUX
    //wire [31:0] WBmuxout;
    mux412sel WBmux (ALUout_EXWB, Dmemout_EXWB, SEadderout_EXWB, PCtoReg_EXWB, MemToReg_EXWB,  WBmuxout);
//    //END Write Back MUX
    
    //BACK TO INSTRUCTION FETCH STAGE
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        #2000;
      
        $finish;
    end
endmodule
