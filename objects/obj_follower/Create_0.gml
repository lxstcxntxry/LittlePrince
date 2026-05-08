/// Инициализация переменных
follower_speed = 2;                // Скорость движения (меньше, чем у игрока, чтобы создать эффект "отставания")
stop_distance = 20;                 // Дистанция, на которой follower останавливается (пикселей)
target = oPlayer;                 // Объект, за которым следим (имя объекта игрока)

// Направление и анимация
dir = 2;                             // 0-вверх,1-вправо,2-вниз,3-влево
spr_up = spr_follower;
spr_down = spr_follower;
spr_left = spr_follower;
spr_right = spr_follower;
sprite_index = spr_follower;             // Начальный спрайт
image_speed = 0.2;                   // Скорость анимации