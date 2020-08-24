`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 04:47:44 PM
// Design Name: 
// Module Name: PCtb
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


module PCtb();
    reg [7:0] in;
    reg clk;
    wire [7:0] out;
    
    ProgramCounter test (in, clk, out);
   
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
      
    initial begin
        in = 55;
        //out = 55
        #50;
        
        in = 200;
        //out = 200
        #50;
        
    $finish;
    end
endmodule
