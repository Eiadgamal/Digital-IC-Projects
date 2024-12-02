module Immediate_generator # (parameter WIDTH = 32)
    (
  input wire [31:7] Instruction,
  input wire [1:0] ImmSrc,   
                                   
  output reg [WIDTH-1:0] ImmExt            
);


always @(*) begin

    case (ImmSrc)
        2'b00 : ImmExt={{20{Instruction[31]}},Instruction[31:20]};                                          // I-type
        2'b01 : ImmExt={{20{Instruction[31]}},Instruction[31:25],Instruction[11:7]};                        // S-type
        2'b10 : ImmExt={{20{Instruction[31]}},Instruction[7],Instruction[30:25],Instruction[11:8],1'b0};    // B-type
        2'b11 : ImmExt={{12{Instruction[31]}},Instruction[19:12],Instruction[20],Instruction[30:21],1'b0};  // J-type        
    endcase
    
end

endmodule


