///boss_idle_state()
var dis = point_distance(x, y, Player.x, Player.y);

if (dis < 128)
{
    state = boss_defend_state;
    
    // Play the boss music
    if (!audio_is_playing(snd_theme_song))
    {
        audio_emitter_gain(audio_em, 0.5);
        audio_play_sound_on(audio_em, snd_music_boss, true, 10);
    }
}
