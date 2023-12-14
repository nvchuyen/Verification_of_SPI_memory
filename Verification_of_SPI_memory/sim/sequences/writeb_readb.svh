
//--------------------------------------------------------
// Nguyen Van Chuyen 
// 2023-12-14
//
//
//--------------------------------------------------------
//
////////////////////////////////////////////////////////////

 
class writeb_readb extends uvm_sequence#(transaction);
  `uvm_object_utils(writeb_readb)
  
  	transaction tr;
 
  	function new(string name = "writeb_readb");
    	super.new(name);
  	endfunction
  
  	virtual task body();
     
    	repeat(10)
    	begin
    	    tr = transaction::type_id::create("tr");
    	    tr.addr_c.constraint_mode(1);
    	    start_item(tr);
    	    assert(tr.randomize);
    	    tr.op = writed;
    	    finish_item(tr);  
    	end
        
    	repeat(10)
    	begin
    	    tr = transaction::type_id::create("tr");
    	    tr.addr_c.constraint_mode(1);
    	    start_item(tr);
    	    assert(tr.randomize);
    	    tr.op = readd;
    	    finish_item(tr);
    	end   
  	endtask 
endclass
