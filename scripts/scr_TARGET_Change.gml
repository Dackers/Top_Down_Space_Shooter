/// scr_TARGET_Change(up/down);

// Change the target that is highlighted currently by moving
// up or down the target list. Set it to "true" to move down the list
// and "false" to move up the list.

if argument0
{
e_pos++;                                        //Adds one onto the position within the list...
if e_pos == e_num e_pos=0;                      //If the position is more than the list, goes back to the top of the list...
e_cur = ds_list_find_value(target_list, e_pos); //Sets the variable "e" to the selected enemy from the list position...

//The following checks to see if there is no enemy and if there is none
//moves up a position until one is found or the beginning of the list is reached...

var count = 0;
while (e_cur == 0 && count <= e_num)
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

e_pos--;
if e_pos < 0 e_pos = e_num - 1;
e_cur = ds_list_find_value(target_list, e_pos); 
var count = 0;
while (e_cur == 0 && count <= e_num)
    {
    e_pos--;
    count++;
    if e_pos < 0 e_pos = e_num - 1;
    e_cur = ds_list_find_value(target_list, e_pos);
    }
}
