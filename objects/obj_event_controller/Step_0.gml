if (global.game_paused) exit;

// Основная проверка количества врагов:
if (instance_number(oEnemySprout) >= max_enemies) {
    gameover = true;
    // Показываем диалог через менеджер
    if (instance_exists(obj_dialog)) {
        with (obj_dialog) show_dialog("gameover");
    }
}

// Если уже gameover, ждем закрытия диалога
if (gameover) {
    room_goto(Lobby); // Переход в лобби
    exit;
}
