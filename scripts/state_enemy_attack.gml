///state_enemy_attack()

state_text = 'attack';

// Resume idle if outside scan range
if distance_to_object(obj_player) > sensor_radius
{
    // Add scr_enemy_hunt later
    state = state_enemy_idle;
}
else
{
    // Turn towards player
    var dir_to_player = point_direction(x,y,obj_player.x,obj_player.y);
    var angle_dif = angle_difference(dir_to_player, image_angle);
    scr_ease_towards_direction(obj_player, rotation_speed, ease_turn_rate);
    image_angle = direction;
    
    // Move towards player
    motion_add(image_angle, impulse_speed);
    if (speed > max_speed) speed = max_speed;
    
    // Once pointed towards player...
    if (distance_to_object(obj_player) >= 100) and (abs(angle_dif) < phaser_angle)
    {
        // Fire on player
        // Phasers
        if (can_shoot and burst_count < 7)
        {
            burst_count++;
            if (burst_count >= 7)
            {
                alarm[4] = random_range(room_speed/2, room_speed *2);
            }
            can_shoot = false;
            alarm[0] = phaser_fire_rate;
            var phaser_id = instance_create(x+lengthdir_x(30,image_angle+75),y+lengthdir_y(30,image_angle+75),obj_enemy_phaser);
            with (phaser_id)
            {
                image_xscale = 1.5;
                image_angle = other.image_angle;
                direction = image_angle;
                hspeed += hspeed;
                vspeed += vspeed;
            }
            var phaser_id = instance_create(x+lengthdir_x(30,image_angle-75),y+lengthdir_y(30,image_angle-75),obj_enemy_phaser);
            with (phaser_id)
            {
                image_xscale = 1.5;
                image_angle = other.image_angle;
                direction = image_angle;
                hspeed += hspeed;
                vspeed += vspeed;
            }
        }
    }
    else if distance_to_object(obj_player) < 100
    {
        state = state_enemy_avoid_collision;
    }
}
