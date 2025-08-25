`timescale 1ns / 1ps

module crosshair_rend(
    input [9:0] px,
    input [9:0] py,
    input video_active,
    output [7:0] red,
    output [7:0] green,
    output [7:0] blue
);

    parameter H_MAX = 640;
    parameter V_MAX = 480;
    parameter CROSS_SIZE = 5;

    assign red   = (video_active && ((px >= H_MAX/2 - CROSS_SIZE && px <= H_MAX/2 + CROSS_SIZE) ||
                                     (py >= V_MAX/2 - CROSS_SIZE && py <= V_MAX/2 + CROSS_SIZE))) ? 8'd255 : 8'd0;
    assign green = red;
    assign blue  = red;

endmodule
