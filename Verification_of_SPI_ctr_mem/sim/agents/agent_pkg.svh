

`ifndef AGENT_PKG_SV
`define AGENT_PKG_SV

package agent_pkg;
	
import uvm_pkg::*;
`include "uvm_macros.svh"

`include "transaction.svh"
`include "driver.svh"
`include "mon.svh"
`include "spi_config.svh"
`include "agent.svh"

endpackage : agent_pkg

`endif


