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