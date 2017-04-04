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
        score = remaining_time + PlayerStats.player_blue_gems * 3;
        room_goto(rm_highscore);
    }
}
