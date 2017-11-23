/// scr_TARGET_Init(max_enemies, max_range, parent, update_speed);

e_pos = 0;                  // This will hold the position of the current target in the list.
e_num = argument0;          // This is the size of the list (or number of enemies on the list). If you want more (or less), just change this and the whole code should adapt.
e_cur = 0;                  // This will hold the current enemy id or noone if their is none.
e_rng = argument1;          // This is the detection range for targeting around the player object (as a radius).
update_speed = argument3;   // This is the update speed for the alarm that re-checks available targets
target_list = ds_list_create();     //Creates the main target list for use...

for (var i = 1; i <= e_num; i++;)    //This creates a loop the size of the variable e_num...
    {
    var near = instance_nth_nearest(x, y, argument2, i);
    if distance_to_object(near) < e_rng
        {
        ds_list_add(target_list, near.id); //Adds the id of the enemy object to the list...
        }
    else ds_list_add(target_list, 0);
    }

return true;
