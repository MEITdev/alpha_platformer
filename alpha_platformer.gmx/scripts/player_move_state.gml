///player_move_state()

// Variables for User INPUT
var up = keyboard_check(vk_up);
var up_release = keyboard_check_released(vk_up);
var down = keyboard_check(vk_down);
var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);

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

if (right)
{
    hspd = spd;
}

if (left)
{
    hspd = -spd;
}

// Flip the image sprite in the right direction
if (hspd != 0)
{
    image_xscale = sign(hspd);
}

// Friction
if (!left && !right)
{
    hspd = 0;
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
}
