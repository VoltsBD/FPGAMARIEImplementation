`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2022 07:36:56
// Design Name: 
// Module Name: sourcemux
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


module demux(output reg [7:0] A,
                 output reg [7:0] B,
                 output reg [7:0] outbuf,
                 input wire [2:0] sel,
                 input wire clk,
                 input wire [7:0] busfin,
                 input wire busin
                 );


always@(posedge clk)
begin 
    if(busin) 
        begin
        case(sel)
                3'h1: 
                A=busfin;
                3'h2: 
                B=busfin;
                3'h4: 
                outbuf=busfin;
           endcase
        end
end

endmodule