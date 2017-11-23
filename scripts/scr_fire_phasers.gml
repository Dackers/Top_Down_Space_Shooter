///scr_fire_phasers(phaser_array, phaser_color)

var _a = argument0;
var _c = dcos(image_angle);
var _s = dsin(image_angle);
var _color = argument1;
for (var i = 0; i < num_phasers; i++)
{
    var _phaser_x = x + _c * _a[i,0] + _s * _a[i,1];
    var _phaser_y = y + _c * _a[i,1] - _s * _a[i,0];
    var phaser = instance_create(_phaser_x, _phaser_y, obj_bullet)
    with phaser
    {
        owner = other.id;
        //image_blend = _color;
        image_index = _color;
        image_xscale = 1.0;
        image_yscale = 0.5;
        image_angle = other.image_angle;
        direction = image_angle;
        speed += speed;
    }
}
