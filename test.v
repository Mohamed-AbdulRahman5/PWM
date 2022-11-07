`timescale 1ns / 1ps

module test();
  
reg clk ,enable,reset ;
wire tkl ;
parameter final = 64 ;


timer #(.final(final)) u1(.clk(clk),.enable(enable),.reset(reset),.tkl(tkl));


always #2 clk= ~clk ;

initial
begin
clk =1'b1 ;
#5 reset =1'b1;
#2 reset =1'b0;
enable =1'b1 ;
 #1024 
  #1024 
   #1024 
    #1024 
    enable = 1'b0;
    
end

endmodule  
  


   