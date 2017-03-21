///flying_state_idle()
image_index = spr_flying_idle;

// Look for the player
if (instance_exists(Player))
{
    var dis = point_distance(x, y, Player.x, Player.y);
    
    if (dis < sight)
    {
        y += 2;
        state = flying_chase_state;
    }
}
