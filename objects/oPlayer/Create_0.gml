depth = 2;

move_speed = 10; // Скорость движения персонажа
show_dialog = false;

sprite_base = sprPlayer_Front; // движение вниз + статика
sprite_blink = sprPlayer_Blink;
sprite_w = sprPlayer_Behind;  // движение вверх


// Устанавливаем начальный спрайт
sprite_index = sprite_base;

blink_timer = irandom_range(70, 100); // случайное время до следующего моргания (в шагах)
is_blinking = false;
blink_length = 6; // сколько шагов длится само моргание





action_timer = 0;
action_sprite = -1;

perform_action = function(action) {
    switch (action) {
        case "bow":
            action_timer = 30;
            sprite_index = sprPlayer_Front; // ваш спрайт поклона
            break;
        case "jump":
            y -= 20;
            action_timer = 10;
            break;
        case "turn":
            image_xscale = -image_xscale;
            action_timer = 15;
            break;
    }
}