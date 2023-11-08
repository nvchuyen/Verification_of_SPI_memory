// -----------------------------------
// 05/09/2023
// Nguyen Van Chuyen
//
// -----------------------------------

class transaction extends  uvm_sequence_item /* base class*/;
	logic [7:0] addr;
	logic [7:0] din;
	logic [7:0] dout;
	logic rst;
	logic cs;
	logic miso; 
	logic ready; 
	logic mosi;
	logic op_done;

	constraint addr_c { addr <= 10;		
	}

	`uvm_object_utils_begin(transaction)
		`uvm_file_int (addr, UVM_ALL_ON)
		`uvm_file_int (din, UVM_ALL_ON)
		`uvm_file_int (dou, UVM_ALL_ON)
		`uvm_file_int (rst, UVM_ALL_ON)
		`uvm_file_int (miso, UVM_ALL_ON)
		`uvm_file_int (ready, UVM_ALL_ON)
		`uvm_file_int (mosi, UVM_ALL_ON)

	function new ( string name = "transaction");
		super.new(name);
	endfunction 
endclass : transaction