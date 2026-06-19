max_enemies = 10;           // Сколько врагов считается пределом (пример)
gameover = false;           // Флаг завершения уровня
victory = false;			// Флаг завершения уровня по победе!
final_step = false;
final_step2 = false;
final_step3 = false;
final_step4 = false;
if (!variable_global_exists("target_room")) {
    global.target_room = 1;
}