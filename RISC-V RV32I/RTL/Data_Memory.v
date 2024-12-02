module Data_Memory # (parameter WIDTH = 32)
    (
  input wire clk, rst,
  input [WIDTH-1:0] A,
  input [WIDTH-1:0] WD,  
  input wire WE,
                                    
  output reg [WIDTH-1:0] RD          
);

always @(posedge clk or posedge rst) begin 
    if(rst) begin
        RD <= 32'd0;
    end else begin
        if (WE) begin
            RD <= WD;               //  Store in the memory sw operation
        end else begin
            RD <= A;                //  Load from the memory lw operation
        end
    end
end

endmodule


