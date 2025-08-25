`timescale 1ns / 1ps





module vga_wrapper(
    input clk,        // input board clock
    (* mark_debug = "true", keep = "true" *)
    input rst,        // active-high reset
    output hdmi_clk_n,
    output hdmi_clk_p,
    output [2:0] hdmi_tx_n,
    output [2:0] hdmi_tx_p
);

    // clocks
    wire clk_25MHz;
    wire clk_125MHz;
    wire locked;

    // VGA signals
     (* mark_debug = "true", keep = "true" *)
    wire hsync, vsync, video_active;
     (* mark_debug = "true", keep = "true" *)
    wire [9:0] px, py;
    wire [7:0] red_cross, green_cross, blue_cross;
    wire [7:0] red_box, green_box, blue_box;

    // final RGB after combining
    wire [7:0] red_final, green_final, blue_final;
    
    

    // Clock wizard IP
    clk_wiz_0 clk_wiz (
        .clk_out1(clk_25MHz),
        .clk_out2(clk_125MHz),
        .reset(1'b0),
        .locked(locked),
        .clk_in1(clk)
    );
    (* mark_debug = "true", keep = "true" *)
     wire [7:0] cnt_125;
    
   
    (* mark_debug = "true", keep = "true" *)
    wire [7:0] cnt_25;

    test_counter counter_25_inst (
        .clk (clk_25MHz),
        .rst      (1'b0),
        .cnt (cnt_25)        // unused in this instance
    );
    
     test_counter counter_125_inst (
        .clk (clk_125MHz),
        .rst      (1'b0),
        .cnt (cnt_125)        // unused in this instance
    );
    

    // VGA sync
    vga_sync vga (
        .clk(clk_25MHz),
        .rst(1'b0),
        .hsync(hsync),
        .vsync(vsync),
        .video_active(video_active),
        .px(px),
        .py(py)
    );


    // Crosshair renderer
    crosshair_rend crosshair (
        .px(px),
        .py(py),
        .video_active(video_active),
        .red(red_cross),
        .green(green_cross),
        .blue(blue_cross)
    );

    // Box renderer
    box_rend box (
        .px(px),
        .py(py),
        .video_active(video_active),
        .red(red_box),
        .green(green_box),
        .blue(blue_box)
    );

    wire [7:0] red, green, blue;

    // combine layers (simple OR)
    assign red   = red_cross | red_box;
    assign green = green_cross | green_box;
    assign blue  = blue_cross | blue_box;

    // HDMI transmitter
    hdmi_tx_0 hdmi_ip (
        .pix_clk(clk_25MHz),
        .pix_clkx5(clk_125MHz),
        .pix_clk_locked(locked),
        .rst(1'b0),
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(video_active),
        .aux0_din(4'b0),
        .aux1_din(4'b0),
        .aux2_din(4'b0),
        .ade(1'b0),
        .TMDS_CLK_P(hdmi_clk_p),
        .TMDS_CLK_N(hdmi_clk_n),
        .TMDS_DATA_P(hdmi_tx_p),
        .TMDS_DATA_N(hdmi_tx_n)
    );

endmodule
