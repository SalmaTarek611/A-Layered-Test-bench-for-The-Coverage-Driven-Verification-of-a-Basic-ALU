`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class Environment;
  Generator gen;
  Driver drv;
  Monitor mon;
  Scoreboard scb;
  mailbox m1;
  mailbox m2;
  virtual intf vif;
  function new(virtual intf vif);
    this.vif=vif;
    m1=new();
    m2=new();
    gen=new(m1);
    drv=new(vif,m1);
    mon=new(vif,m2);
    scb=new(m2);
  endfunction
  task test();
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
      gen.display_coverage();
    join
  endtask
  task run;
    test();
    $finish;
  endtask
endclass
