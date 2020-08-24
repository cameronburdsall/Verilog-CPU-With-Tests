`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 03:09:29 PM
// Design Name: 
// Module Name: orGatetb
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


module orGatetb();
    reg d1, d2, d3;
    wire out;
    
    orGate test (d1, d2, d3, out);
    
    initial begin
        d1 = 0;
        d2 = 0;
        d3 = 0;
        #50; //out = 0
        
        d1 = 1;
        #50; //out = 1
        
        d2 = 1;
        #50; //out = 1
        
        d1 = 0;
        #50; //out = 1
        
        d2 = 0;
        #50; //out = 0
        
        d3 = 1;
        #50; //out = 1
    end
endmodule
