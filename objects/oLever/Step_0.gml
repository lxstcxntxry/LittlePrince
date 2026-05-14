if (global.game_paused) exit;
if (obj_planet_controller.puzzle_solved) exit;   // после решения рычаги не работают

// Взаимодействие при нажатии E рядом с игроком
if (distance_to_object(oPlayer) < 40) {
    if (keyboard_check_pressed(ord("E"))) {
        toggle();
    }
}