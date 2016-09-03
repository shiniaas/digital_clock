`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/31 10:37:08
// Design Name: 
// Module Name: CLOCK24
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


module CLOCK24(
    input clkh,
    input hclr,
    input htclk,
    input htiming,
    input sel,
    output reg[3:0] y0,
    output reg[3:0] y1
    );
    initial
    begin
        y0 = 0;
        y1 = 0;
    end
    parameter S0 = 0, S1 = 1;
    wire State;
    wire CP;
    assign State = htclk?S1:S0;
    assign CP = State?htiming:clkh;
    
    always @ (posedge CP or posedge hclr)
    begin
        if(hclr)
        begin
            y0 = 0;
            y1 = 0;
        end
        else
        begin
            case(State)
            S0:
            begin
                y0 = y0 + 1;
                if(y1 == 2 && y0 == 4)
                begin
                    y0 = 0;
                    y1 = 0;
                end
                else if(y0 == 10)
                begin
                    y0 = 0;
                    y1 = y1 + 1;
                end
            end
            S1:
            begin
                if(!sel)
                begin
                    y0 = y0 + 1;
                    if(y1 == 2 && y0 == 4)
                    begin
                        y0 = 0;
                    end
                    else if(y0 == 10)
                    begin
                        y0 = 0;
                    end
                end
                else
                begin
                    y1 = y1 + 1;
                    if(y1 > 2 || (y1 == 2 && y0 > 3))
                    begin
                        y1 = 0;
                    end
                end
            end
            endcase
        end
    end
//    always @ (posedge clkh or posedge hclr or posedge htiming or posedge htclk)
//    begin
//        if(hclr == 1)
//        begin
//            y0 = 0;
//            y1 = 0;
//        end
//        else if(htiming || htclk)
//        begin
//            if(htiming)
//            begin
//                if(!sel)
//                begin
//                    y0 = y0 + 1;
//                    if(y1 == 2 && y0 == 4)
//                    begin
//                        y0 = 0;
//                        y1 = 0;
//                    end
//                    else if(y0 == 10)
//                    begin
//                        y0 = 0;
//                        y1 = y1 + 1;
//                    end
//                end
//                else
//                begin
//                    y1 = y1 + 1;
//                    if(y1 > 2 || (y1 == 2 && y0 > 3))
//                    begin
//                        y1 = 0;
//                    end
//                end
//            end
//        end
//        else
//        begin
//            y0 = y0 + 1;
//            if(y1 == 2 && y0 == 4)
//            begin
//                y0 = 0;
//                y1 = 0;
//            end
//            else if(y0 == 10)
//            begin
//                y0 = 0;
//                y1 = y1 + 1;
//            end
//        end
//    end
endmodule
