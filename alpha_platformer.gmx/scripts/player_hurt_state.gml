///player_hurt_state()

// Set the hurt sprite
sprite_index = spr_player_hit;

if (hspd != 0) image_xscale = sign(hspd);

// Apply gravity
if (!place_meeting(x, y + 1, Solid))
{
    vspd += grav;
}
else
{
    vspd = 0;   
    apply_friction(acc);
}

Direction_move_bounce(Solid);

// Change back to idle state
if (hspd == 0 && vspd == 0)
{
    // reset the blend
    image_blend = c_white;
    state = player_move_state;
}
