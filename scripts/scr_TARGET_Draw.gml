/// scr_TARGET_Draw(instance, colour, view_offset_x, view_offset_y);

// The instance ID taken by this script is the ID of the instance that you want to draw the information for.
// Since these scripts are not only for a player object, but can be used in enemies or other types of object
// the draw script has to adapt to this.

// Note that this script is presented as part of the package more as a tool to show what information is required 
// and is probably not what you require in your game. The importnat thing to note is that you are going through
// the list of targets held in the player or other object "target_list", using the variables for that instance
// which deal with the list and it's details. The variables are:
//
// target_list  - the ds_list that holds the targets
// e_num        - the total size of the target list
// e_pos        - the currently selected target in the target list
// e_cur        - the instance ID of the currently selected target
// e_rng        - the range of the instance being used
//
// Your PARENT objects should also have a "name" variable if you want to give a graphic list display with 
// text for the targets. "name" can be any string you wish and will be displayed with a highlight for the 
// current target.

// Using these variables you can create your own draw scripts from a controller object, supplying the required 
// ID for the instance to get the variables from. Use the seperate parts that are given in this script as a 
// template for your own. 

// Set some basic draw colours and stuff
draw_set_color(argument1);
draw_set_font(fnt_TARGET);

// Set up vars for this script
var enemy_id = 0;                   // will hold the ID of the enemy and then the text for their name if found
var inst = argument0;               // get the ID of the instance that is going to supply the variables for drawing

if instance_exists(inst)
{
// get the necessary vars from the instance being used
var li = inst.target_list;
var en = inst.e_num;
var ep = inst.e_pos;
var ec = inst.e_cur;
var er = inst.e_rng;

var x_off = argument2;      //View offsets, more for this demo than anything else.
var y_off = argument3;

// This loop checks the list to see if it contains an instance ID or the instance exists and then sets some text and 
// displays it if there is. If not it displays default text. It will show all the currently available targets as well 
// as marking which target you are currently tracking.
// NOTE! the PARENT for the targets should have a "name" variable that must have some text to display, although you can 
// supply an empty string "" and have it simpy show nothing, or remove that part altogther and draw what you require!

/*
for (var i = 0; i < en; i++;)
    {
    enemy_id = ds_list_find_value(li, i);               // assign the list value to a variable...
    if enemy_id == 0                                    // check the instance is valid and exists
        {
        enemy_id = "No Enemy";                          // If no enemy is found or exists set the text to a default value
        }
    else
        {
        if instance_exists(enemy_id)                    // list has an instance, so check it exists
            {
            enemy_id = string(i + 1) + " " + ds_list_find_value(li, i).name; //get enemy name for HUD...
            }
        else
            {
            enemy_id = "Destroyed!";                    // instance doesn't exists so set text to destroyed until the list is updated next
            }
        }
    draw_text(view_xview[0] + x_off, view_yview[0] + y_off + (16 * i), enemy_id); //Draw text with enemy name...
    
    //This next part simply draws a rectangle around the currently targeted enemy name in the HUD...
    if ep == i
        {
        draw_set_alpha(0.5);
        draw_rectangle(view_xview[0] + x_off, view_yview[0] + y_off + (16 * i), view_xview[0] + x_off + 120, view_yview[0] + y_off + 16 + (16 * i), false);
        draw_set_alpha(1);
        draw_rectangle(view_xview[0] + x_off, view_yview[0] + y_off + (16 * i), view_xview[0] + x_off + 120, view_yview[0] + y_off + 16 + (16 * i), true);
        }
    }
*/
// This part will now draw a circle around the current target (if there is one) and then draw 
// a line from the instance being used for drawing to the target.
if ec != 0 && instance_exists(ec)
    {
    var pd = point_direction(ec.x, ec.y, inst.x, inst.y);
    var xx = lengthdir_x(16, pd);
    var yy = lengthdir_y(16, pd);
    //draw_line(inst.x, inst.y, ec.x + xx, ec.y + yy);
    draw_circle(ec.x, ec.y, 16, true);
    }

// This part is more for the demo than anything else and draws a circle indicating the range for the 
// targetting system. It can be removed completely if necessary, or linked to a debug variable 
// so you can switch it on/off while testing.
if range_circle
{
    draw_set_alpha(0.25);
    
    //Check for webGL in a browser
    if webgl_enabled == true || os_browser == browser_not_a_browser
    {
    draw_set_blend_mode(bm_add);
    draw_circle_colour(inst.x, inst.y, er, c_black, argument1, false);
    draw_set_blend_mode(bm_normal);
    }
    else
    {
    draw_circle(inst.x, inst.y, er, true);
    }
}

// Reset drawing stuff...
draw_set_alpha(1);
draw_set_color(c_black);
}
