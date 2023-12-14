// ----------------------------------
// 31/08/2023
// Nguyen Van Chuyen
//
//
// ----------------------------------


class test extends uvm_test /* base class*/;
	`uvm_component_utils(test)

	function new(input string inst, uvm_component c);
		super.new(inst, c);		
	endfunction 

	env e;
	write_data wdata;
	read_data rdata;
	writeb_readb wrrdb;
	reset_dut rstdut; 

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
   		e      = env::type_id::create("env",this);
   		wdata  = write_data::type_id::create("wdata");
   		rdata  = read_data::type_id::create("rdata");
   		wrrdb  = writeb_readb::type_id::create("wrrdb");
   		rstdut = reset_dut::type_id::create("rstdut");
	endfunction 

	virtual task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		wrrdb.start(e.a.seqr);
		phase.drop_objection(this);
	endtask

endclass : test


