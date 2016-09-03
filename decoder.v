`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/31 14:46:30
// Design Name: 
// Module Name: decoder
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


module decoder(
    input[3:0] x,
    input[3:0] x1,
    input[3:0] x2,
    input[3:0] x3,
    input[3:0] x4,
    input[3:0] x5,
    output[6:0] seg,
    output[6:0] seg1,
    output[6:0] seg2,
    output[6:0] seg3,
    output[6:0] seg4,
    output[6:0] seg5
    );
    assign seg[6] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (x[2] & ~x[1] & ~x[0]);
    assign seg[5] = (x[2] & ~x[1] & x[0]) | (x[2] & x[1] & ~x[0]);
    assign seg[4] = ~x[2] & x[1] & ~x[0];
    assign seg[3] = (x[2] & ~x[1] & ~x[0]) | (x[2] & x[1] & x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);
    assign seg[2] = x[0] | (x[2] & ~x[1]);
    assign seg[1] = (x[1] & x[0]) | (~x[3] & ~x[2] & x[0]) | (~x[2] & x[1]);
    assign seg[0] = (~x[3] & ~x[2] & ~x[1]) | (x[2] & x[1] & x[0]);
    
    assign seg1[6] = (~x1[3] & ~x1[2] & ~x1[1] & x1[0]) | (x1[2] & ~x1[1] & ~x1[0]);
    assign seg1[5] = (x1[2] & ~x1[1] & x1[0]) | (x1[2] & x1[1] & ~x1[0]);
    assign seg1[4] = ~x1[2] & x1[1] & ~x1[0];
    assign seg1[3] = (x1[2] & ~x1[1] & ~x1[0]) | (x1[2] & x1[1] & x1[0]) | (~x1[3] & ~x1[2] & ~x1[1] & x1[0]);
    assign seg1[2] = x1[0] | (x1[2] & ~x1[1]);
    assign seg1[1] = (x1[1] & x1[0]) | (~x1[3] & ~x1[2] & x1[0]) | (~x1[2] & x1[1]);
    assign seg1[0] = (~x1[3] & ~x1[2] & ~x1[1]) | (x1[2] & x1[1] & x1[0]);
 
    assign seg2[6] = (~x2[3] & ~x2[2] & ~x2[1] & x2[0]) | (x2[2] & ~x2[1] & ~x2[0]);
    assign seg2[5] = (x2[2] & ~x2[1] & x2[0]) | (x2[2] & x2[1] & ~x2[0]);
    assign seg2[4] = ~x2[2] & x2[1] & ~x2[0];
    assign seg2[3] = (x2[2] & ~x2[1] & ~x2[0]) | (x2[2] & x2[1] & x2[0]) | (~x2[3] & ~x2[2] & ~x2[1] & x2[0]);
    assign seg2[2] = x2[0] | (x2[2] & ~x2[1]);
    assign seg2[1] = (x2[1] & x2[0]) | (~x2[3] & ~x2[2] & x2[0]) | (~x2[2] & x2[1]);
    assign seg2[0] = (~x2[3] & ~x2[2] & ~x2[1]) | (x2[2] & x2[1] & x2[0]);
    
    assign seg3[6] = (~x3[3] & ~x3[2] & ~x3[1] & x3[0]) | (x3[2] & ~x3[1] & ~x3[0]);
    assign seg3[5] = (x3[2] & ~x3[1] & x3[0]) | (x3[2] & x3[1] & ~x3[0]);
    assign seg3[4] = ~x3[2] & x3[1] & ~x3[0];
    assign seg3[3] = (x3[2] & ~x3[1] & ~x3[0]) | (x3[2] & x3[1] & x3[0]) | (~x3[3] & ~x3[2] & ~x3[1] & x3[0]);
    assign seg3[2] = x3[0] | (x3[2] & ~x3[1]);
    assign seg3[1] = (x3[1] & x3[0]) | (~x3[3] & ~x3[2] & x3[0]) | (~x3[2] & x3[1]);
    assign seg3[0] = (~x3[3] & ~x3[2] & ~x3[1]) | (x3[2] & x3[1] & x3[0]);

    assign seg4[6] = (~x4[3] & ~x4[2] & ~x4[1] & x4[0]) | (x4[2] & ~x4[1] & ~x4[0]);
    assign seg4[5] = (x4[2] & ~x4[1] & x4[0]) | (x4[2] & x4[1] & ~x4[0]);
    assign seg4[4] = ~x4[2] & x4[1] & ~x4[0];
    assign seg4[3] = (x4[2] & ~x4[1] & ~x4[0]) | (x4[2] & x4[1] & x4[0]) | (~x4[3] & ~x4[2] & ~x4[1] & x4[0]);
    assign seg4[2] = x4[0] | (x4[2] & ~x4[1]);
    assign seg4[1] = (x4[1] & x4[0]) | (~x4[3] & ~x4[2] & x4[0]) | (~x4[2] & x4[1]);
    assign seg4[0] = (~x4[3] & ~x4[2] & ~x4[1]) | (x4[2] & x4[1] & x4[0]);
    
    assign seg5[6] = (~x5[3] & ~x5[2] & ~x5[1] & x5[0]) | (x5[2] & ~x5[1] & ~x5[0]);
    assign seg5[5] = (x5[2] & ~x5[1] & x5[0]) | (x5[2] & x5[1] & ~x5[0]);
    assign seg5[4] = ~x5[2] & x5[1] & ~x5[0];
    assign seg5[3] = (x5[2] & ~x5[1] & ~x5[0]) | (x5[2] & x5[1] & x5[0]) | (~x5[3] & ~x5[2] & ~x5[1] & x5[0]);
    assign seg5[2] = x5[0] | (x5[2] & ~x5[1]);
    assign seg5[1] = (x5[1] & x5[0]) | (~x5[3] & ~x5[2] & x5[0]) | (~x5[2] & x5[1]);
    assign seg5[0] = (~x5[3] & ~x5[2] & ~x5[1]) | (x5[2] & x5[1] & x5[0]);    
endmodule