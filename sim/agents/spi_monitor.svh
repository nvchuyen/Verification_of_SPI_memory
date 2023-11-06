// --------------------------------------
// 05/09/2023
// Nguyen Van Chuyen
// 
// --------------------------------------

class spi_monitor extends uvm_monitor /* base class*/;
	`uvm_component_utils(spi_monitor)

	function new( input string name = "monitor", uvm_component parent = null);
		super.new(name, parent);		
	endfunction 

	transaction tr;
	virtual spi_if;
	uvm_analysis_port #(transaction) send; // send to scoreboard

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		tr = transaction::type_id::create("tr");
		send = new("send", this);
		if(!uvm_config_db#(virtual spi_if)::get(this, "", "spi_if", spi_if );)
			`uvm_error("MONITOR","Unable to access db")
	endfunction : build_phase

	/********************************
	 *  write after
	 * ******************************/
	virtual task run_phase(uvm_phase phase);

		
	endtask : run_phase


endclass : spi_monitor
