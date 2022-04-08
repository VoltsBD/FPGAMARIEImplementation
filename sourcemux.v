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


module sourcemux(input wire [7:0] A,
                 input wire [7:0] B,
                 input wire [7:0] INna,
                 input wire [7:0] outbuf,
                 input wire [2:0] sel,
                 input wire clk,
                 output reg [7:0] outna,  //Srcout
                 input wire srcoe
                 );


always@(posedge clk)
begin 
    if(srcoe) 
        begin
        case(sel)
                3'h1: 
                outna=A;
                3'h2: 
                outna=B;
                3'h3: 
                outna=INna;
                3'h4: 
                outna=outbuf;
                3'h5: 
                outna=8'hzz;
                3'h6: 
                outna=8'hzz;
                3'h7: 
                outna=8'hzz;
                3'h0: 
                outna=8'hzz;
           endcase
        end
end

/* 
// the way mux is done on sequential implmentation

assign outna = (sel==3'h1) ? A;
               (sel==3'h2) ? B;
               (sel==3'h3) ? INna;
               (sel==3'h4) ? outbuf;
               8'hzz;

*/

endmodule
