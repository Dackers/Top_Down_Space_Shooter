/// scr_TARGET_Step();

// This script simply checks the range between the instance running the targeting 
// scripts and the current target, based on the given max range.

if instance_exists(e_cur)
{
// Check the range...
if distance_to_object(e_cur) > e_rng
    {
    // Enemy out of range, so skip to the next on the list
    e_cur = 0;
    // This loop goes down the list looking for the next enemy and setting the 
    // position and target accordingly...
    var count = 0;
    while(ds_list_find_value(target_list, e_pos) == 0 && count <= e_num)
        {
        e_pos--;
        if e_pos < 0 e_pos = e_num - 1;
        count++;
        }
    // Set the current target
    e_cur = ds_list_find_value(target_list, e_pos);
    }
}
else
{
// No current target
e_pos = 0;
e_cur = 0;
}
