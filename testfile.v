module test();
 reg clk, rst, in;
 wire det;
 harshit_des dut (clk, rst, in, det);

 always begin
   #10 clk = 1;
   #10 clk = 0;
 end

 
 initial begin
   rst = 1'b1;
   #20; 
   rst = 1'b0;

   
   in = 1'b1;
   #20;
   in = 0;
   #20;
   in = 1;
   #20;
   

   
   in = 1'b1;
   #20;
   in = 1;
   #20;
   in = 0;
   #20;
   in = 0;
   #20;
 
   
       
       in = 1'b0;
       #20;
       in = 0;
       #20;
       in = 1;
       #20;
       in = 0;
       #20;
       
       
    in = 1'b1;
           #20;
           in = 0;
           #20;
           in = 0;
           #20;
           in = 0;
           #20;
          
   $finish;
 end

 always @(posedge clk) begin
   if (det !== 0) begin
     $display("det: %d", det);
   end
 end

endmodule
