`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/31 10:01:37
// Design Name: 
// Module Name: CLOCK60
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


module CLOCK60(
    input clks,
    input sclr,
    input sclk,
    input stiming,
    input selw,
    output reg[3:0] v0,
    output reg[3:0] v1,
    output reg co,
    output reg flag
    );
    initial
    begin
        v0 = 0;
        v1 = 0;
        co = 0;
        flag = 0;
    end       
    parameter S0 = 0, S1 = 1;   //S0:usual, S1:Stop
    wire State;
    wire CP;
    assign State = sclk?S1:S0;
    assign CP = State?stiming:clks;
    
    always @ (posedge CP or posedge sclr)
    begin
        co = 0;
        flag = 0;
        if(sclr)
        begin
            v0 = 0;
            v1 = 0;
        end
        else
        begin
            case(State)
            S0:
            begin
                v0 = v0 + 1;
                if(v0 == 10)
                begin
                    v0 = 0;
                    v1 = v1 + 1;
                    if(v1 == 6)
                    begin
                        v1 = 0;
                        co = 1;
                    end
                end
                if(v0 == 9 && v1 == 5)
                begin
                    flag = 1;
                end
            end
            S1:
            begin
                if(!selw)
                begin
                    v0 = v0 + 1;
                    if(v0 == 10)
                        v0 = 0;
                end
                else if(selw)
                begin
                    v1 = v1 + 1;
                    if(v1 == 6)
                        v1 = 0;
                end
            end
            endcase
        end
    end
//    always @ (posedge clks or posedge sclr or posedge stiming or posedge sclk)
//    begin
//        co = 0;
//        if(sclr == 1)
//        begin
//            v0 = 0;
//            v1 = 0;
//        end
//        else if(sclk == 1)
//        begin
//            if(stiming == 1)
//            begin
//                if(selw == 0)
//                begin
//                    v0 = v0 + 1;
//                    if(v0 == 10)
//                    begin
//                        v0 = 0;
//                        v1 = v1 + 1;
//                        if(v1 == 6)
//                        begin
//                            v1 = 0;
//                        end
//                    end
//                end
//                else
//                begin
//                    v1 = v1 + 1;
//                    if(v1 == 6)
//                    begin
//                        v1 = 0;
//                    end
//                end
//            end
//        end
//        else if(clks && !sclk && !sclr)
//        begin
//            v0 = v0 + 1;
//            if(v0 == 10)
//            begin
//                v0 = 0;
//                v1 = v1 + 1;
//                if(v1 == 6)
//                begin
//                    v1 = 0;
//                    co = 1;
//                end
//            end
//        end
//    end
    
endmodule
