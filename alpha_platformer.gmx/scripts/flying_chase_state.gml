///flying_chase_state()
if (instance_exists(Player))
{

    // play the sound effect
    if !(audio_is_playing(snd_flying_attack))
    {
        audio_emitter_gain(audio_em, 0.5);
        audio_emitter_pitch(audio_em, random_range(0.9, 1.1));
        audio_play_sound_on(audio_em, snd_flying_attack, false, 5);
    }
    
    var dir = point_direction(x, y, Player.x, Player.y);
    hspd = lengthdir_x(spd, dir);
    vspd = lengthdir_y(spd, dir);
    
    sprite_index = spr_flying;
    
    // Flip sprite
    if (hspd != 0)
    {
        image_xscale = sign(hspd);
    }
    
    // Momve the flying
    Move(Solid);
}
