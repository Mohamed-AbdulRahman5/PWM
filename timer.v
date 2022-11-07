module timer #(parameter final=1024 )(
input clk ,
input enable,
input reset,
output tkl 

); 
 
parameter bits = $clog2(final);
reg  unsigned [bits:0 ] Q_next , Q_reg;
//counter register 
always @(posedge clk or posedge reset )
 begin
 if(reset)
   Q_reg <= 'b0;
   else if(enable)
     Q_reg <= Q_next;
   end 
   
   //output logic
 assign   tkl = (Q_reg==final) ;
 //nex state logic 
 always @(*)
 Q_next = tkl? 'b0: (Q_reg+1) ;
 
 endmodule 