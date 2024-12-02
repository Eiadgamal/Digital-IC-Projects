module main_decoder
    (
  input wire [6:0] Op,                          // From instruction memory
                                   
  output reg Branch,      
  output reg ALUSrc,
  // output reg MemRead,
  output reg MemWrite,            
  output reg RegWrite,
  output reg Jump,  
  output reg [1:0] ResultSrc,       
  output reg [1:0] ImmSrc,    
  output reg [1:0] ALUOp                                                        
);


always @(*) begin

    case (Op)
        7'b0000011 : begin                               // Load lw
                        // MemRead   = 1'b1;
                        MemWrite  = 1'b0;
                        ImmSrc    = 2'b00;
                        ALUSrc    = 1'b1;
                        ResultSrc = 2'b01;
                        ALUOp     = 2'b00;
                        Branch    = 1'b0;
                        Jump      = 1'b0;
                        RegWrite  = 1'b1; 
                     end 

        7'b0100011 : begin                               // Store sw
                        // MemRead   = 1'b0;
                        MemWrite  = 1'b1;
                        ImmSrc    = 2'b01;
                        ALUSrc    = 1'b1;
                        ResultSrc = 2'b00;
                        ALUOp     = 2'b00;
                        Branch    = 1'b0;
                        Jump      = 1'b0;
                        RegWrite  = 1'b0; 
                     end 
        7'b0110011 : begin                               // R-Type
                        // MemRead   = 1'b0;
                        MemWrite  = 1'b0;
                        ImmSrc    = 2'b00;
                        ALUSrc    = 1'b0;
                        ResultSrc = 2'b00;
                        ALUOp     = 2'b10;
                        Branch    = 1'b0;
                        Jump      = 1'b0;
                        RegWrite  = 1'b1; 
                     end 
        7'b1100011 : begin                               // Branch beq
                        // MemRead   = 1'b0;
                        MemWrite  = 1'b0;
                        ImmSrc    = 2'b10;
                        ALUSrc    = 1'b0;
                        ResultSrc = 2'b00;
                        ALUOp     = 2'b01;
                        Branch    = 1'b1;
                        Jump      = 1'b0;
                        RegWrite  = 1'b1; 
                     end 
        7'b0010011 : begin                               // I-Type  addi
                        // MemRead   = 1'b0;
                        MemWrite  = 1'b0;
                        ImmSrc    = 2'b00;
                        ALUSrc    = 1'b1;
                        ResultSrc = 2'b00;
                        ALUOp     = 2'b10;
                        Branch    = 1'b0;
                        Jump      = 1'b0;
                        RegWrite  = 1'b1; 
                     end
        7'b1101111 : begin                               // J-ype jal
                        // MemRead   = 1'b0;
                        MemWrite  = 1'b0;
                        ImmSrc    = 2'b11;
                        ALUSrc    = 1'b0;
                        ResultSrc = 2'b10;
                        ALUOp     = 2'b00;
                        Branch    = 1'b0;
                        Jump      = 1'b1;
                        RegWrite  = 1'b1; 
                     end
        default : begin                               
                        // MemRead   = 1'b0;
                        MemWrite  = 1'b0;
                        ImmSrc    = 2'b00;
                        ALUSrc    = 1'b0;
                        ResultSrc = 2'b00;
                        ALUOp     = 2'b00;
                        Branch    = 1'b0;
                        Jump      = 1'b0;
                        RegWrite  = 1'b0; 
                     end                                                 
    endcase    
  end
endmodule


