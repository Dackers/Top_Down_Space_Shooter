///scr_fire_torpedos(torpedo_array, torpedo_color)

var _a = argument0;
var _c = dcos(image_angle);
var _s = dsin(image_angle);
var _color = argument1;
for (var i = 0; i < num_torpedos; i++)
{
    var _torpedo_x = x + _c * _a[i,0] + _s * _a[i,1];
    var _torpedo_y = y + _c * _a[i,1] - _s * _a[i,0];
    with instance_create(_torpedo_x, _torpedo_y, obj_torpedo)
    {
        image_blend = _color;
        //image_xscale = 1.5;
        //image_yscale = 1.5;
        image_angle = other.image_angle;
        direction = image_angle;
        //speed += speed;
    }
}
