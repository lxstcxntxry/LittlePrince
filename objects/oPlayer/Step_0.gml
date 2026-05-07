if (global.game_paused) exit;

// Переменные для направления
var move_x = 0;
var move_y = 0;						

// Проверка клавиши W (вверх)
if (keyboard_check(ord("W"))) {
    if (!place_meeting(x, y - move_speed, oWall)) {
        y -= move_speed;
    }
}

// Проверка клавиши S (вниз)
if (keyboard_check(ord("S"))) {
    if (!place_meeting(x, y + move_speed, oWall)) {
        y += move_speed;
    }
}

// Проверка клавиши A (влево)
if (keyboard_check(ord("A"))) {
    if (!place_meeting(x - move_speed, y, oWall)) {
        x -= move_speed;
    }
}

// Проверка клавиши D (вправо)
if (keyboard_check(ord("D"))) {
    if (!place_meeting(x + move_speed, y, oWall)) {
        x += move_speed;
    }
}


// Движение
x += move_x * move_speed;
y += move_y * move_speed;