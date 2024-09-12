class Scoreboard;
  Transaction trans;
  mailbox mon2scb;
  parameter add=4'b0000,
  sub=4'b0001,
  mul=4'b0010,
  div=4'b0011,
  shl=4'b0100,
  shr=4'b0101,
  rol=4'b0110,
  ror=4'b0111,
  AND=4'b1000,
  OR=4'b1001,
  XOR=4'b1010,
  NOR=4'b1011,
  NAND=4'b1100,
  XNOR=4'b1101,
  greater_comp=4'b1110,
  eq_comp=4'b1111;
  logic[8:0] out;
  string mssg;
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction 
  task main;
    #3;
    repeat(1920)
      begin
        mon2scb.get(trans);
        case(trans.ALU_Sel) 
            add:out=trans.A+trans.B;
            sub:out=trans.A-trans.B;
            mul:out=trans.A*trans.B;
            div:out=trans.A/trans.B;
            shl:out=trans.A<<1;
            shr:out=trans.A>>1;
            rol:out={trans.A[6:0],trans.A[7]};
            ror:out={trans.A[0],trans.A[7:1]};
            AND:out=trans.A & trans.B;
            OR:out=trans.A|trans.B;
            XOR:out=trans.A^trans.B;
            NOR:out=~(trans.A|trans.B);
            NAND:out=~(trans.A & trans.B);
            XNOR:out=trans.A~^trans.B;
            greater_comp:out=(trans.A>trans.B)?8'd1:8'd0;
            eq_comp:out=(trans.A==trans.B)?8'd1:8'd0;
        endcase
        if(trans.ALU_Sel!=add) begin
          if( (out[7:0]==trans.ALU_Out)) begin
           mssg="Scoreboard: Test passed";
           trans.cg.sample();
          end 
        else 
          mssg="Scoreboard: Test failed";
        end 
        else begin 
          if( (out[7:0]==trans.ALU_Out) & out[8]==trans.CarryOut)begin
          mssg="Scoreboard: Test passed";
           trans.cg.sample();
          end  
        else 
          mssg="Scoreboard: Test failed";
        end 
        trans.display(mssg);
        //$display("%0b",out);
        #5;
      end 
  endtask
endclass
            