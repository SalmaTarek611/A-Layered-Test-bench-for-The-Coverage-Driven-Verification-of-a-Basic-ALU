class Generator; 
  Transaction trans;
  mailbox gen2drv;
  logic flag;
  event done;
  function new (mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  task main();
   for(int i=0;i<16;i++) begin 
     repeat(120)
        begin 
          trans=new();
          trans.ALU_Sel=i;
          trans.randomize();
          //trans.display("Generator:");
          gen2drv.put(trans);
          #5;
        end
    end 
    -> done;
  endtask
  task display_coverage();
    @done.triggered;
    $display("*****Coverage=%f%*****",trans.cg.get_coverage());
  endtask
endclass
