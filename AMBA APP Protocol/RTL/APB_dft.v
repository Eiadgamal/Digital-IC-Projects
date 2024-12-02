module APB_dft # (parameter WIDTH = 7 , NUM_OF_CHAINS = 19)
    (
  input wire PCLK,PRESETn,
  input wire transfer,
  input wire read_write,                 // Bridge output
  input wire [WIDTH:0] write_paddr,      // Bridge output
  input wire [WIDTH:0] read_paddr,       // Bridge output
  input wire [WIDTH-1:0] write_data,     // Bridge output

// DFT Preparation Signals  (Scan chain)
  input  wire [NUM_OF_CHAINS-1:0] SI,
  input  wire SE,
  input  wire scan_clk,
  input  wire scan_rst,
  input  wire test_mode,

  output wire [NUM_OF_CHAINS-1:0] SO, 

  output wire PSLVERR,
  output wire [WIDTH-1:0] read_data_out   // Bridge input                                                                   
);

// DFT Preparation  (Scan chain)
    wire  scan_func_clk; 
    wire  scan_func_rst;

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


assign PREADY_APB = (paddr_APB[7] == 1)? PREADY_slave1:PREADY_slave2 ;
assign prdata_APB = (read_write == 0)? ((paddr_APB[7] == 1)? prdata_slave1:prdata_slave2) :7'b0 ;
assign PENABLE_slave1 = (paddr_APB[7] == 1)? PENABLE_APB:0 ;
assign PENABLE_slave2 = (paddr_APB[7] == 0)? PENABLE_APB:0 ;


///********************************************************///
//////////////////// Scan chain MUX (clk & rst) (DFT) /////////////////////
///********************************************************///

scan_mux u0_clk_mux(
.IN_0(PCLK),
.IN_1(scan_clk),
.SEL (test_mode),
.OUT (scan_func_clk)
);

scan_mux u1_rst_mux(
.IN_0(PRESETn),
.IN_1(scan_rst),
.SEL (test_mode),
.OUT (scan_func_rst)
);



///********************************************************///
//////////////////// Master APB UNIT /////////////////////
///********************************************************///

masterAPB  # (.WIDTH(7)) u0(
    .PCLK(scan_func_clk),
    .PRESETn(scan_func_rst),
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

slave1 # (.WIDTH(7)) u1(
    .PCLK(scan_func_clk),
    .PRESETn(scan_func_rst),
    .PWRITE(PWRITE_APB),
    .PSEL(PSEL1_APB),
    .paddr(paddr_APB[6:0]),
    .PREADY1(PREADY_slave1),
    .pwdata(pwdata_APB),
    .PENABLE(PENABLE_slave1),
    .prdata1(prdata_slave1) 
    );

///********************************************************///
//////////////////// Slave2 UNIT /////////////////////
///********************************************************///

slave2 # (.WIDTH(7)) u2(
    .PCLK(scan_func_clk),
    .PRESETn(scan_func_rst),
    .PWRITE(PWRITE_APB),
    .PSEL(PSEL2_APB),
    .paddr(paddr_APB[6:0]),
    .PREADY2(PREADY_slave2),
    .pwdata(pwdata_APB),
    .PENABLE(PENABLE_slave2),
    .prdata2(prdata_slave2) 
    );

endmodule
