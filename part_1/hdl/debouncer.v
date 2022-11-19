`timescale 1ns / 1ps

// EC-311 Lab-2 Part-1

module debouncer (
  
  input wire                    clk_i,                   // input clock
  input wire                    resetn_btn_i,            // input pushbutton for active LOW reset (Hint: On Nexys A7 board, the red push button gives 0 output when pressed) 
  input wire                    increment_counter_btn_i, // input push button for counter increment


  // LED outputs
  output wire                   led0,
  output wire                   led1,
  output wire                   led2,
  output wire                   led3,
  output wire                   led4,
  output wire                   led5,
  output wire                   led6,
  output wire                   led7

);
endmodule

module top_module(
    input button_in,
    input clk_in,
    input resetn_in,
    output reg[7:0] count
    );
    wire w1;
    
        debouncer d1(w1, clk_in, button_in, resetn_in);
        counter c1(count, clk_in, w1, resetn_in);

endmodule


module counter(
    input clk_in,
    input button_in,
    input resetn_in,
    output reg[7:0] count = 1'b00000000
    );
    always @ (posedge button_in or negedge resetn_in) begin
        if (resetn_in == 1'b1) begin
            count <= 0;
        end else
            count <= count + 1'b00000001;
    end//always block  
endmodule


module debouncer(

    input clk_in,
    input button_in,
    input resetn_in,
    output button_out
    );
    parameter MAX = 10; //10ms at 25Mhz
    reg button_on = 1'b0;
    reg [17:0] counter = 0;
        always @ (posedge clk_in or negedge resetn_in) begin
            if (resetn_in == 1'b1) begin
                button_on <= 1'b0;
                counter <= 0;
            end else if ( button_in !== button_on && counter < MAX) begin
                counter <= counter + 1;
            end else if (counter == MAX) begin
                counter <= 0;
                button_on <= button_in;
            end else
                counter <= 0;
        end//always block
    assign button_out = button_on;
endmodule






