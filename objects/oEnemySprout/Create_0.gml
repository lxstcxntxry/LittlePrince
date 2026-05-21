depth = 0; // Поверх всего


// Инициализация переменных
interaction_distance = 200;      // Дистанция для взаимодействия
scale_start = 0.1;              // Начальный размер (50%)
scale_max = 1.2;                // Максимальный размер (200%)
scale_speed = 0.002;            // Скорость роста за кадр

// Текст-подсказка
interaction_text = "[E] - уничтожить";

// Устанавливаем начальный размер
image_xscale = scale_start;
image_yscale = scale_start;

show_hint = false;              // Показывать ли подсказку
