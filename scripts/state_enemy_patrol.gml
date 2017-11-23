///state_enemy_patrol()

state_text = 'patrol';

if distance_to_object(obj_player) <= sensor_radius
{
    state = state_enemy_attack;
}
else
{
    // fly straight for awhile
    direction = turn_dir;
    image_angle = direction;
    motion_add(turn_dir, impulse_speed);
    if (speed > max_speed) speed = max_speed;
    
    // Turn every 1-5 seconds
    if can_turn
    {
        can_turn = false;
        alarm[3] = room_speed*(irandom_range(1, 5));
    }
    scr_ease_towards_direction(turn_dir, rotation_speed, ease_turn_rate);
}
