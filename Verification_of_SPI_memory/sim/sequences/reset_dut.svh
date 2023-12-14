//--------------------------------------------------------
// Nguyen Van Chuyen 
// 2023-12-14
//
//
//--------------------------------------------------------
//
////////////////////////////////////////////////////////////
 
class reset_dut extends uvm_sequence#(transaction);
  `uvm_object_utils(reset_dut)
  
    transaction tr;
 
    function new(string name = "reset_dut");
      super.new(name);
    endfunction
  
    virtual task body();
    repeat(15)
    begin
        tr = transaction::type_id::create("tr");
        tr.addr_c.constraint_mode(1);
        start_item(tr);
        assert(tr.randomize);
        tr.op = rstdut;
        finish_item(tr);
    end
    endtask
    
endclass
