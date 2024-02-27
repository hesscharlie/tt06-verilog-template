/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);


    always @ (posedge clk or posedge rst_n)
	begin
		if (rst_n     ) 
			out= 8'h00;
		else
            out={~out[7],out[0:7-1]};   
	end

    

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = 8'h00; 
  assign uio_out = 8'h00;
  assign uio_oe  = 8'h00;

    

endmodule
