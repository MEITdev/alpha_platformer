///player_ledge_grab_state
if (down)
{
    state = player_move_state;
}

if (up)
{
    state = player_move_state;
    // Jump after setting the state
    vspd = jspd;
    audio_play_sound(snd_jump, 5, false);
}
