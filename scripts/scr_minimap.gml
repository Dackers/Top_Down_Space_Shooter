///scr_minimap(x, y, scale)

var _x = argument0;
var _y = argument1;
var _s = argument2;

draw_set_color(c_white);
draw_rectangle(_x,_y,_x+view_wview[0]/_s,_y+view_hview[0]/_s,1);

//Draw Player (NOT WORKING - RECTANGLE DRAWN ELSEWHERE, PROBABLY)
with (obj_player)
{
    draw_set_color(c_green);
    draw_rectangle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),_x+x/_s+sprite_width/(2*_s),_y+y/_s+sprite_width/(2*_s),0);
}

//Draw Enemies
with (obj_enemy)
{
    draw_set_color(c_red);
    draw_rectangle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),_x+x/_s+sprite_width/(2*_s),_y+y/_s+sprite_width/(2*_s),0);
}
draw_set_color(c_white);
