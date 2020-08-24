`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 02:47:11 PM
// Design Name: 
// Module Name: signextendtb
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


module signextendtb();
    reg [21:0] in;
    wire [31:0] out;
    SignExtend test (in, out);
    initial begin
        in = 22;
        
        #50;
        
        in = -22;
        
        #50;
        
        in = 63;
        
        #50;
        
        in = -45;
        
        #50;
        
        $finish;
    end
endmodule
