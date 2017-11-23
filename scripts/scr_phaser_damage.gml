///scr_phaser_damage()
// *** REPLACED BY OBJ_BULLET COLLISION EVENTS ***
if (other.owner != id) //Don't damage self
{
    //Damage is based on shooter's "phaser_damage" variable
    hp = hp - other.owner.phaser_damage;
    if hp <= 0 { instance_destroy(); }
    
    //Destroy phaser instance
    with other { instance_destroy(); }
    
    //Create hit particles
    var _xx = x+lengthdir_x(sprite_width/2,point_direction(x,y,other.x,other.y));
    var _yy = y+lengthdir_y(sprite_height/2,point_direction(x,y,other.x,other.y));
    part_particles_create(global.p_system, _xx, _yy, global.pt_phaser_hit, irandom_range(7,10));
    
    //Hit sound
    var snd = audio_play_sound(snd_phaser_hit, 5, 0);
    audio_sound_gain(snd,.2,0);
}
