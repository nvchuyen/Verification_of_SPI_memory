// ------------------------------------
//
//
// ------------------------------------

module tb_top

	logic clk; 
	logic rst;

	spi_if SPI0();

	spi_mem spi_mem(.clk	(SPI0.clk), 
					.rst	(SPI0.rst), 
					.cs		(SPI0.cs), 
					.miso	(SPI0.miso)
					.ready  (SPI0.ready)
					.mosi	(SPI0.mosi)
					.op_done(SPI0.op_done));

 initial begin
 	SPI0.clk = 0;
 	SPI0.rst = 0;	
 end

 initial begin
 	SPI0.rst = 0;
 	repeat(4) @(posedge SPI0.clk);
 	SPI0.rst = 1;
 end

 always #10 SPI0.clk = ~SPI0.clk;

 initial begin
 	uvm_config_db #(virtual spi_if) ::set(nul, "uvm_test_top", "SPI0", SPI0);
 end

endmodule
