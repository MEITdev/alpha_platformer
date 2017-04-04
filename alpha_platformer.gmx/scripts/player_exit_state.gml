///player_exit_state
if (image_alpha > 0)
{
    image_alpha -= .2;   
} 
else
{
    if (room != room_last)
    {
        room_goto_next();
    }
    else
    {
        // calculate the players high score
        score = PlayerStats.remaining_time + PlayerStats.player_blue_gems * 3;
        
        // read the current high score
        ini_open("highscore.ini");
        PlayerStats.highscore = ini_read_real("Score", "highscore", 0);
        
        // store new high score
        if score > PlayerStats.highscore
        {
            PlayerStats.highscore = score;
            ini_write_real("Score", "highscore", PlayerStats.highscore);
        }
        // Close the ini file
        ini_close();
        
        room_goto(rm_highscore);
    }
}
