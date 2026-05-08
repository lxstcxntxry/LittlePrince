/// Следование за игроком

// Если игрок уничтожен – ничего не делаем
if (!instance_exists(target)) exit;

// Получаем координаты игрока
var target_x = target.x;
var target_y = target.y;

// Вычисляем расстояние до цели
var dist = point_distance(x, y, target_x, target_y);

// Если мы уже достаточно близко – стоим на месте (не двигаемся)
if (dist <= stop_distance) {
    // Останавливаем анимацию
    moving = false;
    image_speed = 0;
    image_index = 0;
    exit; // выходим из события, не двигаемся
}

// Определяем направление к игроку (вектор)
var dx = target_x - x;
var dy = target_y - y;

// Нормализуем вектор, чтобы двигаться с постоянной скоростью (единичная длина)
var len = sqrt(dx*dx + dy*dy);
if (len != 0) {
    dx /= len;
    dy /= len;
}

// Пытаемся двигаться по X
var move_x = dx * follower_speed;
if (move_x != 0) {
    // Проверяем столкновение со стенами по оси X
    if (!place_meeting(x + move_x, y, oWall)) {
        x += move_x;
    } else {
        // Если упёрлись, пытаемся "проскользнуть" – двигаемся по X по пикселям (опционально)
        // Для упрощения можно оставить так, но добавим покапельное движение
        var i = abs(move_x);
        var sign_x = sign(move_x);
        while (i > 0) {
            if (!place_meeting(x + sign_x, y, oWall)) {
                x += sign_x;
            } else {
                break;
            }
            i -= 1;
        }
    }
}

// Пытаемся двигаться по Y
var move_y = dy * follower_speed;
if (move_y != 0) {
    if (!place_meeting(x, y + move_y, oWall)) {
        y += move_y;
    } else {
        var i = abs(move_y);
        var sign_y = sign(move_y);
        while (i > 0) {
            if (!place_meeting(x, y + sign_y, oWall)) {
                y += sign_y;
            } else {
                break;
            }
            i -= 1;
        }
    }
}

// Определяем направление взгляда (для анимации) по последнему движению
if (abs(dx) > abs(dy)) {
    // Двигаемся больше по горизонтали
    if (dx > 0) dir = 1; else dir = 3;
} else {
    // По вертикали
    if (dy > 0) dir = 2; else dir = 0;
}

// Выбираем спрайт по направлению
switch (dir) {
    case 0: sprite_index = spr_follower; break;
    case 1: sprite_index = spr_follower; break;
    case 2: sprite_index = spr_follower; break;
    case 3: sprite_index = spr_follower; break;
}

// Включаем анимацию, если двигаемся (расстояние больше stop_distance)
if (dist > stop_distance) {
    image_speed = 0.2;
} else {
    image_speed = 0;
    image_index = 0;
}