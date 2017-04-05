///take_damage()
// Take damage
if (state != player_hurt_state)
{
    // Play the hurt sound
    audio_emitter_pitch(audio_em, random_range(1, 1.8));
    audio_emitter_gain(audio_em, 1.4);
    audio_play_sound_on(audio_em, snd_hurt, false, 5);
    
    image_blend = make_colour_rgb(220,150,150);
    vspd = jspd / 1.25;
    hspd = sign(x - other.x) * 6;
    
    state = player_hurt_state;
    
    Move(Solid);
    
    if (instance_exists(PlayerStats))
    {
        PlayerStats.player_hp -= 1;
    }
}
