// oCommandManager Step Event
if (global.game_paused) exit;
if ((oKing.first_touch) or (oKing.last_step)) {
    show_commands = false;
    current_command = -1;
    waiting_for_input = false;
    exit;
}
if (instance_exists(oKing)) {
	if (!show_commands) {
	    show_commands = true;
	    success_in_row = 0;
	    // NEXT_COMMAND
	    current_command = irandom(2); // 0,1,2
	    command_time = command_duration;
	    waiting_for_input = true;
	}

	if (waiting_for_input) {
	    command_time--;

	    var action_done = false;
	    switch (current_command) {
	        case 0: // Повернуться (1)
	            if (keyboard_check_pressed(ord("1"))) {
	                action_done = true;
	            }
	            break;
	        case 1: // Подпрыгнуть (2)
	            if (keyboard_check_pressed(ord("2"))) {
	                action_done = true;
	            }
	            break;
	        case 2: // Поклониться (3)
	            if (keyboard_check_pressed(ord("3"))) {
	                action_done = true;
	            }
	            break;
	    }

	    if (action_done) {
	        success_in_row += 1;
	        waiting_for_input = false;

	        // Включаем зелёную подсветку
	        show_success = true;
	        success_flash_timer = success_flash_duration;

	        if (success_in_row >= max_success) {
	            oKing.last_step = true;
	            exit;
	        }
	        alarm[0] = 30;
	    } else if (command_time <= 0) {
	        // Время вышло
	        waiting_for_input = false;
			obj_event_controller.gameover = true;
	        exit;
	    }
	}

	// Таймер зелёной подсветки
	if (show_success) {
	    success_flash_timer--;
	    if (success_flash_timer <= 0) {
	        show_success = false;
	    }
	}
}