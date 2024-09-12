
class Driver;
  virtual intf vif;
  mailbox gen2drv;
  
  function new(virtual intf vif, mailbox gen2drv);
    this.vif=vif;
    this.gen2drv=gen2drv;
    endfunction
  
  task main;
    #1;
    repeat(1920)
      begin 
        Transaction trans;
        gen2drv.get(trans);
        vif.A<=trans.A;
        vif.B<=trans.B;
        vif.ALU_Sel<=trans.ALU_Sel;
        trans.ALU_Out=vif.ALU_Out;
        trans.CarryOut=vif.CarryOut;
        //trans.display("Driver");
         #5;
      end 
  endtask
endclass
