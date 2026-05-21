<<<<<<< HEAD
/// @description Тряска экрана и контроль воспроизведения

if (shake_timer > 0) {
	var cam = view_camera[0];
	camera_set_view_pos(cam,
		orig_cam_x + random_range(-shake_intensity, shake_intensity),
		orig_cam_y + random_range(-shake_intensity, shake_intensity));
	shake_timer--;
	if (shake_timer == 0) {
		camera_set_view_pos(cam, orig_cam_x, orig_cam_y);
	}
}

// На случай, если понадобится обновлять orig_cam_x/y (например, камера двигается)
// Для статичной камеры можно не менять.
=======
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
} else {
    // Тряска кончилась – просто ничего не делаем, камера продолжит следовать за игроком
}
>>>>>>> master
