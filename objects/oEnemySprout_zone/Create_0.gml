// Настройки спавна
max_plants = 100;        // Максимальное количество растений одновременно
spawn_interval = 200;   // Интервал между спавнами (в кадрах, 60 = 1 секунда)
spawn_timer = 0;        // Таймер для отсчета

// Можно задать конкретную область относительно комнаты:
// spawn_x_min = 0;
// spawn_x_max = room_width;
// spawn_y_min = 0;
// spawn_y_max = room_height;

spawn_x_min = bbox_left;
spawn_x_max = bbox_right;
spawn_y_min = bbox_top;
spawn_y_max = bbox_bottom;