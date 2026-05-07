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