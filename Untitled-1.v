module pwm_controled (
input reg [5:0] duty,
input clk,
input enable,
input reset,
output pwm
);
parameter final= 128 ;
parameter bits = $clog2(final);

reg [bits:0] Q_reg,Q_next;
wire tkl;
timer #(.final(final)) timer_c (.clk(clk),.enable(enable),.reset(reset),.tkl(tkl));

always @(posedge clk or posedge reset)
begin 
  if(reset)
    Q_reg <= 0;
  else if(tkl)
  Q_reg <= Q_next  ;
  end
   always@(*)
   Q_next = Q_reg+1;
   
   assign pwm =duty>Q_reg? 1'b0 :1'b1;
   
  
endmodule 