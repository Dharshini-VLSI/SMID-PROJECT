module program_counter_tb;
    reg clk;
    reg rst;
    reg pc_enable;      
    reg pc_load;      
    reg  [7:0] pc_in;
    wire [7:0] pc;

    program_counter uut (
        .clk(clk),
        .rst(rst),
        .pc_enable(pc_enable),
        .pc_load(pc_load),
        .pc_in(pc_in),
        .pc(pc)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Sequence
    initial begin
    $dumpfile("program_counter.vcd");
    $dumpvars(0, program_counter_tb);


        // Initialize
        rst       = 1;
        pc_enable = 0;
        pc_load   = 0;
        pc_in     = 8'd0;

        #12;
        rst = 0;

        // Fetch
        $display("FETCH      : PC = %d", pc);
        #10;

        // Decode
        $display("DECODE     : PC = %d", pc);
        #10;

        // Execute
        $display("EXECUTE    : PC = %d", pc);
        #10;

        // Memory
        $display("MEMORY     : PC = %d", pc);
        #10;

        // Write Back
        pc_enable = 1;
        #10;
        pc_enable = 0;
        $display("WRITE BACK : PC = %d", pc);

        $display("--------------------------");

        // Fetch
        $display("FETCH      : PC = %d", pc);
        #10;

        // Decode
        $display("DECODE     : PC = %d", pc);
        #10;

        // Execute
        $display("EXECUTE    : PC = %d", pc);
        #10;

        // Memory
        $display("MEMORY     : PC = %d", pc);
        #10;

        // Write Back
        pc_enable = 1;
        #10;
        pc_enable = 0;
        $display("WRITE BACK : PC = %d", pc);

        #20;
        $finish;

         $monitor("Time=%0t | PC=%d | Enable=%b",
                 $time, pc, pc_enable);

    end
endmodule
