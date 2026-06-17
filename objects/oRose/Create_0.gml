depth = 1;

// Инициализация переменных
first_touch = true; // Первая встреча для диалога
interaction_distance = 200;  // Расстояние до игрока
max_health = 100;           // Максимальное здоровье
current_health = 100;       // Текущее здоровье
health_decay_speed = 1;   // Скорость убывания здоровья

// Текст-подсказка
interaction_text = "Нажми [E] для того, чтобы полить";
interaction_text2 = "Нажми [E] для взаимодействия";
interaction_text3 = "Нажми [E] чтобы попрощаться";

// Переменная для отслеживания состояния спрайта
sprite_state = 0;

sprite_1 = sprRoseWell; // Первый спрайт
sprite_2 = sprRoseDry;  // Второй спрайт
sprite_3 = sprRoseDead; // Третий спрайт

// Устанавливаем начальный спрайт
sprite_index = sprite_1;

// Переменная для проверки, может ли игрок взаимодействовать
can_interact = false;

// Переменная для предотвращения множественного нажатия
key_pressed = false;

// Настройки взаимодействия
player_nearby = false;       // Рядом ли игрок
