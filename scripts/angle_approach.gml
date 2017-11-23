///angle_approach(current, target, turn_speed)
var tempdir;
var angle = argument0;
var target_angle = argument1;
var turn_speed = argument2;
var diff = abs(target_angle-angle);
if (diff > 180)
{
    if (target_angle > 180)
    {
        tempdir = target_angle - 360;
        if (abs(tempdir-angle ) > turn_speed)
        {
            angle -= turn_speed;
        }
        else
        {
            angle = target_angle;
        }
    }
    else
    {
        tempdir = target_angle + 360;
        if (abs(tempdir-angle) > turn_speed)
        {
            angle += turn_speed;
        }
        else
        {
            angle = target_angle;
        }
    }
}
else
{
    if (diff > turn_speed)
    {
        if (target_angle > angle)
        {
            angle += turn_speed;
        }
        else
        {
            angle -= turn_speed;
        }
    }
    else
    {
        angle = target_angle;
    }
}
return angle;
