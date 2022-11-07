module nig ;
  
reg [5:0] duty ;
reg enable,reset,clk;
wire pwm;

pwm_controled u1 (.duty(duty),.enable(enable),.reset(reset),.clk(clk),.pwm(pwm));
  
initial 
begin
 
clk= 1'b0;
#2 reset =1'b1;
#2 reset =1'b0;
duty =6'b001111;
end   
always #5 clk =~clk;
initial
begin
 enable =1'b1;
  
  
  
end  
endmodule  