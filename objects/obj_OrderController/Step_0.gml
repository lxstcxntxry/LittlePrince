if (global.game_paused) exit;

/// obj_OrderController: Step
if (game_over || level_cleared) exit;

if (round_active && waiting_for_input) or (oKing.first_touch) {
    // Счётчик времени
    time_left -= 1;
    
    // Проверка ввода на соответствие текущей команде
    var success = false;
    switch (current_command) {
        case eCommand.TURN:
            if (keyboard_check_pressed(key_turn_left) || keyboard_check_pressed(key_turn_right)) {
                success = true;
            }
            break;
        case eCommand.JUMP:
            if (keyboard_check_pressed(key_jump_1) || keyboard_check_pressed(key_jump_2)) {
                success = true;
            }
            break;
        case eCommand.BOW:
            if (keyboard_check_pressed(key_bow_1) || keyboard_check_pressed(key_bow_2)) {
                success = true;
            }
            break;
    }
    
    if (success) {
        streak += 1;
        waiting_for_input = false;
        round_active = false;
        global.order_text = "Верно!";
        
        // Победа при серии
        if (streak >= streak_to_win) {
            level_cleared = true;
			game_over = true;
            exit;
        }
        
        // Запуск следующего приказа через паузу
        alarm[0] = between_orders_steps;
    } else {
        // Провал по таймеру
        if (time_left <= 0) {
            waiting_for_input = false;
            round_active = false;
            streak = 0;
            global.order_text = "Промах! Время вышло.";
            // Отметим завершение (поражение)
            game_over = true;
            // TODO: ВСТАВЬТЕ СЮДА ЛОГИКУ ПРОВАЛА УРОВНЯ
            // пример:
			with (obj_dialog) 
						{
					    if (dialog_queue != noone) {
					        ds_list_destroy(dialog_queue); // На всякий случай очищаем, если уже что-то было
					    }
					    dialog_queue = ds_list_create();
					    ds_list_add(dialog_queue, "l2kingWin");
					
					    queue_active = true;
						}			
        }
    }
}
