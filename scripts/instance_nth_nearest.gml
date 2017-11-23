///instance_nth_nearest(x, y, obj, n);
//
//  Returns the id of the nth nearest instance of an object
//  to a given point or keyword "noone" if none is found.
//
//      x,y       point coordinates, real
//      obj       object index, or keyword "all", real
//      n         proximity, real
//
/// GMLscripts.com/license

/*
Copyright (c) 2007-2014, GMLscripts.com

This software is provided 'as-is', without any express or implied 
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose, 
including commercial applications, and to alter it and redistribute it 
freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.

  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.

  3. This notice may not be removed or altered from any source distribution.
*/

{
    var pointx,pointy,object,n,list,nearest;
    pointx = argument0;
    pointy = argument1;
    object = argument2;
    n = argument3;
    n = min(max(1,n),instance_number(object));
    list = ds_priority_create();
    nearest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}
