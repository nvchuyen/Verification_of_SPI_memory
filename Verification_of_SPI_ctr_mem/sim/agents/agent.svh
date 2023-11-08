//------------------------------------------------
// Nguyen Van Chuyen
// 2023-11-06
//
//
//-------------------------------------------------
//
// Class Description
//
/////////////build the seq for random length with and without priority


class agent extends uvm_agent;
    `uvm_component_utils(agent)
  
    spi_config cfg;
 
    function new(input string inst = "agent", uvm_component parent = null);
        super.new(inst,parent);
    endfunction
 
    driver d;
        uvm_sequencer#(transaction) seqr;
    mon m;
 
 
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        cfg =  spi_config::type_id::create("cfg"); 
        m = mon::type_id::create("m",this);
      
        if(cfg.is_active == UVM_ACTIVE)
        begin   
            d = driver::type_id::create("d",this);
            seqr = uvm_sequencer#(transaction)::type_id::create("seqr", this);
        end
    endfunction
 
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        
        if(cfg.is_active == UVM_ACTIVE) 
        begin  
            d.seq_item_port.connect(seqr.seq_item_export);
        end
    endfunction
 
endclass