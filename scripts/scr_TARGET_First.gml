/// scr_TARGET_First(first/last);

// Select the first target on the list (true)
// or the last target on the list (false)

if argument0
{
e_pos = 0;                                        //Adds one onto the position within the list...
e_cur = ds_list_find_value(target_list, e_pos); //Sets the variable "e" to the selected enemy from the list position...
//The following checks to see if there is no enemy and if there is none
//moves up a position until one is found or the beginning of the list is reached...
var count = 0;
while (e_cur == 0 && count < e_num)
    {
    e_pos++;
    count++;
    if e_pos == e_num e_pos = 0;
    e_cur = ds_list_find_value(target_list, e_pos);
    }
}
else
{
// Same as above, only moving down the list...
e_pos = e_num - 1;
e_cur = ds_list_find_value(target_list, e_pos); 
var count = 0;
while (e_cur == 0 && count < e_num)
    {
    e_pos--;
    count++;
    if e_pos < 0 e_pos = e_num - 1;
    e_cur = ds_list_find_value(target_list, e_pos);
    }
}

