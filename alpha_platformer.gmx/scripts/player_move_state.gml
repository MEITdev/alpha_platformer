///player_move_state()

// Variables for User INPUT
if (!place_meeting(x, y + 1, Solid))
{
    vspd += grav;
    
    // Player is in the air
    // check which way is the player going
    if (vspd > 0) 
    {            
        sprite_index = spr_player_jump;
        image_speed = .1;
    }
    else if (vspd < 0)
    {
        sprite_index = spr_player_jump;
        image_speed = .1;
    }
   
    // Control the jump heihgt
    if (up_release && vspd < -6)
    {
        vspd = -6;        
    }
}
else
{
    vspd = 0;

    // Jump only when on the ground
    if (up)
    {
        vspd = jspd;
        audio_play_sound(snd_jump, 5, false);
    }
    
    if (hspd == 0)
    {
        // Set the sprite for idle
        sprite_index = spr_player_idle;
        image_speed = .1;
    } else
    {
        sprite_index = spr_player_move;
        image_speed = .253;
    }
}

if (right || left)
{
    hspd += (right - left) * acc;
    
    if (hspd > spd) hspd = spd; // cap the speed to max speed
    if (hspd < -spd) hspd = -spd;
}
else
{
    apply_friction(acc);
}

// Flip the image sprite in the right direction
if (hspd != 0)
{
    image_xscale = sign(hspd);
}

// Play the landing sound
if (place_meeting(x, y+ vspd + 1, Solid) && vspd > 0)
{
    audio_emitter_pitch(audio_em, random_range(0.8, 1.2));
    audio_emitter_gain(audio_em, random_range(0.1, 0.3));
    audio_play_sound_on(audio_em, snd_step, false, 5);
}

Move(Solid);

// Check for ledge grab state
var falling = y - yprevious > 0;
var wasnt_wall = !position_meeting(x + 20 * image_xscale, yprevious, Solid);
var is_wall = position_meeting(x + 20 * image_xscale, y, Solid);

if (falling && wasnt_wall && is_wall)
{
    hspd = 0;
    vspd = 0;
    
    // Move towards the ledge
    while(!place_meeting(x + image_xscale, y, Solid))
    {
        x += image_xscale;
    }
    
    // Adjust the height
    while(position_meeting(x + 20 * image_xscale, y - 1, Solid))
    {
        y -= 1;
    }
    
    // Change state to the ledge grab state
    sprite_index = spr_player_grab;
    image_speed = .1;
    state = player_ledge_grab_state;
    
    // Play the ledge grab sound
    audio_emitter_pitch(audio_em, 1.5);
    audio_emitter_gain(audio_em, .1);
    audio_play_sound_on(audio_em, snd_step, false, 5);
    
}
