///state_enemy_idle()

state_text = 'idle';
if instance_exists(obj_player) and distance_to_object(obj_player) <= sensor_radius
{
    state = state_enemy_attack;
}
else
{
    state = state_enemy_patrol;
}
