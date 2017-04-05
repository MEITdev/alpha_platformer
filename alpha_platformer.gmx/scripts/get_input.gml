///get_input()

// Default controls are KEYBOARD
up = keyboard_check_pressed(vk_up);
up_release = keyboard_check_released(vk_up);
down = keyboard_check(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
activate = keyboard_check_pressed(vk_space);

// Override when GamePad detected
var gp_id = 0; // gamepad ID
var thresh = .5;

if(gamepad_is_connected(gp_id))
{
    up = gamepad_button_check(gp_id, gp_face1); // A button on XBOX game controller
    up_release = gamepad_button_check_released(gp_id, gp_face1);
    left = gamepad_axis_value(gp_id, gp_axislh) < -thresh;
    right = gamepad_axis_value(gp_id, gp_axislh) > thresh;    
    down = gamepad_axis_value(gp_id, gp_axislv) > thresh;
    activate = gamepad_button_check(gp_id, gp_face2); // B button on XBOX game controller
}
