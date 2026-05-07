if (global.game_paused) exit;

// Увеличиваем таймер
spawn_timer++;

// Если прошло достаточно времени
if (spawn_timer >= spawn_interval) {
    // Проверяем, не превышено ли максимальное количество растений
    var current_plants = instance_number(oEnemySprout);
    
    if (current_plants < max_plants) {
        // Генерируем случайные координаты в заданной области
        var spawn_x = irandom_range(spawn_x_min, spawn_x_max);
        var spawn_y = irandom_range(spawn_y_min, spawn_y_max);
        
        // Создаем растение
        instance_create_layer(spawn_x, spawn_y, "Instances", oEnemySprout);
        
        // Если у вас другое имя слоя, замените "Instances" на ваше
        // Например: instance_create_layer(spawn_x, spawn_y, "Enemy", obj_enemy_plant);
    }
    
    // Сбрасываем таймер
    spawn_timer = 0;
}
