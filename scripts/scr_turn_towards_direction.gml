/// turn_towards_direction(target, rate)
//
//  Rotates the calling instance towards the target direction,
//  at a given rate. 
//
//      target      angle to turn towards (degrees), real
//      rate        maximum turning rate (degrees), real
//
/// GMLscripts.com/license

{
    var target = argument0;
    var rate = argument1;
    
    direction += median(-rate, rate, ((((target - direction) mod 360) + 540) mod 360) - 180);
    return 0;
}
