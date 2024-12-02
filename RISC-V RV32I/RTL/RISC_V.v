module RISC_V # (parameter WIDTH = 32)
    (
  input  wire clk,rst,
  input  wire [WIDTH-1:0] PC_IN_rv,
  output wire [WIDTH-1:0] PC_OUT_rv,
  output wire [WIDTH-1:0] Instruction_rv                                                                   
);

    //wire [WIDTH-1:0] PC_IN_rv;
    //wire [WIDTH-1:0] PC_OUT_rv;
    //wire [WIDTH-1:0] Instruction_rv;
    wire [WIDTH-1:0] WD_rv;             // data mem out
    wire [WIDTH-1:0] Read_data1;        // reg file out1
    wire [WIDTH-1:0] Read_data2;        // reg file out1         
    wire [WIDTH-1:0] ImmExt_rv;         // out immediate
    wire [WIDTH-1:0] SrcB_rv;           // in2 ALU
    wire [WIDTH-1:0] ALU_result_rv;     // ALU out to mux33 or data mem  
    wire [WIDTH-1:0] RD_rv;             // data mem out to mux333
    wire [WIDTH-1:0] PC_Plus4_rv;       // adder out
    wire [WIDTH-1:0] PC_target_rv;    


    wire [1:0] ImmSrc_rv;
    wire [1:0] ResultSrc_rv;
    wire [2:0] ALU_control_rv ;

    wire RegWrite_rv;
    wire ALUSrc_rv;
    wire PCSrc_rv;
    wire Zero_rv;
    wire MemWrite_rv;


///********************************************************///
//////////////////// PC UNIT /////////////////////
///********************************************************///

PC  # (.WIDTH(32)) u0(
    .clk(clk),
    .rst(rst),
    .PC_IN(PC_IN_rv),           // in from mux either pc+4 or pc+immExt
    .PC_OUT(PC_OUT_rv) 
    );

///********************************************************///
//////////////////// Instruction Memory UNIT /////////////////////
///********************************************************///

Instruction_memory # (.WIDTH(32)) u1(
    .Read_address(PC_OUT_rv),
    .Instruction(Instruction_rv) 
    );

///********************************************************///
//////////////////// Register File UNIT /////////////////////
///********************************************************///

Register_File # (.WIDTH(32)) u2(
    .clk(clk),
    .rst(rst),
    .RegWrite(RegWrite_rv),
    .Rs1(Instruction_rv[19:15]),
    .Rs2(Instruction_rv[24:20]),
    .Write_register(Instruction_rv[11:7]),
    .Write_data(WD_rv),  // mux 333 out
    .Rd1(Read_data1),
    .Rd2(Read_data2)                     
    );

///********************************************************///
//////////////////// Immediate Gen UNIT /////////////////////
///********************************************************///

Immediate_generator # (.WIDTH(32)) u3(
    .Instruction(Instruction_rv[31:7]),
    .ImmSrc(ImmSrc_rv), //control unit
    .ImmExt(ImmExt_rv)  // mux -> ALU     
    );

///********************************************************///
//////////////////// Mux 2x1 UNIT (REG -> ALU) /////////////////////
///********************************************************///

MUX_2X1 # (.WIDTH(32)) u4(
    .A(Read_data2),
    .B(ImmExt_rv), 
    .sel(ALUSrc_rv),     
    .C(SrcB_rv)  
    );

///********************************************************///
//////////////////// ALU UNIT  /////////////////////
///********************************************************///

ALU # (.WIDTH(32)) u5(
    .SrcA(Read_data1),
    .SrcB(SrcB_rv), 
    .ALU_control(ALU_control_rv),  // from cnt unit     
    .Zero(Zero_rv),   // to cnt unit
    .ALU_result(ALU_result_rv) // to data mem and mux333      
    );

///********************************************************///
//////////////////// Data Memory UNIT  /////////////////////
///********************************************************///

Data_Memory # (.WIDTH(32)) u6(
    .clk(clk),
    .rst(rst),    
    .A(ALU_result_rv),
    .WD(Read_data2), 
    .WE(MemWrite_rv),  // from cnt unit     
    .RD(RD_rv) // to mux333 -> reg file       
    );

///********************************************************///
//////////////////// Control UNIT  /////////////////////
///********************************************************///

Control_Unit u7(
    .Op(Instruction_rv[6:0]),
    .Func3(Instruction_rv[14:12]),    
    .Func7(Instruction_rv[30]),
    .Zero(Zero_rv), 
    .PCSrc(PCSrc_rv),   // to mux2x1 before pc 
    .ALUSrc(ALUSrc_rv),
    .MemWrite(MemWrite_rv), 
    .RegWrite(RegWrite_rv),
    .ALU_control(ALU_control_rv), 
    .ResultSrc(ResultSrc_rv),  // to mux333
    .ImmSrc(ImmSrc_rv)                    
    );

///********************************************************///
//////////////////// PC adder UNIT  /////////////////////
///********************************************************///

PC_adder # (.WIDTH(32)) u8(
    .in1(PC_OUT_rv),
    .in2(32'd4),    
    .out(PC_Plus4_rv) // in1 to mux2x1 before pc 
    );

///********************************************************///
//////////////////// PC Target UNIT  /////////////////////
///********************************************************///

PC_adder # (.WIDTH(32)) u9(
    .in1(PC_OUT_rv),
    .in2(ImmExt_rv),    
    .out(PC_target_rv) // in2 to mux2x1 before pc 
    );

///********************************************************///
//////////////////// Mux 2x1 UNIT (Before PC) /////////////////////
///********************************************************///

MUX_2X1 # (.WIDTH(32)) u10(
    .A(PC_Plus4_rv),
    .B(PC_target_rv), 
    .sel(PCSrc_rv),     
    .C(PC_IN_rv)  
    );

///********************************************************///
//////////////////// Mux 3x1 UNIT (After data mem) ///////////////
///********************************************************///

MUX_3X1 # (.WIDTH(32)) u11(
    .A1(RD_rv),
    .B1(ALU_result_rv), 
    .C1(PC_Plus4_rv),                 // pcPlus4    
    .selection(ResultSrc_rv),
    .D1(WD_rv)  
    );



endmodule


