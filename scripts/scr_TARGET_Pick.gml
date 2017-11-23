/// scr_TARGET_Pick(parent, x, y);

// This script is used to permit the user to pick a target that is within range.
// You give the position to check and the object to check for (or the parent to check for).
// If the target is within range then it will be added to the current target list.

var tx = argument1;
var ty = argument2;
var t_id = instance_position(tx, ty, argument0);

// Make sure target object actually exists
if instance_exists(t_id)
{
// Check to see if the target is already in the target list and simnply select it if it is
var l_id = ds_list_find_index(target_list, t_id);
if l_id != -1
    {
    e_cur = t_id;
    e_pos = ds_list_find_index(target_list, t_id);
    }
else
    {
    // Target is not on the target list so check to see if it's in range
    if point_distance(x, y, t_id.x, t_id.y)< e_rng
        {
        // Target is in range, so check to see if the list is full and add it to the list (and sleect it)
        if ds_list_size(target_list) < e_num
            {
            ds_list_add(target_list, t_id);
            e_cur = t_id;
             e_pos = ds_list_find_index(target_list, t_id);
            }
        else
            {
            // Target list is full, so get the furthest away target on the list and remove it, then add the selected target at the end
            var max_d = 0;
            var max_i = -1;
            for (var i = 0; i < ds_list_size(target_list); i++;)
                {
                var temp_i = ds_list_find_value(target_list, i);
                var temp_d = distance_to_object(temp_i);
                if temp_d > max_d
                    {
                    max_d = temp_d;
                    max_i = i;
                    }
                }
            ds_list_delete(target_list, max_i);
            ds_list_add(target_list, t_id);
            e_cur = t_id;
            e_pos = ds_list_find_index(target_list, t_id);
            }
        }
    }
}
