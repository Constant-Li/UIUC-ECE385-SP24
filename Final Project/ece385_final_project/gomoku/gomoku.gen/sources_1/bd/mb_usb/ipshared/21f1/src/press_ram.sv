module  press_ram
(
		input logic [18:0] read_address,
		output logic [2:0] data_Out
);

// mem has width of 3 bits and a total of 8520 addresses
logic [2:0] mem [7680]; // 384*20

initial
begin
	 $readmemh("/VivadoProject/ip_repo/hdmi_text_controller_1_0/src/sprite_originalsPRESS.txt", mem);

end


assign data_Out = mem[read_address];


endmodule

