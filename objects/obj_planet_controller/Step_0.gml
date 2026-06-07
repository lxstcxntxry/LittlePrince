if (global.game_paused) exit;

// Тряска камеры
if (shake_duration > 0) {
    shake_duration--;
    var cam = view_get_camera(0);
    if (cam != noone) {
        // Получаем текущую позицию камеры (она уже следует за игроком)
        var cur_x = camera_get_view_x(cam);
        var cur_y = camera_get_view_y(cam);
        // Добавляем случайное смещение
        camera_set_view_pos(cam,
            cur_x + random_range(-shake_intensity, shake_intensity),
            cur_y + random_range(-shake_intensity, shake_intensity));
    }
}