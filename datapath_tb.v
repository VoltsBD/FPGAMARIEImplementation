`timescale 1ns / 1ps

module datapath_tb();

reg [7:0] PortINtb;
wire [7:0] PortOUTtb;
reg [2:0] seldsttb;
reg [2:0] selsrctb;
reg clktb;
reg dstentb;
reg srcentb;
reg rsttb;

datapath UUT (
                .PortIN(PortINtb),
                .PortOUT(PortOUTtb),
                .seldst(seldsttb),
                .selsrc(selsrctb),
                .dsten(dstentb),
                .srcen(srcentb),
                .clk(clktb),
                .rst(rsttb)
                );

initial 
        begin
          #30 clktb=1'b0;  seldsttb=3'h1;        selsrctb=3'h3;         dstentb=1'b1;       srcentb=1'b1;        rsttb=1'b0;        PortINtb=8'hFF; // A<-INA
          #30 rsttb=1'b1; // Process Request
        end

always 
    begin
    #5 clktb=~clktb;
    end



initial
        begin     
        #190    seldsttb=3'h4;  selsrctb=3'h1; dstentb=1'b1; srcentb=1'b1; rsttb=1'b1; // PortOUT<-ACC 
        #120    seldsttb=3'h2;  selsrctb=3'h3; dstentb=1'b1; srcentb=1'b1; rsttb=1'b1; PortINtb=8'h0F; // lagay 0F sa BREG
        #120    seldsttb=3'h4;  selsrctb=3'h2; dstentb=1'b1; srcentb=1'b1; rsttb=1'b1; // PortOUT<-BREG
        end


endmodule
