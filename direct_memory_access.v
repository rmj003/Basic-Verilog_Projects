`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Rosemary P J
// 
// Create Date: 25.06.2024 14:18:23
// Design Name: Direct Memory Access
// Module Name: dma
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module basic_dma (
  // Clock and reset
  input clk,
  input reset,

  // Memory interface
  input mem_data_ready,
  output reg [31:0]mem_addr,
  output reg mem_read,
  output reg mem_write,
  output reg [31:0] mem_data,

  // Peripheral interface
  input peripheral_data_ready,
  input [31:0] peripheral_data,
  output reg peripheral_read,

  // DMA control signals
  input dma_start,
  output reg dma_done,

  // Transfer configuration
  input [31:0]source_addr,
  input [31:0]dest_addr,
  input [31:0]transfer_size
);

  reg [31:0] current_addr;
  reg [31:0] remaining_size;
  reg state, next_state;

  initial next_state=1'b0;
  parameter IDLE = 1'b0;
  parameter TRANSFER = 1'b1;
  
  always @(posedge clk  ) begin
    if (reset) begin
      state <= IDLE;
      dma_done <= 1'b0;
      current_addr <= current_addr;
      remaining_size <= transfer_size;
    end else begin
      state <= next_state;
    end
  


  
    case (state)
      IDLE: begin
        if (dma_start) begin
          next_state = TRANSFER;
        end else begin
          next_state = IDLE;
        end
        dma_done <= 1'b0;
        mem_addr <= 32'b0;
        mem_read <= 1'b0;
        mem_write <= 1'b0;
        mem_data <= 32'b0;
        peripheral_read <= 1'b0;
      end
      TRANSFER: begin
        if (remaining_size == 0) begin
          next_state = IDLE;
          dma_done = 1'b1;
        end else begin
          next_state = TRANSFER;
          dma_done = 1'b0;
          if (peripheral_data_ready) begin
            remaining_size <= remaining_size - 1'b1;
            current_addr <= current_addr + 1'b1;
          end
        end
        // Memory access based on transfer direction (modify as needed)
        if (transfer_size[0]) begin // Memory write
          mem_addr = dest_addr; //+ (transfer_size - remaining_size);
          mem_write <= 1'b1;
          mem_data <= peripheral_data;
        end else begin // Memory read
          mem_addr <= source_addr;// + (transfer_size - remaining_size);
          mem_read <= 1'b1;
        end
        peripheral_read <= 1'b1; // Assuming peripheral provides data continuously
      end
    endcase
  end
//  $display ("value : %0d",current_addr);
endmodule




//TESTBENCH
module basic_dma_tb;

  reg clk, reset, dma_start;
  reg [31:0] source_addr, dest_addr, transfer_size;
  reg mem_data_ready;
  wire [31:0]mem_addr;
  wire mem_read, mem_write;
  wire [31:0] mem_data;
  reg peripheral_data_ready;
  reg [31:0] peripheral_data;
  wire dma_done;

  basic_dma dut (
    .clk(clk),
    .reset(reset),
    .mem_data_ready(mem_data_ready),
    .mem_addr(mem_addr),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .mem_data(mem_data),
    .peripheral_data_ready(peripheral_data_ready),
    .peripheral_data(peripheral_data),
    .dma_start(dma_start),
    .dma_done(dma_done),
    .source_addr(source_addr),
    .dest_addr(dest_addr),
    .transfer_size(transfer_size)
  );
  

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    clk=1'b1;
    reset = 1'b1;
   
    mem_data_ready = 1'b1;
    peripheral_data <= 32'habcccba; // Send constant data
    peripheral_data_ready=1'b1;

    // Test case 1: Write operation
    source_addr = 32'h50;
    dest_addr = 32'h100;
    transfer_size = 32'h11; // Transfer 16 bytes
    dma_start = 1'b0;
     #100 reset = 1'b0;
    #20 dma_start = 1'b1;
    #180 dma_start = 1'b0; // Wait for transfer completion

    // Test case 2: Read operation (modify as needed)
    #100 source_addr = 32'h25;
    dest_addr = 32'h70;
    transfer_size = 32'd10;
    dma_start = 1'b1;
    #180 dma_start = 1'b0;
$stop;
  end

endmodule



