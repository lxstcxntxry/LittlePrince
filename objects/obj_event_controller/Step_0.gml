if (global.game_paused) exit;

if (instance_exists(oRose)){
	// Основная проверка количества врагов:
	if (instance_number(oEnemySprout) >= max_enemies) {
	    gameover = true;
	    // Показываем диалог через менеджер
	    if (instance_exists(obj_dialog)) {
	        with (obj_dialog) show_dialog("gameover");
	    }
	}

	// Проверка здоровья розы:
	if (oRose.current_health == 0) {
	    gameover = true;
	    // Показываем диалог через менеджер
	    if (instance_exists(obj_dialog)) {
	        with (obj_dialog) show_dialog("gameover");
	    }
	}

	// Проверка здоровья розы:
	if (oEnemySprout_zone.killed_baobabs == 10) {
	    // Показываем диалог через менеджер
	    if (instance_exists(obj_dialog)) {
	        with (obj_dialog) show_dialog("l1baobabs");
	    }
		victory = true;
	}
}
// Если уже gameover, ждем закрытия диалога
if (gameover) {
    room_goto(Lobby); // Переход в лобби
    exit;
}
