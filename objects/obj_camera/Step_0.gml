/// Следование за игроком
if (!instance_exists(target)) exit;

// Получаем координаты игрока
var target_x = target.x;
var target_y = target.y;

// Вычисляем координаты камеры так, чтобы игрок был в центре
var cam_x = target_x - view_width / 2;
var cam_y = target_y - view_height / 2;

// (Опционально) Ограничиваем камеру границами комнаты
cam_x = clamp(cam_x, 0, room_width - view_width);
cam_y = clamp(cam_y, 0, room_height - view_height);

// Устанавливаем новую позицию камеры
camera_set_view_pos(camera, cam_x, cam_y);