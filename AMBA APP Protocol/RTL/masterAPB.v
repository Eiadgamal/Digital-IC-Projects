module masterAPB # (parameter WIDTH = 32)
    (
  input wire PCLK,PRESETn,
  input wire transfer,
  input wire read_write,                 // Bridge output
  input wire [WIDTH:0] write_paddr,      // Bridge output
  input wire [WIDTH:0] read_paddr,       // Bridge output
  input wire [WIDTH-1:0] write_data,     // Bridge output
  input wire PREADY,                     // Slave output
  input wire [WIDTH-1:0] prdata,         // Slave output   
                                   
  output reg PWRITE,                     // Slave input
  output reg PSEL1,                         // First Slave input
  output reg PSEL2,                         // Second Slave input
  output reg PENABLE,                    // Slave input
  output reg PSLVERR,                                 
  output reg [WIDTH:0] paddr,            // Slave input    ,, last bit [32] for slave selection
  output reg [WIDTH-1:0] pwdata,         // Slave input
  output reg [WIDTH-1:0] read_data_out   // Bridge input

);

localparam IDLE   = 2'b00;
localparam Setup  = 2'b01;
localparam Access = 2'b10;

reg [1:0] current_state,next_state;

reg data_error,waddr_error,raddr_error;

always @(posedge PCLK) begin
    if(~PRESETn) begin
         current_state <= IDLE;
    end else begin
         current_state <= next_state ;
    end
end


always @(*) begin

PENABLE = 0;
PWRITE  = read_write;
paddr   = 33'bx;
pwdata  = 32'bx;
read_data_out = 32'bx;

if (PSLVERR) begin
    next_state = IDLE;
end else begin
    next_state = Access;
    if (read_write) begin              // high for write , low for read
        paddr  = write_paddr;
        pwdata = write_data;
    end else begin
        paddr  = read_paddr;
        pwdata = write_data;
    end                        
end

    case (current_state)
        IDLE :   begin
                    PENABLE = 0;
                    paddr   = 33'bx;
                    pwdata  = 32'bx;
                    read_data_out = 32'bx; 

                    if (transfer) begin
                        next_state = Setup;
                    end else begin
                        next_state = IDLE;
                    end

                 end 
        Setup :  begin
                    PENABLE = 0;
                    read_data_out = prdata;            // slave output store in read data out                   
                 end
        Access : begin
                    PENABLE = 1;
                    read_data_out = prdata;                                
                    if (!PREADY) begin             
                        next_state = Access;
                    end else begin
                        if (transfer) begin          // With transfer  (SETUP)
                            next_state = Setup;
                        end else begin               // With no transfer  (IDLE)
                            next_state = IDLE;
                        end
                    end

                 end
        default :begin
                    PENABLE = 0;
                    PWRITE  = read_write;
                    paddr   = 33'bx;
                    pwdata  = 32'bx;
                    read_data_out = 32'bx;                        
                 end                            
    endcase
end


// combination always for error detection
always @(*) begin

data_error  = 0;
waddr_error = 0;
raddr_error = 0;

if (data_error||waddr_error||raddr_error) begin
    PSLVERR = 1;
end else begin
    PSLVERR = 0;
end

    if (current_state == IDLE) begin
        data_error  = 0;
        waddr_error = 0;
        raddr_error = 0;
        PSEL1 = 0;
        PSEL2 = 0; 
    end else if (current_state == Setup || current_state == Access) begin
        if (paddr[32] == 1) begin
            PSEL1 = 1;
            PSEL2 = 0;
        end else begin
            PSEL1 = 0;
            PSEL2 = 1;            
        end
        if (write_data == 32'b0) begin
            data_error = 1;
        end else begin
            data_error = 0;
        end            
        if (read_write) begin                // high for write , low for read
            if (write_paddr == 32'b0) begin
                waddr_error = 1;
            end else begin
                waddr_error = 0;
            end
        end else begin
            if (read_paddr == 32'b0) begin
                raddr_error = 1;
            end else begin
                raddr_error = 0;
            end
        end
    end else begin
        data_error  = 0;
        waddr_error = 0;
        raddr_error = 0;
        PSEL1 = 0;
        PSEL2 = 0; 
    end
     
end

// assign PSLVERR = (data_error||waddr_error||raddr_error)? 1:0;

//slave select depend on the last bit of PADDR and cs
//assign PSEL1=((current_state==Setup||current_state==Access) && paddr[32] == 1)? 1:0;
//assign PSEL2=((current_state==Setup||current_state==Access) && paddr[32] == 0)? 1:0; 

endmodule


