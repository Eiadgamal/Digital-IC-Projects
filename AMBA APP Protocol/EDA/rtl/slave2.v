module slave2 # (parameter WIDTH = 32)
    (
  input wire PCLK,PRESETn,
  input wire PWRITE,                  
  input wire PSEL,                     
  input wire PENABLE,                                                   
  input wire [WIDTH-1:0] paddr,         
  input wire [WIDTH-1:0] pwdata,

  output reg PREADY2,                    
  output reg [WIDTH-1:0] prdata2           
                                           
);

reg [WIDTH-1:0] slave_memory [127:0];

integer i;

always @(posedge PCLK or negedge PRESETn) begin
    if(!PRESETn) begin
         for (i = 0; i < 128 ; i=i+1) begin
             slave_memory[i] <=0;
         end
         PREADY2 <= 0;
         prdata2 <= 7'b0;
    end else begin
         if (PENABLE && PSEL && PWRITE) begin              // Write in memory
             PREADY2 <= 1;
             slave_memory[paddr] <= pwdata;
         end else if (PENABLE && PSEL && !PWRITE) begin    // Just read from memory 
             PREADY2 <= 1;
             prdata2 <= slave_memory[paddr];
         end else begin
             PREADY2 <= 0;
         end
    end
end

endmodule


