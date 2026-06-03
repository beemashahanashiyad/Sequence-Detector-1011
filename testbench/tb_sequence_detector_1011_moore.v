module tb_sequence_detector_1011_moore; 
reg clk;     
reg reset;     
reg in;    
wire detected; 
 
sequence_detector_1011_moore DUT ( 
   .clk(clk), 
   .reset(reset), 
   .in(in), 
   .detected(detected) 
); 
 
parameter CLK_PERIOD = 20;     
initial begin 
clk = 0; 
forever #(CLK_PERIOD/2) clk = ~clk;     
end 
 
initial begin         
reset = 1;         
in = 0; 
#10; 
        @(posedge clk) reset = 0; 
        @(posedge clk) in = 1; 
        @(posedge clk) in = 0; 
        @(posedge clk) in = 1; 
        @(posedge clk) in = 1; 
        @(posedge clk) in = 0; 
        @(posedge clk) in = 1; 
        @(posedge clk) in = 0; 
        @(posedge clk) in = 1; 
        @(posedge clk) in = 1; 
        @(posedge clk) in = 1; 
        @(posedge clk) in = 0; 
        @(posedge clk) in = 1; 
        @(posedge clk) in = 0; 
        @(posedge clk) in = 1; 
        @(posedge clk) in = 0; 
        @(posedge clk) in = 1; 
 
@(posedge clk) $display("Time: %0t | Simulation Finished", $time); 
#10 $finish;     
end 
 
initial begin 
$monitor("Time: %0t | reset=%b, in=%b | detected=%b", $time, reset, in, detected); 
end 
 
initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars; 
end 
endmodule 
