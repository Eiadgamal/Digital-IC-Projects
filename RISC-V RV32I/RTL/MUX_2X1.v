module MUX_2X1 # (parameter WIDTH = 32)
    (
  input wire [WIDTH-1:0] A,
  input wire [WIDTH-1:0] B,
  input wire sel,     
                                   
  output reg [WIDTH-1:0] C            
);


always @(*) begin

    if (sel) begin
        C = B;
    end else begin
        C = A;
    end
    
end

endmodule


