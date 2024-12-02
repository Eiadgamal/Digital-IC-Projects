module RISC_V_tb();

// Signal Declaration 
reg clk;
reg rst;

wire [32-1:0] PC_IN_rv;
wire [32-1:0] PC_OUT_rv;
wire [32-1:0] Instruction_rv;  

// DFT 
// reg SI;
// reg SE;
// reg SO;
// reg test_mode;
// reg scan_clk;
// reg scan_rst;
    

integer error_count ;      // 32-bit Signed
integer correct_count ;    // 32-bit Signed

integer i;

parameter CLK_PERIOD =2;

// DUT Instantiation
RISC_V dut(
    .clk(clk),
    .rst(rst),
    .PC_IN_rv      (PC_IN_rv),
    .PC_OUT_rv     (PC_OUT_rv),
    .Instruction_rv(Instruction_rv)
    );

// Clock generation
initial begin 
   clk=1'b0;
   error_count = 0;
   correct_count = 0; 
   forever #(CLK_PERIOD/2) clk=~clk;
end

// Reset generation
initial begin 
   rst=1'b1;
    #(5*(CLK_PERIOD/2)) rst=~rst;
end



// initial begin

   // $readmemb("J:\\Collage\\Graduation Project\\RTL\\cp_r.txt",in_matlab_r);
   // $readmemb("J:\\Collage\\Graduation Project\\RTL\\cp_i.txt",in_matlab_i);

// VALID = 1;


//    wait(READy_out==1);
//       for (i = 1; i < 15; i = i + 1) begin
//          if (i == 1 || i == 8 ) begin     
//             for (int j = 0; j < 2208; j=j+1) begin
//                @(negedge clk);
//                mem_out_r[i-1][j] = data_out_r;
//                mem_out_i[i-1][j] = data_out_i;           
//             end                  
//          end else begin
//             for (int k = 0; k < 2192; k=k+1) begin
//                @(negedge clk);
//                mem_out2_r[i-1][k] = data_out_r;
//                mem_out2_i[i-1][k] = data_out_i;
//             end            
//          end
//       end

//       wait(READy_out==0); 
//             for (int c = 0; c < 2048; c=c+1) begin      
//                   @(posedge clk);
//             for (int q = 0; q < 14; q=q+1) begin
//                if (q == 0 || q == 7 ) begin                   
//                  if (mem_out_r[q][c+160]==in_matlab_r[q][c] && mem_out_i[q][c+160]==in_matlab_i[q][c]) begin
//                      correct_count = correct_count +1;
//                      // $display("%t : CyclicPrefix WORKS for 7 ",$time);
//                   end else begin
//                      error_count = error_count +1;
//                      $display("%t : Error2 in index  %0d ,, %0d ,, %0d ",$time,c,mem_out_r[q][c+160],in_matlab_r[q][c]);
//                   end
//                end else begin
//                  if (mem_out2_r[q][c+144]==in_matlab_r[q][c] && mem_out2_i[q][c+144]==in_matlab_i[q][c]) begin
//                      correct_count = correct_count +1;
//                      // $display("%t : CyclicPrefix WORKS for 1 ",$time);
//                   end else begin
//                      error_count = error_count +1;
//                      $display("%t : Error3 in index  %0d ,, %0d ,, %0d ",$time,c,mem_out2_r[q][c+144],in_matlab_r[q][c]);
//                   end                  
//                end
//             end

//          end        


   // #5000; 
 // $stop;

 
 // end 

endmodule 