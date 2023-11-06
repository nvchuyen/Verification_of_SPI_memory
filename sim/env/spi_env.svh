// ------------------------------
//
//
//
// ------------------------------

class spi_env extends uvm_env  /* base class*/;
	`uvm_component_utilts(spi_env)

	function new(input string name, uvm_component c);
		super.new(name, c);
	endfunction 

	spi_agent spi_agent;



endclass : spi_env