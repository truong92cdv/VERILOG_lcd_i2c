`timescale 1ns / 1ns

module lcd_display_tb();

    reg         clk_1MHz;
    reg         rst_n;
    reg [127:0] row1;
    reg [127:0] row2;
    wire        done_write;
    wire [7:0]  data;
    wire        cmd_data;
    wire        ena_write;
    wire        sda;
    wire        scl;
    wire        sda_en;
    reg         sda_in;
    reg [6:0]   i2c_addr;

    assign sda = sda_en ? 1'bz : sda_in;

    lcd_display lcd_display_inst(
        .clk_1MHz   (clk_1MHz),
        .rst_n      (rst_n),
        .ena        (1'b1),
        .row1       (row1),
        .row2       (row2),
        .done_write (done_write),
        .ena_write  (ena_write),
        .data       (data),
        .cmd_data   (cmd_data)
    );

    lcd_write_cmd_data lcd_write_cmd_data_inst(
        .clk_1MHz   (clk_1MHz),
        .rst_n      (rst_n),
        .data       (data),
        .cmd_data   (cmd_data),
        .ena        (ena_write),
        .i2c_addr   (i2c_addr),
        .sda        (sda),
        .scl        (scl),
        .done       (done_write),
        .sda_en     (sda_en)
    );

    initial begin
        #0  clk_1MHz = 0;
            rst_n = 0;
            sda_in = 0;
            i2c_addr = 7'h27;
            row1 = " Happy New Year ";
            row2 = "      2025      ";
        #20 rst_n = 1;
    end

    always #5 clk_1MHz = ~clk_1MHz;

    initial begin
        #542000 $finish;
    end

endmodule
