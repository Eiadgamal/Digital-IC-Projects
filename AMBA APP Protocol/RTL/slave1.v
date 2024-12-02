module slave1 # (parameter WIDTH = 32)
    (
  input wire PCLK,PRESETn,
  input wire PWRITE,                  
  input wire PSEL,                     
  input wire PENABLE,                                                   
  input wire [WIDTH-1:0] paddr,         
  input wire [WIDTH-1:0] pwdata,

  output reg PREADY1,                    
  output reg [WIDTH-1:0] prdata1       // address           
                                           
);

// reg [WIDTH-1:0] slave_address;
reg [WIDTH-1:0] slave_memory [63:0];

integer i;

always @(posedge PCLK) begin
    if(~PRESETn) begin
         for (i = 0; i < 64 ; i=i+1) begin
             slave_memory[i] <=0;
         end
         PREADY1 <= 0;
         prdata1 <= 32'b0;
    end else begin
         if (PENABLE && PSEL && PWRITE) begin              // Write in memory
             PREADY1 <= 1;
             slave_memory[paddr] <= pwdata;
         end else if (PENABLE && PSEL && !PWRITE) begin    // Just read from memory 
             PREADY1 <= 1;
             prdata1 <= slave_memory[paddr];
         end else begin
             PREADY1 <= 0;
         end
    end
end


// assign prdata1 = slave_memory[slave_address];

endmodule


