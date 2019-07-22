`timescale 1ns/1ns  // used to set the time increment of #1 or #10 etc.

module tri_state_buffer (input in, ENABLE, output out);
// the input is fed to the output if enabled, otherwise, high impedance 
assign out = ENABLE ? in : 'bz;
endmodule

module tri_state_buffer_tb;
reg in, ENABLE;
wire out;

// name mapped association
tri_state_buffer U0(.in(in), .ENABLE(ENABLE), .out(out));

initial
begin
	// initial configuration
	in = 0; ENABLE = 0;
	#10 in = 1;  // see if out stays high impedance while enable is reset
	
	#10 in = 0;  // no change in output should be noticed

	#10 ENABLE = 1; // out should be now reset

	#10 in = 1;  // out should be now set

	#10 ENABLE = 0;  // out should be high impedance again

	#10 $stop;  // stop simulation
end
endmodule
