module Register_File # (parameter WIDTH = 32)
    (
  input wire clk, rst,
  input wire RegWrite,                   // Signal comming from control unit to enable write register
  input wire [4:0] Rs1,
  input wire [4:0] Rs2,
  input wire [4:0] Write_register,
  input wire [WIDTH-1:0] Write_data,     
                                    
  output  [WIDTH-1:0] Rd1,
  output  [WIDTH-1:0] Rd2             
);

    reg [WIDTH-1:0] register [WIDTH-1:0];

    integer i;

always @(posedge clk or posedge rst) begin 
    if(rst) begin
        for (i = 0; i < 32 ; i=i+1) begin
            register[i] <= 0;
        end
    end else begin
        if (RegWrite) begin
            register[Write_register] <= Write_data ;
        end else begin
            register[Write_register] <= register[Write_register] ;
        end
    end
end

assign Rd1 = register[Rs1];
assign Rd2 = register[Rs2];

endmodule


