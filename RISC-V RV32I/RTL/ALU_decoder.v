module ALU_decoder
    (
  input wire Op5,     
  input wire [1:0] ALUOp,
  input wire [2:0] Func3,
  input wire  Func7,                   
                                    
   
  output reg [2:0] ALU_control                                                        
);


always @(*) begin

        casex({ALUOp,Func3,Op5,Func7})

        7'b00_xxx_xx : ALU_control = 3'b000;
        7'b01_xxx_xx : ALU_control = 3'b001;
        7'b10_000_00 : ALU_control = 3'b000;
        7'b10_000_01 : ALU_control = 3'b000;
        7'b10_000_10 : ALU_control = 3'b000;
        7'b10_000_11 : ALU_control = 3'b001;
        7'b10_010_xx : ALU_control = 3'b101;
        7'b10_110_xx : ALU_control = 3'b011;
        7'b10_111_xx : ALU_control = 3'b010;

        default : ALU_control = 3'b000;

    endcase    
  end
endmodule


