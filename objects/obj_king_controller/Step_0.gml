if (global.game_paused) exit;

// Обработка фазы выполнения действия
if (state == "processing_action") {
    var dlg = obj_dialog;
    if (!dlg.dialog_showing && !dlg.queue_active) {
        if (pending_action_phase == 1) {
		// Сохраняем действие в локальную переменную перед with
		var _action = pending_action;
		with (oPlayer) perform_action(_action);
		pending_action_phase = 2;
		// Показываем радость короля
		with (obj_dialog) {
		    if (!queue_active) {
			    dialog_queue = ds_list_create();
				queue_active = true;
		    }
		    ds_list_add(dialog_queue, "king_joy");
	    }
	} else if (pending_action_phase == 2) {
            // Радость закрыта, возвращаемся в петлю
            pending_action = "";
            pending_action_phase = 0;
            state = "order_loop";
        }
    }
    exit;
}

// Основная логика по состояниям
switch (state) {
    case "intro":
        if (!obj_dialog.dialog_showing && !obj_dialog.queue_active) {
            state = "order_loop";
        }
        break;

    case "order_loop":
        // Проверяем кнопки
        for (var i = 0; i < 4; i++) {
            if (button_active[i] && keyboard_check_pressed(button_keys[i])) {
                if (i == 3) { // Молчать
                    handle_silence();
                } else {
                    handle_order(i);
                }
                break;
            }
        }
        // Подсказка после 3 приказов
        if (orders_done >= 3 && !silence_used && !final_hint_shown && !final_triggered) {
            final_hint_shown = true;
            show_hint("king_hint_stop");
        }
        // Подсказка "Пора лететь дальше" после 5 приказов, если уже было молчание
        if (orders_done >= 5 && silence_used && !final_triggered && !final_hint_shown) {
            final_hint_shown = true;
            show_hint("king_final_hint");
        }
        break;

    case "king_ordered":
        // Король приказал, ждём реакцию игрока
        for (var i = 0; i < 4; i++) {
            if (button_active[i] && keyboard_check_pressed(button_keys[i])) {
                if (king_command == "bow") {
                    if (i == 0) { // Поклониться – подчинение
                        // Выполняем действие
                        with (oPlayer) perform_action("bow");
                        disobey_count = 0;
                        king_command = "";
                        // Диалог подчинения
                        show_hint("king_obey_after");
                        state = "order_loop";
                    } else {
                        // Неподчинение
                        disobey_count++;
                        if (disobey_count == 1) {
                            show_hint("king_disobey1");
                        } else if (disobey_count == 2) {
                            show_hint("king_disobey2");
                        } else {
                            show_hint("king_disobey_repeat");
                        }
                        // Остаёмся в king_ordered
                    }
                }
                break;
            }
        }
        break;

    case "final_wait_turn":
        // Ждём, пока игрок нажмёт "Повернуться" (2)
        if (keyboard_check_pressed(button_keys[2])) {
            with (oPlayer) perform_action("turn");
            state = "final_done";
            with (obj_dialog) {
                if (!queue_active) {
                    dialog_queue = ds_list_create();
                    queue_active = true;
                }
                ds_list_add(dialog_queue, "king_final_command");
                ds_list_add(dialog_queue, "king_final_player_thought");
            }
            activate_exit();
        }
        break;

    case "final_done":
        // Ничего не делаем, выход уже активен
        break;
}