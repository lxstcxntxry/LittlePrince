if (global.game_paused) exit;

// Обработка состояний
switch (state) {
    case "hello_dialog":
        if (!obj_dialog.dialog_showing && !obj_dialog.queue_active) {
            state = "wait_approach";
        }
        break;

    case "wait_approach":
        // Проверяем расстояние между игроком и королём
        if (instance_exists(oKing) && instance_exists(oPlayer)) {
            var dist = point_distance(oPlayer.x, oPlayer.y, oKing.x, oKing.y);
            if (dist < 80) {   // подошёл достаточно близко
                state = "minister_dialog";
                with (obj_dialog) {
                    if (!queue_active) {
                        dialog_queue = ds_list_create();
                        queue_active = true;
                    }
                    ds_list_add(dialog_queue, "king_minister");
                }
            }
        }
        break;

    case "minister_dialog":
    if (!obj_dialog.dialog_showing && !obj_dialog.queue_active) {
        // Сразу показываем следующую реплику, без выбора
        with (obj_dialog) {
            if (!queue_active) {
                dialog_queue = ds_list_create();
                queue_active = true;
            }
            ds_list_add(dialog_queue, "king_judge");
        }
        state = "judge_dialog";
    }
    break;

    case "judge_dialog":
        if (!obj_dialog.dialog_showing && !obj_dialog.queue_active) {
            show_hint("king_waiting_hint");
            activate_buttons();
            state = "order_loop";
        }
        break;

    case "order_loop":
        // Подсказки (однократно)
        if (orders_done >= 3 && !silence_used && !stop_hint_shown) {
            stop_hint_shown = true;
            show_hint("king_hint_stop");
        }
        if (orders_done >= 5 && silence_used && !final_triggered && !final_hint_shown) {
            final_hint_shown = true;
            show_hint("king_final_hint");
        }

        // Проверка нажатий кнопок (1-4)
        for (var i = 0; i < 4; i++) {
            if (button_active[i] && keyboard_check_pressed(ord(string(i+1)))) {
                if (i == 3) { // Молчать
                    if (!silence_used) {
                        silence_used = true;
                        king_command = "bow";
                        disobey_count = 0;
                        state = "king_ordered";
                        show_hint("king_silence_first");
                    } else {
                        final_triggered = true;
                        state = "final_wait_turn";
                        show_hint("king_final_silence");
                    }
                } else {
                    // Обычный приказ
                    var act = action_keys[i];
                    pending_action = act;
                    pending_after_key = "king_after_" + act;
                    action_phase = 1;
                    state = "order_dialog_before";
                    orders_done++;
                    // Активируем кнопку Молчать после первого приказа
                    if (orders_done == 1) {
                        activate_silence_button();
                    }
                    show_hint("king_order_" + act);
                }
                break; // одно нажатие за кадр
            }
        }
        break;

    case "order_dialog_before":
        // Ждём закрытия диалога приказа
        if (!obj_dialog.dialog_showing && !obj_dialog.queue_active) {
            if (action_phase == 1) {
                // Выполняем действие игрока
                perform_player_action(pending_action);
                action_phase = 2;
                // Показываем реплику после анимации
                show_hint(pending_after_key);
            } else if (action_phase == 2) {
                // После закрытия реплики "после" возвращаемся в цикл
                pending_action = "";
                pending_after_key = "";
                action_phase = 0;
                state = "order_loop";
            }
        }
        break;

    case "king_ordered":
        // Ожидаем, что игрок нажмёт Поклониться (1) или другую кнопку
        for (var i = 0; i < 4; i++) {
            if (button_active[i] && keyboard_check_pressed(ord(string(i+1)))) {
                if (i == 0) { // Поклониться
                    perform_player_action("bow");
                    disobey_count = 0;
                    king_command = "";
                    state = "order_loop";
                    show_hint("king_obey_after");
                } else {
                    // Любое другое действие (включая "Молчать") — непослушание
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
                break;
            }
        }
        break;

    case "final_wait_turn":
        // Активируем только кнопку "Повернуться" (3)
        if (keyboard_check_pressed(ord("3"))) {
            perform_player_action("turn");
            state = "final_done";
            show_hint("king_final_command");
            show_hint("king_final_player_thought");
            // Активируем выход
            with (oExit) {
                can_exit = true;
                visible = true;
            }
        }
        break;

    case "final_done":
    if (!obj_dialog.dialog_showing && !obj_dialog.queue_active) {
        if (!exit_triggered) {
            exit_triggered = true;
            final_timer = 90;   // примерно 1.5 секунды при 60 fps
        }
        if (final_timer > 0) {
            final_timer--;
        } else {
            // Переход в главное меню
            room_goto(Lobby);   // замените Lobby на имя вашей комнаты, если отличается
        }
    }
    break;
}