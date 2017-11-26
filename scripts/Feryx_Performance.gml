///Feryx_Performance(x, y)

//simple performance draw out!
draw_text_colour(argument0,
                 argument1,
                 "real FPS:"+
                    string(fps_real) + "##Room Speed: " + string(fps) +
                    "##mouse Y: "+string(mouse_x) +
                    "##mouse Y: "+string(mouse_y) +
                    "##Window_Size: "+string(window_get_width()) + "," + string(window_get_height()) + "##" +
                    string(background_vspeed[2]) + "," +
                    string(background_vspeed[3]) + "," +
                    string(background_vspeed[4]) + "," +
                    string(background_vspeed[5]) + "," +
                    string(background_vspeed[6]),
                 c_white,c_white,c_white,c_white,1);
