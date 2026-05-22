// Имена действий
action_names = ["Поклониться", "Прыгнуть", "Повернуться", "Молчать"];
action_keys = ["bow", "jump", "turn", "silence"]; // для ключей диалогов
button_keys = [ord("1"), ord("2"), ord("3"), ord("4")]; // клавиши 1-4

// Состояние кнопок (все кроме "Молчать" активны сразу)
button_active = [true, true, true, false];

// Переменные прогресса
orders_done = 0;            // сколько приказов выполнено (кроме молчания)
silence_used = false;       // нажимал ли молчание
king_command = "";          // какой приказ ждёт король после молчания
disobey_count = 0;          // раз подряд не подчинился
final_hint_shown = false;   // показывали ли финальную подсказку
final_triggered = false;    // начата ли финальная цепочка
can_exit = false;

// Ожидаемое действие после диалога
pending_action = "";
pending_action_phase = 0;   // 0-нет, 1-ждём выполнения, 2-ждём окончания радости

state = "intro";

// Запускаем вступительный диалог
with (obj_dialog) {
    if (!queue_active) {
        dialog_queue = ds_list_create();
        queue_active = true;
    }
    ds_list_add(dialog_queue, "king_intro");
}

// Обработка обычного приказа
handle_order = function(i) {
    var act_key = action_keys[i];
    pending_action = act_key;
    pending_action_phase = 1;
    state = "processing_action";
    // Активируем кнопку "Молчать" после первого приказа
    if (orders_done == 0) {
        button_active[3] = true;
    }
    orders_done++;
    // Показываем диалог приказа
    with (obj_dialog) {
        if (!queue_active) {
            dialog_queue = ds_list_create();
            queue_active = true;
        }
        ds_list_add(dialog_queue, "king_order_" + act_key);
    }
}

// Обработка нажатия "Молчать"
handle_silence = function() {
    if (!silence_used) {
        silence_used = true;
        // Первое молчание: король нервничает и приказывает поклониться
        king_command = "bow";
        disobey_count = 0;
        state = "king_ordered";
        show_hint("king_silence_first");
    } else {
        // Повторное молчание: переход к финальной цепочке
        final_triggered = true;
        state = "final_wait_turn";
        show_hint("king_final_silence");
        // Подсказка, что нужно нажать "Повернуться", уже была ранее
    }
}

// Показать диалог-подсказку
show_hint = function(key) {
    with (obj_dialog) {
        if (!queue_active) {
            dialog_queue = ds_list_create();
            queue_active = true;
        }
        ds_list_add(dialog_queue, key);
    }
}

// Активировать выход
activate_exit = function() {
    with (oExit) {
        can_exit = true;
        visible = true;
    }
}