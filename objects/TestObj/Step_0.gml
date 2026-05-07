if (instance_exists(oPlayer)) {
    
    // Вычисляем расстояние до игрока
    var dist = point_distance(x, y, oPlayer.x, oPlayer.y);
	player_nearby = (dist <= interaction_distance);
	
		
    // Проверяем, находится ли игрок в радиусе взаимодействия
    if (dist <= interaction_distance) {
        can_interact = true;
        
        // Проверяем нажатие клавиши E
        if (player_nearby && keyboard_check(ord("E"))) {
            if (!key_pressed) {	
                key_pressed = true; // Блокируем повторное нажатие
            }
        } else {
            key_pressed = false; // Разблокируем когда клавишу отпустили
        }
        
    } else {
        can_interact = false;
    }
    
} else {
    can_interact = false;
	player_nearby = false;
}
