/// scr_TARGET_Update(parent, update);

// This is the update code... We need a temporary list to hold the old list values 
// so that any enemies, including the currently targeted one, maintain their position 
// in the list...

var update = argument1; // If true, the script will update list positions every iteration, but false will maintain the list as long as the enemies are in range
var temp_list = ds_list_create(); //A temp list to hold existing enemies...
var near = noone;

e_cur = ds_list_find_value(target_list, e_pos); //Find the current enemy if in list...

//This code adds all the enemies from the target_list within the given range to the temp_list...
var count = 0;
for (var i = 0; i < e_num; i++;)
{
var t_id = ds_list_find_value(target_list, i);
if instance_exists(t_id)
    {
    if point_distance(x, y, t_id.x, t_id.y)< e_rng
        {
        ds_list_add(temp_list, ds_list_find_value(target_list, i));
        count++;
        }
    }
}

// If the list has a full compliment of target ID's, no need to look for more... 
if count != i || update == true
{
// The list is not full, so look for more targets...
ds_list_sort(temp_list,true);           //Sorts the list in order of id...
ds_list_clear(target_list);             //Clear the target list...
ds_list_copy(temp_list,target_list);    //Add the enemies within range from the temp list to the target list...
ds_list_destroy(temp_list);             //delete the temp list...

for (i = 1; i <= e_num; i++;)           //This creates a loop the size of the variable num...
    {
    near = instance_nth_nearest(x, y, argument0, i); //Gets the id of enemy
    if distance_to_object(near) < e_rng
        {
        //If the id is not already in the target list then add it to the list
        //as long as the list is no longer than the variable "num" (see create event)...
        if ds_list_find_index(target_list, near) == -1 && ds_list_size(target_list) != e_num
            {
            ds_list_add(target_list, near);
            }
        }
    }

ds_list_sort(target_list, true);// Sorts the list in order of id... The sorting attempts to keep the list from changing too much each alarm call...
}

if ds_list_size(target_list) == 0
{
// If the list has no enemies in it set the "e_cur" variable to 0
e_cur = 0;
e_pos = 0;
repeat(10)
    {
    ds_list_add(target_list, 0);
    }
}
else
{
// make sure the list is full...
if ds_list_size(target_list) < e_num
    {
    var dif = e_num - ds_list_size(target_list);
    repeat(dif)
        {
        ds_list_add(target_list, 0);
        }
    }
// This code is to make sure that the "pos" variable and enemy selected
// don't change position within the list. It's not strictly necessary,
// but it means that there is less jumping around and confusion in the HUD...

if e_cur != 0 && e_pos != ds_list_find_index(target_list, e_cur)
    {
    if instance_exists(e_cur)
        {
        if distance_to_object(e_cur) < e_rng
            {
            var temp_pos = ds_list_find_index(target_list, e_cur);
            var temp_e = ds_list_find_value(target_list, e_pos);
            ds_list_replace(target_list, e_pos, e_cur);
            ds_list_replace(target_list, temp_pos, temp_e);
            }
        }
    }
}

// This finally sets the variable "pos"...
e_pos = ds_list_find_index(target_list, e_cur)

if e_pos == -1
{
e_pos = 0;
e_cur = 0;
}
