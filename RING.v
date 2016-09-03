`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/31 11:09:26
// Design Name: 
// Module Name: RING
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


module RING(
    input cclk,
    input cc1,
    input cc2,
    output reg loud
    );
    integer k;
    initial 
    begin
        loud = 0;
        k = 0;
    end
    always @ (posedge cclk or posedge cc1 or posedge cc2)
    begin
        if(cc1 == 1 && cc2 == 1)
        begin
            loud = 1;
            k = 0;
        end
        else if(cclk == 1)
        begin
            if(loud)
            begin
                k = k + 1;
                if(k == 4)
                begin
                    loud = 0;
                    k = 0;
                end
            end
        end
    end
endmodule
