if (global.game_paused) exit;

/// obj_OrderController: Alarm[0]
// Запуск новой «команды короля»
if (game_over || level_cleared) or (!oKing.first_touch) exit;

current_command = irandom_range(0, 2);
waiting_for_input = true;
round_active = true;
time_left = order_window_steps;

// Обновляем текст баннера
switch (current_command) {
    case eCommand.TURN:
        global.order_text = "Король приказывает: Повернуться!";
        break;
    case eCommand.JUMP:
        global.order_text = "Король приказывает: Подпрыгнуть!";
        break;
    case eCommand.BOW:
        global.order_text = "Король приказывает: Поклониться!";
        break;
}

// Можно добавить звук/эффект тут при объявлении приказа
