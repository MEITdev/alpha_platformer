///floating_idle_state()
if (instance_exists(Player))
{
    var dis = distance_to_object(Player);
    
    // Check for distance
    if (dis < sight) && (alarm[0] < 0)
    {
        // face the player
        if (Player.x != x)
        {
            image_xscale = sign(Player.x - x);
        }

                    
        if (instance_exists(Player))
        {
            hspd = sign(Player.x - x) * spd;
            vspd = -abs(hspd * 2);
        }
        
        Move(Solid);
        state = floating_jump_state;

    }
}
