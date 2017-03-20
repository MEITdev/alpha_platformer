///player_ledge_grab_state
var up = keyboard_check(vk_up);
var down = keyboard_check(vk_down);

if (down)
{
    state = player_move_state;
}

if (up)
{
    state = player_move_state;
    // Jump after setting the state
    vspd = jspd;
}
