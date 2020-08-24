module dataMemory (clk, read, write, addrs, data_in, data_out);
    input clk, read, write;
    input [31:0] addrs;
    input [31:0] data_in;
    output reg [31:0] data_out;
    reg [31:0] memory [65535:0];
    always@ (negedge clk) begin
        if (read == 1) begin
            data_out = memory [addrs];
        end
        if (write == 1) begin //else if prevents reading and writing at same time
            memory [addrs] = data_in;
        end
    end
endmodule