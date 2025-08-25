`timescale 1ns / 1ps

module box_rend(
    input [9:0] px,
    input [9:0] py,
    input video_active,
    output [7:0] red,
    output [7:0] green,
    output [7:0] blue
);

    parameter BOX_X_START = 200;
    parameter BOX_Y_START = 150;
    parameter BOX_WIDTH = 100;
    parameter BOX_HEIGHT = 100;

    wire in_box = video_active &&
                  (px >= BOX_X_START && px < BOX_X_START + BOX_WIDTH) &&
                  (py >= BOX_Y_START && py < BOX_Y_START + BOX_HEIGHT);

    assign red   = in_box ? 8'd0   : 8'd0;
    assign green = in_box ? 8'd255 : 8'd0;
    assign blue  = in_box ? 8'd0   : 8'd0;

endmodule
