if (global.game_paused) exit;
if (obj_planet_controller.puzzle_solved) exit;   // после решения рычаги не работают

// Проверка существования игрока
if (!instance_exists(oPlayer)) {
    exit;
}

// Взаимодействие при нажатии E рядом с игроком
if (distance_to_object(oPlayer) < 40) {
	show_hint = true;
    if (keyboard_check_pressed(ord("E"))) {
        toggle();
    }
} else {
    show_hint = false;
}