module sequence_detector_1011_moore(    
input wire clk,
input wire reset,     
input wire in, 
output wire detected 
); 
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100; 
 
reg [2:0] current_state; 
reg [2:0] next_state; 
 
always @(*) begin         
next_state = current_state;         
case (current_state) 
S0: if (in) next_state = S1; else next_state = S0; 
S1: if (!in) next_state = S2; else next_state = S1;             
S2: if (in) next_state = S3; else next_state = S0;             
S3: if (in) next_state = S4; else next_state = S0;             
S4: if (in) next_state = S1; else next_state = S0;             
default: next_state = S0;         
endcase 
end 
 
always @(posedge clk or posedge reset) 
begin         
if (reset) current_state <= S0;         
else current_state <= next_state; 
end 
 
assign detected = (current_state == S4); 
endmodule 
