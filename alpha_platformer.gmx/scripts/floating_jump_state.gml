///floating_jump_state()
sprite_index = spr_floating;
image_speed = .2;

//Apply gravity
if (!place_meeting(x, y + 1, Solid))
{
    vspd += grav;
}
else
{
    vspd = 0;
    
    // Apply friction
    apply_friction(acc);
    
    // Check for idle state
    if (hspd == 0 && vspd == 0)
    {
        state = floating_idle_state;
        alarm[0] = 30; // set alarm to .5 seconds
        sprite_index = spr_floating_idle;
        image_speed = .2;
    }
}

if (hspd != 0)
{
    image_xscale = sign(hspd);
}

// Move
Move_bounce(Solid);
