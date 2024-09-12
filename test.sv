`include "env.sv"
program test(intf i_intf);
  Environment env;
  initial 
    begin 
      env=new(i_intf);
      env.run();
    end 
endprogram