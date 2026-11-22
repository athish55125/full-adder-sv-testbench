`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator  gen;
  driver     driv;
  monitor    mon;
  scoreboard scb;
  mailbox #(transaction) m1;   // generator -> driver
  mailbox #(transaction) m2;   // monitor   -> scoreboard
  virtual intf vif;
  int count = 16;              // number of random transactions

  function new(virtual intf vif);
    this.vif = vif;
    m1   = new();
    m2   = new();
    gen  = new(m1, count);
    driv = new(vif, m1, count);
    mon  = new(vif, m2, count);
    scb  = new(m2, count);
  endfunction

  task test();
    fork
      gen.main();
      driv.main();
      mon.main();
      scb.main();
    join
  endtask

  task run;
    test();
    $finish;
  endtask
endclass
