module PC_adder # (parameter WIDTH = 32)
    (
        
  input wire [WIDTH-1:0] in1,
  input wire [WIDTH-1:0] in2,  
                                   
  output  [WIDTH-1:0] out            
);


assign out = in1 + in2;

endmodule


