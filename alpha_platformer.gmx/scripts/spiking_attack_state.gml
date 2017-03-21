///spiking_attack_state()
sprite_index = spr_spiking_attack;

var dis = point_distance(x, y, Player.x, Player.y);

// check for the distance to Player
if (dis > sight)
{
    state = spiking_idle_state;
}
