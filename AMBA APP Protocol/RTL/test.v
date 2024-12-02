module test();

reg PCLK,PRESETn,transfer,READ_WRITE;
reg [32:0] apb_write_paddr;
reg [31:0]apb_write_data;
reg [32:0] apb_read_paddr;
wire PSLVERR;
wire [31:0] apb_read_data_out;

APB dut(PCLK,PRESETn,transfer,READ_WRITE,apb_write_paddr,apb_read_paddr,apb_write_data,PSLVERR,apb_read_data_out);

initial begin 
PCLK=0;
forever #1 PCLK=~PCLK;
end

initial begin 

PRESETn=0;
transfer=0;
READ_WRITE=1;
@(negedge PCLK);
PRESETn=1;
@(negedge PCLK);
transfer=1;

// write in slave 1 as address[33] = 1
repeat(2)@(negedge PCLK);
apb_write_paddr={1'b1,32'd0};
apb_write_data=32'd10;
repeat(2)@(negedge PCLK);
apb_write_paddr={1'b1,32'd1};
apb_write_data=32'd20;
repeat(5)@(negedge PCLK);
apb_write_paddr={1'b1,32'd2};
apb_write_data=32'd30;
repeat(2)@(negedge PCLK);
apb_write_paddr={1'b1,32'd3};
apb_write_data=32'd40;

// write in slave 2 as address[33] = 0
repeat(3)@(negedge PCLK);
apb_write_paddr={1'b0,32'd4};
apb_write_data=32'd50;
repeat(2)@(negedge PCLK);
apb_write_paddr={1'b0,32'd5};
apb_write_data=32'd60;
repeat(3)@(negedge PCLK);
apb_write_paddr={1'b0,32'd6};
apb_write_data=32'd70;
repeat(4)@(negedge PCLK);
apb_write_paddr={1'b0,32'd7};
apb_write_data=32'd80;


// see address[33] = 1 or 0 and write in corresponding slave
repeat(6)@(negedge PCLK);
apb_write_paddr = 33'd15;
apb_write_data=32'd88;
repeat(2)@(negedge PCLK);
apb_write_paddr = 33'd12; 
apb_write_data=32'd99;


// // REEEEEEEEEEEAD

repeat(4)@(negedge PCLK);
READ_WRITE=0;
// PRESETn=0;	
transfer=0;
@(negedge PCLK);
PRESETn=1;
@(negedge PCLK);
transfer=1;
repeat(2)@(negedge PCLK);
apb_read_paddr={1'b1,32'd0};
repeat(2)@(negedge PCLK);
//@(negedge PCLK);
apb_read_paddr={1'b1,32'd1};
repeat(3)@(negedge PCLK);
//@(negedge PCLK);
//@(negedge PCLK);
apb_read_paddr={1'b1,32'd2};
repeat(3)@(negedge PCLK);
//@(negedge PCLK);
//@(negedge PCLK);
apb_read_paddr={1'b1,32'd3};
repeat(3)@(negedge PCLK);
//@(negedge PCLK);
//@(negedge PCLK);
apb_read_paddr={1'b0,32'd4};
repeat(3)@(negedge PCLK);
//@(negedge PCLK);
//@(negedge PCLK);
apb_read_paddr={1'b0,32'd5};
repeat(3)@(negedge PCLK);
//@(negedge PCLK);
//@(negedge PCLK);
apb_read_paddr={1'b0,32'd6};
repeat(3)@(negedge PCLK);
//@(negedge PCLK);
//@(negedge PCLK);
apb_read_paddr={1'b0,32'd7};
repeat(3)@(negedge PCLK);
//@(negedge PCLK);
//@(negedge PCLK);
apb_read_paddr={1'b0,32'd12};
repeat(3)@(negedge PCLK);
//@(negedge PCLK);
//@(negedge PCLK);

$stop;


end
endmodule