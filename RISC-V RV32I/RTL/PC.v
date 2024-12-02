module PC # (parameter WIDTH = 32)
    (
  input wire clk, rst,
  input [WIDTH-1:0] PC_IN  ,
                                    
  output reg [WIDTH-1:0] PC_OUT          
);

always @(posedge clk or posedge rst) begin 
    if(rst) begin
        PC_OUT <= 32'd0;
    end else begin
        PC_OUT <= PC_IN;
    end
end

endmodule


