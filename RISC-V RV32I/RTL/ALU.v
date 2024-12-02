module ALU # (parameter WIDTH = 32)
    (
  input wire [WIDTH-1:0] SrcA,
  input wire [WIDTH-1:0] SrcB,
  input wire [2:0] ALU_control,   
                                   
  output reg Zero,                                 
  output reg [WIDTH-1:0] ALU_result            
);


always @(*) begin

    casex (ALU_control)
        3'b000 : ALU_result = SrcA + SrcB;
        3'b001 : ALU_result = SrcA - SrcB;
        3'b010 : ALU_result = SrcA & SrcB;
        3'b011 : ALU_result = SrcA | SrcB;

        3'b100 : ALU_result = 32'dx;
        3'b110 : ALU_result = 32'dx;
        3'b111 : ALU_result = 32'dx;
        
        3'b101 : ALU_result = (SrcA < SrcB) ? 32'd1 : 32'd0;                // slt  set less than
           
    endcase

    if (ALU_result == 32'd0) begin
        Zero = 1;
    end else begin
        Zero = 0;
    end
    
end

endmodule


