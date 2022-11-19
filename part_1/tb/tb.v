module testbench(

    );
   
    reg clk_in, button_in, resetn_in;
    wire button_out;
    wire [7:0] count;
    //debouncer d1(.clk_in(clk_in), .resetn_in(resetn_in), .button_in(button_in), .button_out(button_out));
    module top_module(input increment_in,input clk_in,input resetn_in,output reg[7:0] count);
    //top_module tm1(.button_in(button_in), .clk_in(clk_in), .resetn_in(resetn_in), .count(count));
    //counter cc( .clk_in(clk_in), .button_in(button_in),.resetn_in(resetn_in), .count(count));
    initial begin
        clk_in = 1'b0; button_in = 1'b0; resetn_in = 1'b0;
        #1000 resetn_in = 1'b1;
        #1000 resetn_in = 1'b0;
    end
    always begin
        #10 clk_in = 1'b1;
        #10 clk_in = 1'b0;
    end
    always begin
        #10 button_in = 1'b1;
        #25 button_in = 1'b0;
        #40 button_in = 1'b1;
        #50 button_in = 1'b0;
        #100 button_in = 1'b1;
        #1000 button_in = 1'b0;
        #1000 button_in = 1'b1;
        #30 button_in = 1'b0;
        #45 button_in = 1'b1;
       
    end
endmodule
