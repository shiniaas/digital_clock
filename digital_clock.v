`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/31 15:00:12
// Design Name: 
// Module Name: digital_clock
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


module digital_clock(
    input clk,
    input[2:0] con,
    input clr,
    input tclk,
    input sel,
    output speaker,
    output [7:0] led,
    output [6:0] content
    );
    wire [3:0] s0, s1, m0, m1, h0, h1;
    wire [6:0] seg, seg1, seg2, seg3, seg4, seg5;
    wire low, co_s, co_m, low_h, flag_s, flag_m;
    DCLK I6(clk, low, low_h);
    CLOCK60 I10(low, clr, tclk, con[0], sel, s0, s1, co_s, flag_s);
    CLOCK60 I7(co_s, clr, tclk, con[1], sel, m0, m1, co_m, flag_m);
    CLOCK24 I5(co_m, clr, tclk, con[2], sel, h0, h1);
    RING I9(low, co_s, co_m, speaker);
    decoder d1(s0, s1, m0, m1, h0, h1, seg, seg1, seg2, seg3, seg4, seg5);
    SHOW S1(low_h, seg, seg1, seg2, seg3, seg4, seg5, led, content);
     
endmodule
