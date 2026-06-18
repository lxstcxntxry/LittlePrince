if (global.game_paused) exit;

if (instance_exists(oRose)) {
	// Основная проверка количества врагов:
	if (instance_number(oEnemySprout) >= max_enemies) and (!victory) {
	    gameover = true;
	    // Показываем диалог через менеджер
	    if (instance_exists(obj_dialog)) {
	        with (obj_dialog) show_dialog("gameov1Baoba");
	    }
	}

	// Проверка здоровья розы:
	if (oRose.current_health == 0) and (!victory) {
	    gameover = true;
	    // Показываем диалог через менеджер
	    if (instance_exists(obj_dialog)) {
	        with (obj_dialog) show_dialog("gameov1Decay");
	    }
	}

	// Проверка количества срубленных баобабов:
	if (oEnemySprout_zone.baobabs_cut == 10) and (!victory){
	    // Показываем диалог через менеджер
		if (instance_exists(obj_dialog)) 
		{
			with (obj_dialog) show_dialog("l1rosefd0");
		}
		victory = true;
	}
	
	// Проверка на заключительный диалог с Розой
	if (final_step) and (obj_dialog.dialog_queue == noone)
	{
		gameover = true;
		// Показываем диалог через менеджер
		if (instance_exists(obj_dialog)) 
		{
			with (obj_dialog) show_dialog("gameov1Victo");
		}
	}
	
}

if (instance_exists(oLantern)) {
	// Проверка на заключительный диалог с Фонарщиком
	if (final_step3) and (obj_dialog.dialog_queue == noone)
	{
		gameover = true;
		// Показываем диалог через менеджер
		if (instance_exists(obj_dialog)) 
		{
			with (obj_dialog) show_dialog("gameov3Victo");
		}
	}
}

if (instance_exists(oKing)) {
	// Проверка на заключительный диалог с Фонарщиком
	if (obj_OrderController.game_over)
	{
		gameover = true;
		// Показываем диалог через менеджер
		if (instance_exists(obj_dialog)) 
		{
			with (obj_dialog) show_dialog("gameov2Victo");
		}
	}
}


// Если уже gameover, ждем закрытия диалога
if (gameover) {
    room_goto(Lobby); // Переход в лобби
    victory = false;
	exit;
}
