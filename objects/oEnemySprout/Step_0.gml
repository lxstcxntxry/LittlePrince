if (global.game_paused) exit;

// Проверка существования игрока
if (!instance_exists(oPlayer)) {
    exit;
}

// Вычисляем расстояние до игрока
var dist = point_distance(x, y, oPlayer.x, oPlayer.y);

// Проверяем близость игрока
if (dist <= interaction_distance) {
    show_hint = true;
    
    // Взаимодействие по клавише E
    if (keyboard_check_pressed(ord("E"))) {
        // Можно добавить эффект исчезновения
        effect_create_above(ef_smoke, x, y, 3, c_white);
        
        // Можно добавить звук
        // audio_play_sound(snd_plant_destroy, 1, false);
        
        // Уничтожаем растение
        instance_destroy();
		oEnemySprout_zone.baobabs_cut += 5;
    }
} else {
    show_hint = false;
}

// Постепенное увеличение размера
if (image_xscale < scale_max) {
    image_xscale += scale_speed;
    image_yscale += scale_speed;
} else {
    // Достигли максимального размера
    image_xscale = scale_max;
    image_yscale = scale_max;
}
