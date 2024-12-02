module MUX_3X1 # (parameter WIDTH = 32)
    (
  input wire [WIDTH-1:0] A1,
  input wire [WIDTH-1:0] B1,
  input wire [WIDTH-1:0] C1,  
  input wire [1:0] selection,     
                                   
  output reg [WIDTH-1:0] D1            
);


always @(*) begin

    casex (selection)
        2'b00 : D1 = B1;  // ALU result
        2'b01 : D1 = A1;  // RD mem
        2'b10 : D1 = C1;  // PC_next
        2'b11 : D1 = 32'dx;  // PC_next        
    endcase
    
end

endmodule


