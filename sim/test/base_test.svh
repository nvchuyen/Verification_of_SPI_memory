
// ---------------------------------
//
//
// ---------------------------------

class base_test extends uvm_test  /* base class*/;
	`uvm_component_utils(base_test)

	function new(input string name = "test_base", uvm_component c);
		super.new(name, c)	
	endfunction 

	



endclass : base_test