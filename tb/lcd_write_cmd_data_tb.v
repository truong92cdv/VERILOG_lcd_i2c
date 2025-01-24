`timescale 1ns / 1ns

module lcd_write_cmd_data_tb();

    reg         clk_1MHz;
    reg         rst_n;
    reg [7:0]   data;
    reg         cmd_data;
    reg         ena;
    reg [6:0]   i2c_addr;
    wire        sda;
    wire        scl;
    wire        done;
    wire        sda_en;

    reg         sda_in;

    assign sda = sda_en ? 1'bz : sda_in;

    lcd_write_cmd_data lcd_write_cmd_data_inst (
        .clk_1MHz   (clk_1MHz),
        .rst_n      (rst_n),
        .data       (data),
        .cmd_data   (cmd_data),
        .ena        (ena),
        .i2c_addr   (i2c_addr),
        .sda        (sda),
        .scl        (scl),
        .done       (done),
        .sda_en     (sda_en)
    );

    initial begin
        #0      clk_1MHz    = 0;
                rst_n       = 0;
                i2c_addr    = 7'h27;
                data        = 8'b11010100;
                ena         = 1;
                cmd_data    = 0;
                sda_in      = 1;
        #20     rst_n       = 1;
        #20     sda_in      = 0;
    end

    always #5 clk_1MHz = ~clk_1MHz;

    initial begin
        #13500  $stop;
    end

endmodule
