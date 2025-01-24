`timescale 1ns / 1ns

module i2c_writeframe_tb();

    reg         clk_1MHz;
    reg         rst_n;
    reg         en_write;
    reg         start_frame;
    reg         stop_frame;
    reg [7:0]   data;
    wire        sda;
    wire        scl;
    wire        done;
    wire        sda_en;
    
    reg         sda_in;

    assign sda = sda_en ? 1'bz : sda_in;

    i2c_writeframe i2c_writeframe_inst (
        .clk_1MHz   (clk_1MHz),
        .rst_n      (rst_n),
        .en_write   (en_write),
        .start_frame(start_frame),
        .stop_frame (stop_frame),
        .data       (data),
        .sda        (sda),
        .scl        (scl),
        .done       (done),
        .sda_en     (sda_en)
    );

    always @(*) begin
        en_write <= ~done;
    end

    initial begin
        #0      clk_1MHz    = 0;
                rst_n       = 0;
                data        = 8'b11010100;
                sda_in      = 1;
                start_frame = 1;
                stop_frame  = 0;
        #20     rst_n       = 1;
        #20     sda_in      = 0;
        #1300   en_write    = 0;
        #1000   start_frame = 0;
                stop_frame  = 0;
        #300    data        = 8'b11010101;
        #1300   en_write    = 0;
        #1000   data        = 8'b00101100;
        #300    start_frame = 0;
                stop_frame  = 1;
        #2400   $stop;
    end

    always #5 clk_1MHz = ~clk_1MHz;

endmodule
