
class spi_driver extends uvm_driver /* base class*/;
	`uvm_component_utils(spi_driver)

	function  new(input string name = "spi_driver", uvm_component path);
		super.new(name, path);		
	endfunction 

	spi_if spi_if;
	transaction tr;

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		tr = transaction::type_id::create("tr");
		if(!uvm_config_db#(spi_if)::get(this, "", "spi_if", vif))
			`uvm_error("SPI_DRIVER", "Unable to access db");
	endfunction


	/**************************************
	 * 
	 * ************************************/
	 task reset_dut();
	 	// repeat(5) begin
	 		vif.rst  <= 1'b1;
	 		vif.cs   <= 1'b1;
	 		vif.miso <= 1'b0; 

	 		`uvm_info("DRIVER", "System Reset", UVM_MEDIUM);
	 		@(posedge vif.clk);
	 	// end
	 endtask : reset_dut

	/*************************************
	 * 
	 * ***********************************/
	 
	 
	 /************************************
	  * 
	  * ***********************************/
	  task driver();
	  	reset_dut();
	  	forever begin
	  		seq_item_port.get_next_item(tr);
	  		vif.rst 	<= 1'b0;

	  		@(posedge vif.clk);
	  		seq_item_port.item_done();
	  	end

	  endtask : driver


	/*************************************
	 * 
	 * ***********************************/
	virtual task run_phase(uvm_phase phase);
		driver();
	endtask : run_phase


endclass : spi_driver

