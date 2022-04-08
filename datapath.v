`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2022 11:21:09
// Design Name: 
// Module Name: datapath
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
module datapath(
    input wire [7:0] PortIN,
    output wire [7:0] PortOUT,
    input wire [2:0] seldst,
    input wire [2:0] selsrc,
    input wire dsten,
    input wire srcen,
    input wire clk,
    input wire rst
    );

wire [7:0] INA;
wire [7:0] INQ;
wire [7:0] OUTA;
wire [7:0] OUTQ;
wire [7:0] AYEA;
wire [7:0] AYEQ;
wire [7:0] BEEA;
wire [7:0] BEEQ;
wire [7:0] nulling;
wire [7:0] buswires;  

demux U1(AYEA,BEEA,PortOUT,seldst,clk,buswires,dsten);
sourcemux U2(AYEQ,BEEQ,INQ,selsrc,clk,buswires,srcen);
regbasic U3(INQ,PortIN,rst,clk);
regbasic U4(AYEQ,AYEA,rst,clk);
regbasic U5(BEEQ,BEEA,rst,clk);
        
endmodule
