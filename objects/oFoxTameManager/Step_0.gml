if (global.game_paused) exit;

if (!instance_exists(Fox)) exit;

// Запустить приручение, когда нужно (например, когда игрок близко)
if (Fox.ready_to_tame && !show_actions) and (!final_step) {
    show_actions = true;
    waiting_for_input = true;
    current_step = 0;
    fox_unhappy = false;
    show_fail = false;
    show_success = false;
}

// Логика ввода
if (show_actions && waiting_for_input) {
    var action_chosen = -1;
    if (keyboard_check_pressed(ord("1"))) action_chosen = 0;
    if (keyboard_check_pressed(ord("2"))) action_chosen = 1;
    if (keyboard_check_pressed(ord("3"))) action_chosen = 2;
    
    if (action_chosen != -1) {
        if (action_chosen == correct_sequence[current_step]) {
            current_step += 1;
            show_success = true;
            flash_timer = flash_duration;
            if (current_step >= array_length(correct_sequence)) {
                // Успех! Лис приручён
                Fox.tamed = true;
                show_actions = false;
                final_step = true;
				exit;
            }
        } else {
            // Ошибка! Лис недоволен
            fox_unhappy = true;
            show_fail = true;
            flash_timer = flash_duration;
            current_step = 0;
        }
    }
}

// Таймер для подсветки
if (show_success || show_fail) {
    flash_timer--;
    if (flash_timer <= 0) {
        show_success = false;
        show_fail = false;
    }
}

// По желанию, сбросить миниигру если лис недоволен
if (fox_unhappy && !show_fail) {
    waiting_for_input = true;
    fox_unhappy = false;
}
