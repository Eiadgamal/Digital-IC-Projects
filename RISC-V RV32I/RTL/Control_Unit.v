module Control_Unit
    (
  input wire [6:0] Op,                          // From instruction memory
  input wire [2:0] Func3,
  input wire Func7,
  input wire Zero, 
                                   
  output  PCSrc,     
  output  ALUSrc,
  // output reg MemRead,  
  output  MemWrite,          
  output  RegWrite,
  output  [2:0] ALU_control,      
  output  [1:0] ResultSrc,       
  output  [1:0] ImmSrc                                                          
);


    wire [1:0] ALUOp_c;
    wire PC_Update;
    wire Branch_c;
    wire zerobranch;


///********************************************************///
//////////////////// Main Decoder UNIT /////////////////////
///********************************************************///

main_decoder dec(
    .Op(Op),
    .Branch(Branch_c),
    .ALUSrc(ALUSrc),
    // .MemRead(MemRead),
    .MemWrite(MemWrite),
    .RegWrite(RegWrite),    
    .Jump(PC_Update),
    .ResultSrc(ResultSrc),    
    .ImmSrc(ImmSrc),
    .ALUOp(ALUOp_c) 
    );

///********************************************************///
//////////////////// ALU Decoder UNIT /////////////////////
///********************************************************///

ALU_decoder aludec(
    .Op5(Op[5]),
    .ALUOp(ALUOp_c),
    .Func3(Func3),
    .Func7(Func7),
    .ALU_control(ALU_control) 
    );


assign zerobranch = Zero & Branch_c ;
assign PCSrc = zerobranch | PC_Update ;

endmodule


