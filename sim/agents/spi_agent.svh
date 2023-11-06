// --------------------------------
//
//
//

class spi_agent extends uvm_agent /* base class*/;
	`uvm_component_utils(spi_agent)

	function new(input string inst = "agent", uvm_component c);
		super.new(inst, c);
	endfunction 

	spi_driver spi_driver;
	spi_monitor spi_monitor;

	


endclass : spi_agent