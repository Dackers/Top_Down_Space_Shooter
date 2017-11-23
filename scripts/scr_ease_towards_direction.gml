/// scr_ease_towards_direction(target,rate,easing)
//
//  Rotates the calling instance towards the target direction,
//  at a given rate and easing. The larger the easing factor,
//  the more gradually the turn completes.
//
//      target      angle to turn towards (degrees), real
//      rate        maximum turning rate (degrees), real
//      easing      amount of easing [0..1], real
//
/// GMLscripts.com/license

{
    var target = argument0;
    var rate = argument1;
    var easing = argument2;
    
    direction += median(-rate, rate, (1-easing) * angle_difference(target, direction));
    return 0;
}
