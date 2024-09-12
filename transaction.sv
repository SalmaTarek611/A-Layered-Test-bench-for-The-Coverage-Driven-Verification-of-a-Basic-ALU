class Transaction;
  rand logic [7:0] A,B;
  logic [3:0] ALU_Sel;
  logic [7:0] ALU_Out;
  logic CarryOut;
  function void display(string name);
    //$display("===============");
    $display("%s",name);
    $display("A=%0d, B=%0d, ALU_Sel=%0d, ALU_Out=%0d, CarryOut=%0d",A,B,ALU_Sel,ALU_Out,CarryOut);
    //$display("===============");
  endfunction
  
  covergroup cg;
    option.per_instance=1;
    cover_point_sel: coverpoint ALU_Sel;
  endgroup 
  function new();
  cg=new();
  endfunction
  
endclass