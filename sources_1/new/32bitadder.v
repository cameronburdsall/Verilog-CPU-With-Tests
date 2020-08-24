`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2019 03:37:05 PM
// Design Name: 
// Module Name: 32bitadder
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


module fullbitadder(d1,d2, out);
    input [31:0] d1;
    input [31:0] d2;
    output [31:0] out;
    wire [31:0] Co;
        onebitadder bit0 (d1[0], d2[0], 1'b0, out[0], Co[0]);//1
        onebitadder bit1 (d1[1], d2[1], Co[0], out[1], Co[1]);//2
        onebitadder bit2 (d1[2], d2[2], Co[1], out[2], Co[2]);//3
        onebitadder bit3 (d1[3], d2[3], Co[2], out[3], Co[3]);//4
        onebitadder bit4 (d1[4], d2[4], Co[3], out[4], Co[4]);//5
        onebitadder bit5 (d1[5], d2[5], Co[4], out[5], Co[5]);//6
        onebitadder bit6 (d1[6], d2[6], Co[5], out[6], Co[6]);//7
        onebitadder bit7 (d1[7], d2[7], Co[6], out[7], Co[7]);//8
        onebitadder bit8 (d1[8], d2[8], Co[7], out[8], Co[8]);//9
        onebitadder bit9 (d1[9], d2[9], Co[8], out[9], Co[9]);//10
        onebitadder bit10 (d1[10], d2[10], Co[9], out[10], Co[10]);//11
        onebitadder bit11 (d1[11], d2[11], Co[10], out[11], Co[11]);//12
        onebitadder bit12 (d1[12], d2[12], Co[11], out[12], Co[12]);//13
        onebitadder bit13 (d1[13], d2[13], Co[12], out[13], Co[13]);//14
        onebitadder bit14 (d1[14], d2[14], Co[13], out[14], Co[14]);//15
        onebitadder bit15 (d1[15], d2[15], Co[14], out[15], Co[15]);//16
        onebitadder bit16 (d1[16], d2[16], Co[15], out[16], Co[16]);//17
        onebitadder bit17 (d1[17], d2[17], Co[16], out[17], Co[17]);//18
        onebitadder bit18(d1[18], d2[18], Co[17], out[18], Co[18]);//19
        onebitadder bit19(d1[19], d2[19], Co[18], out[19], Co[19]);//20
        onebitadder bit20(d1[20], d2[20], Co[19], out[20], Co[20]);//21
        onebitadder bit21(d1[21], d2[21], Co[20], out[21], Co[21]);//22
        onebitadder bit22(d1[22], d2[22], Co[21], out[22], Co[22]);//23
        onebitadder bit23(d1[23], d2[23], Co[22], out[23], Co[23]);//24
        onebitadder bit24(d1[24], d2[24], Co[23], out[24], Co[24]);//25
        onebitadder bit25(d1[25], d2[25], Co[24], out[25], Co[25]);//26
        onebitadder bit26(d1[26], d2[26], Co[25], out[26], Co[26]);//27
        onebitadder bit27(d1[27], d2[27], Co[26], out[27], Co[27]);//28
        onebitadder bit28(d1[28], d2[28], Co[27], out[28], Co[28]);//29
        onebitadder bit29(d1[29], d2[29], Co[28], out[29], Co[29]);//30
        onebitadder bit30(d1[30], d2[30], Co[29], out[30], Co[30]);//31
        onebitadder bit31(d1[31], d2[31], Co[30], out[31], Co[31]);//32
endmodule
