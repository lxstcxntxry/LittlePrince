final_timer = 0;            // таймер задержки перед уходом
exit_triggered = false;     // чтобы не запускать таймер повторно

// Инициализация глобальной паузы, если ещё не задана
if (!variable_global_exists("game_paused")) {
    global.game_paused = false;
}

// Состояния
state = "hello_dialog";         // hello_dialog → wait_approach → minister_dialog → wait_choice → judge_dialog → order_loop → ...

// Действия и кнопки
action_names = ["Поклониться", "Прыгнуть", "Повернуться", "Молчать"];
action_keys  = ["bow", "jump", "turn", "silence"];
button_active = [false, false, false, false];  // станут true после judge_dialog

// Прогресс
orders_done = 0;
silence_used = false;
king_command = "";
disobey_count = 0;
final_triggered = false;
can_exit = false;

// Подсказки однократно
stop_hint_shown = false;
final_hint_shown = false;

// Ожидаемое действие (для анимации)
pending_action = "";
pending_after_key = ""; // ключ реплики после анимации
action_phase = 0;       // 0-нет, 1-ждём закрытия "до", 2-ждём закрытия "после"

// Показываем первый диалог сразу
with (obj_dialog) {
    if (!queue_active) {
        dialog_queue = ds_list_create();
        queue_active = true;
    }
    ds_list_add(dialog_queue, "king_hello");
}

// ===== МЕТОДЫ =====
show_hint = function(key) {
    with (obj_dialog) {
        if (!queue_active) {
            dialog_queue = ds_list_create();
            queue_active = true;
        }
        ds_list_add(dialog_queue, key);
    }
}

perform_player_action = function(act) {
    with (oPlayer) perform_action(act);
}

activate_buttons = function() {
    button_active = [true, true, true, false]; // Молчать неактивна
}

activate_silence_button = function() {
    button_active[3] = true;
}