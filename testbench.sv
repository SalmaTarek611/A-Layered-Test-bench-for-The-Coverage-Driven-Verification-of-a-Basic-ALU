`include "interface.sv"
`include "test.sv"

module tb_top();
  intf i_intf();
  test t1(i_intf);
  
  alu DUT (.A(i_intf.A),
              .B(i_intf.B),
              .ALU_Sel(i_intf.ALU_Sel),
              .ALU_Out(i_intf.ALU_Out),
            .CarryOut(i_intf.CarryOut));
endmodule
           
                    
                    
                                 
