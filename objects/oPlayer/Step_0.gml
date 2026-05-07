if (global.game_paused) exit;

// Переменные для направления
var move_x = 0;
var move_y = 0;						


	if (keyboard_check(ord("W"))) {
	    if (!place_meeting(x, y - move_speed, oWall)) {
	        y -= move_speed;
			sprite_index = sprite_w;
	    }
	} else if (keyboard_check(ord("S"))) {
	    if (!place_meeting(x, y + move_speed, oWall)) {
	        y += move_speed;
			sprite_index = sprite_base;
	    }
	} else if (keyboard_check(ord("A"))) {
	    if (!place_meeting(x - move_speed, y, oWall)) {
	        x -= move_speed;
	    }
	} else if (keyboard_check(ord("D"))) {
	    if (!place_meeting(x + move_speed, y, oWall)) {
	        x += move_speed;
	    }
	} else {
	sprite_index = sprite_base;
	if (!is_blinking) {
        blink_timer--;
        if (blink_timer <= 0) {
            is_blinking = true;
            blink_timer = blink_length;
        }
    } else {
        blink_timer--;
        if (blink_timer <= 0) {
            is_blinking = false;
            blink_timer = irandom_range(70, 100);
        }
    }

    // Меняем спрайт на моргающий или обычный
    if (is_blinking) {
        sprite_index = sprite_blink; // спрайт с закрытыми глазами
    } else {
        sprite_index = sprite_base; // обычный лицевой спрайт
    }
	}


// Движение
x += move_x * move_speed;
y += move_y * move_speed;