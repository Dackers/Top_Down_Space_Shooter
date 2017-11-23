///state_enemy_avoid_collision()

state_text = 'avoid_collision';

// Resume idle if outside scan range
if distance_to_object(obj_player) > sensor_radius
{
    // Add scr_enemy_hunt later
    state = state_enemy_idle;
} else
{
    // Setup check left and right variables to see which way player turning
    var player_facing_dir = obj_player.image_angle;
    var player_sensor_range = obj_player.sensor_radius;
    var left_x = lengthdir_x(player_sensor_range, player_facing_dir-90); // get left info
    var left_y = lengthdir_y(player_sensor_range, player_facing_dir-90);
    var check_left = point_direction(x, y, left_x, left_y);
    var right_x = lengthdir_x(player_sensor_range, player_facing_dir+90); // get right info
    var right_y = lengthdir_y(player_sensor_range, player_facing_dir+90);
    var check_right = point_direction(x, y, right_x, right_y);
    
    // Enemy evades left if player turning right, and vice-versa
    if player_facing_dir >= image_angle // Player turning right relative to enemy
    {
        scr_turn_towards_direction(check_left, rotation_speed*2) // ... and thus enemy turns left
    }
    else // Player turning left relative to enemy
    {
        scr_turn_towards_direction(check_right, rotation_speed*2)  // ... and thus enemy turns right
    }
    image_angle = direction;
    
    //Turn on the speed
    motion_add(image_angle, impulse_speed);
    if (speed > max_speed) speed = max_speed;
    state = state_enemy_idle;
}
