module Instruction_memory # (parameter WIDTH = 32)
    (    
  input [WIDTH-1:0] Read_address,
                                    
  output reg [WIDTH-1:0] Instruction          
);

reg [WIDTH-1:0] memory[0:20];

// initial begin

// $readmemh("J:/Post Graduate/Digital IC/Projects/RISC-V RV32I/RTL/MEM.hex",memory);

// memory[0]  = 32'h00500113; //addi x2, x0, 5
// memory[1]  = 32'h00C00193; //addi x3, x0, 12
// memory[2]  = 32'hff718393; //addi x7, x3, -9
// memory[3]  = 32'h0023E233; //or x4, x7, x2
// memory[4]  = 32'h0041F2B3; //and x5, x3, x4
// memory[5]  = 32'h004282B3; //add x5, x5, x4
// memory[6]  = 32'h02728863; //beq x5, x7, end
// memory[7]  = 32'h0041A233; //slt x4, x3, x4
// memory[8]  = 32'h00020463; //beq x4, x0, around
// memory[9]  = 32'h00000293; //addi x5, x0, 0
// memory[10] = 32'h0023A233; //around: slt x4, x7, x2
// memory[11] = 32'h005203B3; //add x7, x4, x5
// memory[12] = 32'h402383B3; //sub x7, x7, x2
// memory[13] = 32'h0471AA23; //sw x7, 84(x3)
// memory[14] = 32'h06002103; //lw x2, 96(x0)
// memory[15] = 32'h005104B3; //add x9, x2, x5
// memory[16] = 32'h008001EF; //jal x3, end
// memory[17] = 32'h00100113; //addi x2, x0, 1
// memory[18] = 32'h00910133; //end: add x2, x2, x9
// memory[19] = 32'h0221A023; //sw x2, 0x20(x3)
// memory[20] = 32'h00210063; //done: beq x2, x2, done

// memory[0]  = 32'h00500113; //addi x2, x0, 5
// memory[1]  = 32'h00C00193; //addi x3, x0, 12
// memory[2]  = 32'hff718393; //addi x7, x3, -9

// memory[0]  = 32'b00000000101000000000000010010011;  // addi x1, x0, 10
// memory[1]  = 32'b00000001010000000000000100010011;  // addi x2, x0, 20
// memory[2]  = 32'b00000010100000000000000110010011;  // addi x3, x0, 40
// memory[3]  = 32'b00000101000000000000001000010011;  // addi x4, x0, 80
// memory[4]  = 32'b00001010000000000000001010010011;  // addi x5, x0, 160


// end

// always @(posedge clk or posedge rst) begin
//     if(rst) begin  
// memory[0]  <= 32'h00500113; //addi x2, x0, 5
// memory[1]  <= 32'h00C00193; //addi x3, x0, 12
// memory[2]  <= 32'hff718393; //addi x7, x3, -9
// memory[3]  <= 32'h0023E233; //or x4, x7, x2
// memory[4]  <= 32'h0041F2B3; //and x5, x3, x4
// memory[5]  <= 32'h004282B3; //add x5, x5, x4
// memory[6]  <= 32'h02728863; //beq x5, x7, end
// memory[7]  <= 32'h0041A233; //slt x4, x3, x4
// memory[8]  <= 32'h00020463; //beq x4, x0, around
// memory[9]  <= 32'h00000293; //addi x5, x0, 0
// memory[10] <= 32'h0023A233; //around: slt x4, x7, x2
// memory[11] <= 32'h005203B3; //add x7, x4, x5
// memory[12] <= 32'h402383B3; //sub x7, x7, x2
// memory[13] <= 32'h0471AA23; //sw x7, 84(x3)
// memory[14] <= 32'h06002103; //lw x2, 96(x0)
// memory[15] <= 32'h005104B3; //add x9, x2, x5
// memory[16] <= 32'h008001EF; //jal x3, end
// memory[17] <= 32'h00100113; //addi x2, x0, 1
// memory[18] <= 32'h00910133; //end: add x2, x2, x9
// memory[19] <= 32'h0221A023; //sw x2, 0x20(x3)
// memory[20] <= 32'h00210063; //done: beq x2, x2, done
//     end
// end

// //assign Instruction = (Read_address >> 2) <= 32'd80 ? memory[Read_address[6:0] >> 2] : 32'b0;

// always @(posedge clk or posedge rst) begin
//     if (rst) begin
//         Instruction <= 32'b0;  // Default value for out-of-bounds addresses
//     end else begin
//         if (Read_address[6:0] >> 2 < 32'd80) begin
//             Instruction <= memory[Read_address[6:0] >> 2];  // Address in range
//         end else if (Read_address[6:0] >> 2 == 32'd80) begin
//             Instruction <= memory[Read_address[6:0] >> 2];  // Address in range   
//         end else begin
//             Instruction <= 32'b0;  // Default value for out-of-bounds addresses
//         end        
//     end
// end

always @* begin
    memory[0]  = 32'h00500113; // addi x2, x0, 5
    memory[1]  = 32'h00C00193; // addi x3, x0, 12
    memory[2]  = 32'hff718393; // addi x7, x3, -9
    memory[3]  = 32'h0023E233; // or x4, x7, x2
    memory[4]  = 32'h0041F2B3; // and x5, x3, x4
    memory[5]  = 32'h004282B3; // add x5, x5, x4
    memory[6]  = 32'h02728863; // beq x5, x7, end
    memory[7]  = 32'h0041A233; // slt x4, x3, x4
    memory[8]  = 32'h00020463; // beq x4, x0, around
    memory[9]  = 32'h00000293; // addi x5, x0, 0
    memory[10] = 32'h0023A233; // around: slt x4, x7, x2
    memory[11] = 32'h005203B3; // add x7, x4, x5
    memory[12] = 32'h402383B3; // sub x7, x7, x2
    memory[13] = 32'h0471AA23; // sw x7, 84(x3)
    memory[14] = 32'h06002103; // lw x2, 96(x0)
    memory[15] = 32'h005104B3; // add x9, x2, x5
    memory[16] = 32'h008001EF; // jal x3, end
    memory[17] = 32'h00100113; // addi x2, x0, 1
    memory[18] = 32'h00910133; // end: add x2, x2, x9
    memory[19] = 32'h0221A023; // sw x2, 0x20(x3)
    memory[20] = 32'h00210063; // done: beq x2, x2, done

    // Output based on Read_address (combinational)
    if ((Read_address >> 2) <= 32'd20)
        Instruction = memory[Read_address >> 2];
    else
        Instruction = 32'b0;  // Return 0 for out-of-bound address
end

//assign Instruction = memory[Read_address];

endmodule


