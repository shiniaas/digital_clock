`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/31 15:15:48
// Design Name: 
// Module Name: SHOW
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


module SHOW(
    input low_h,
    input[6:0] seg,
    input[6:0] seg1,
    input[6:0] seg2,
    input[6:0] seg3,
    input[6:0] seg4,
    input[6:0] seg5,
    output reg[7:0] led,
    output reg[6:0] content
    );
    integer sel_led;
    initial
    begin
        sel_led = 0;
        content = 7'b1111111;
    end
    
    always @ (posedge low_h)
    begin
        content = 7'b1000001;
        if(sel_led == 0)
        begin
            led = 8'b11111110;
            content = seg;    
        end
        else if(sel_led == 1)
        begin
            led = 8'b11111101;
            content = seg1;    
        end
        else if(sel_led == 2)
        begin
            led = 8'b11111011;
            content = seg2;
        end
        else if(sel_led == 3)
        begin
            led = 8'b11110111;
            content = seg3;           
        end
        else if(sel_led == 4)
        begin
            led = 8'b11101111;
            content = seg4;
        end
        else if(sel_led == 5)
        begin
            led = 8'b11011111;
            content = seg5;
        end
        sel_led = sel_led + 1;
        if(sel_led == 6)
        begin
            sel_led = 0;
        end
    end
endmodule
