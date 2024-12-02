module APB # (parameter WIDTH = 32)
    (
  input wire PCLK,PRESETn,
  input wire transfer,
  input wire read_write,                 // Bridge output
  input wire [WIDTH:0] write_paddr,      // Bridge output
  input wire [WIDTH:0] read_paddr,       // Bridge output
  input wire [WIDTH-1:0] write_data,     // Bridge output

  output wire PSLVERR,
  output wire [WIDTH-1:0] read_data_out   // Bridge input                                                                   
);

    wire PWRITE_APB;
    wire PSEL1_APB;
    wire PSEL2_APB;
    wire PENABLE_APB;
    wire PENABLE_slave1;
    wire PENABLE_slave2;    
    wire PREADY_APB;  // select either slave 1 or 2
    wire PREADY_slave1;
    wire PREADY_slave2;


    wire [WIDTH:0] paddr_APB;  
    wire [WIDTH-1:0] pwdata_APB;             
    wire [WIDTH-1:0] prdata_APB;
    wire [WIDTH-1:0] prdata_slave1;
    wire [WIDTH-1:0] prdata_slave2;


assign PREADY_APB = (paddr_APB[32] == 1)? PREADY_slave1:PREADY_slave2 ;
assign prdata_APB = (read_write == 0)? ((paddr_APB[32] == 1)? prdata_slave1:prdata_slave2) :32'b0 ;
assign PENABLE_slave1 = (paddr_APB[32] == 1)? PENABLE_APB:0 ;
assign PENABLE_slave2 = (paddr_APB[32] == 0)? PENABLE_APB:0 ;

///********************************************************///
//////////////////// Master APB UNIT /////////////////////
///********************************************************///

masterAPB  # (.WIDTH(32)) u0(
    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .transfer(transfer),
    .read_write(read_write),
    .write_paddr(write_paddr),
    .read_paddr(read_paddr),
    .write_data(write_data),
    .read_data_out(read_data_out),
    .PSLVERR(PSLVERR),
    .PSEL1(PSEL1_APB),
    .PSEL2(PSEL2_APB),
    .PWRITE(PWRITE_APB),
    .PREADY(PREADY_APB),
    .prdata(prdata_APB),
    .PENABLE(PENABLE_APB),
    .paddr(paddr_APB),
    .pwdata(pwdata_APB)
    );

///********************************************************///
//////////////////// Slave1 UNIT /////////////////////
///********************************************************///

slave1 # (.WIDTH(32)) u1(
    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .PWRITE(PWRITE_APB),
    .PSEL(PSEL1_APB),
    .paddr(paddr_APB[31:0]),
    .PREADY1(PREADY_slave1),
    .pwdata(pwdata_APB),
    .PENABLE(PENABLE_slave1),
    .prdata1(prdata_slave1) 
    );

///********************************************************///
//////////////////// Slave2 UNIT /////////////////////
///********************************************************///

slave2 # (.WIDTH(32)) u2(
    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .PWRITE(PWRITE_APB),
    .PSEL(PSEL2_APB),
    .paddr(paddr_APB[31:0]),
    .PREADY2(PREADY_slave2),
    .pwdata(pwdata_APB),
    .PENABLE(PENABLE_slave2),
    .prdata2(prdata_slave2) 
    );

endmodule