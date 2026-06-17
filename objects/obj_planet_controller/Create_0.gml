base_speed = 10;                // начальная скорость		// 
rotation_speed = base_speed;    // текущая скорость вращения
current_speed = base_speed;     // текущая скорость для подсказок
target_speed = 2;

// Для тряски камеры
shake_duration = 0;
shake_intensity = 0;

// Победа на уровне
victory = false;

// небольшая тряска при каждом переключении
// start_shake(4, 15);   

start_shake = function(intensity, duration) 
{
    shake_intensity = intensity;
    shake_duration = duration;
}
