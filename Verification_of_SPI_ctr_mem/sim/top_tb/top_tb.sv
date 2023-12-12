
`include "uvm_macros.svh"
import uvm_pkg::*;

import test_lib_pkg::*;



////////////////////////////////////////////////////////////////////
module top_tb;

    spi_i vif();
  
    top dut (.wr(vif.wr), .clk(vif.clk), .rst(vif.rst), .addr(vif.addr), .din(vif.din), .dout(vif.dout), .done(vif.done), .err(vif.err));
  
    initial begin
        vif.clk <= 0;
    end
 
    always #10 vif.clk <= ~vif.clk;
 
    initial begin
        uvm_config_db#(virtual spi_i)::set(null, "*", "vif", vif);
        run_test("test");
    end
  
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end

endmodule

