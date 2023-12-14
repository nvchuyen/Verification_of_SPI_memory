//
//
//
////////////////////////////////////////////////////////////////////////////////////


`ifndef SPI_CONFIG
`define SPI_CONFIG

class spi_config extends uvm_object; /////configuration of env
    `uvm_object_utils(spi_config)
  
    function new(string name = "spi_config");
        super.new(name);
    endfunction
  
    uvm_active_passive_enum is_active = UVM_ACTIVE;
  
endclass


`endif 
