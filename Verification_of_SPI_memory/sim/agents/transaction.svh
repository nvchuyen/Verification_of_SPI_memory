// ---------------------------------------------------------
// 2023-12-14
// Nguyen Van Chuyen
//
//
// ---------------------------------------------------------
//
////////////////////////////////////////////////////////////


`ifndef SPI_TRANSACTION
`define SPI_TRANSACTION

typedef enum bit [1:0]   {readd = 0, writed = 1, rstdut = 2} oper_mode;


class transaction extends uvm_sequence_item;
    randc logic [7:0] addr;
    rand logic [7:0] din;
         logic [7:0] dout;
    rand oper_mode   op;
         logic rst;
    rand logic miso;
         logic cs;     
         logic done;
         logic err;
         logic ready;
         logic mosi;
         
  	constraint addr_c { addr <= 10;}
 
        `uvm_object_utils_begin(transaction)
        `uvm_field_int (addr,UVM_ALL_ON)
        `uvm_field_int (din,UVM_ALL_ON)
        `uvm_field_int (dout,UVM_ALL_ON)
        `uvm_field_int (ready,UVM_ALL_ON)
        `uvm_field_int (rst,UVM_ALL_ON)
        `uvm_field_int (done,UVM_ALL_ON)
        `uvm_field_int (miso,UVM_ALL_ON)
        `uvm_field_int (mosi,UVM_ALL_ON)
        `uvm_field_int (cs,UVM_ALL_ON)
        `uvm_field_int (err,UVM_ALL_ON)
        `uvm_field_enum(oper_mode, op, UVM_DEFAULT)
        `uvm_object_utils_end
  
 
  	function new(string name = "transaction");
    	super.new(name);
  	endfunction
 
endclass : transaction

`endif
