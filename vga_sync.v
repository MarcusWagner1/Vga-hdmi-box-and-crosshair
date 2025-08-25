`timescale 1ns / 1ps



module vga_sync(
    input clk,
    input rst,
    output reg hsync,
    output reg vsync,
    output reg video_active,
    output reg [9:0] px,
    output reg [9:0] py
);



    // VGA 640x480 @60Hz timing
    localparam H_PIXELS = 640;
    localparam H_FP = 16;
    localparam H_SYNC = 96;
    localparam H_BP = 48;
    localparam H_TOTAL = H_PIXELS + H_FP + H_SYNC + H_BP;

    localparam V_LINES = 480;
    localparam V_FP = 10;
    localparam V_SYNC = 2;
    localparam V_BP = 33;
    localparam V_TOTAL = V_LINES + V_FP + V_SYNC + V_BP;

    reg [9:0] hcount = 0;
    reg [9:0] vcount = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            hcount <= 0;
            vcount <= 0;
            px <= 0;
            py <= 0;
            hsync <= 1;
            vsync <= 1;
            video_active <= 0;
        end else begin
            if (hcount == H_TOTAL - 1) begin
                hcount <= 0;
                if (vcount == V_TOTAL - 1)
                    vcount <= 0;
                else
                    vcount <= vcount + 1;
            end else
                hcount <= hcount + 1;

            // generate sync signals
            hsync <= ~(hcount >= H_PIXELS + H_FP && hcount < H_PIXELS + H_FP + H_SYNC);
            vsync <= ~(vcount >= V_LINES + V_FP && vcount < V_LINES + V_FP + V_SYNC);

            // active video area
            video_active <= (hcount < H_PIXELS && vcount < V_LINES);

            px <= (hcount < H_PIXELS) ? hcount : 0;
            py <= (vcount < V_LINES) ? vcount : 0;
        end
    end

endmodule

