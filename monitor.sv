class Monitor;
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  task main;
    #2;
    repeat(1920) 
      begin 
        Transaction trans;
        trans=new();
        trans.A=vif.A;
        trans.B=vif.B;
        trans.ALU_Sel=vif.ALU_Sel;
        trans.ALU_Out=vif.ALU_Out;
        trans.CarryOut=vif.CarryOut;
        mon2scb.put(trans);
        //trans.display("Monitor");
        #5;
      end 
  endtask
endclass

  
    