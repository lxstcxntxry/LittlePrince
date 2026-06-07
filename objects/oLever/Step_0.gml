if (global.game_paused) exit;
if (obj_planet_controller.puzzle_solved) exit;   // после решения рычаги не работают

if (instance_exists(oPlayer)) {
    
	// Вычисляем расстояние до игрока
	var dist = point_distance(x, y, oPlayer.x, oPlayer.y);
	player_nearby = (dist <= interaction_distance);
	
	// Проверяем, находится ли игрок в радиусе взаимодействия
	if (dist <= interaction_distance) {
	    can_interact = true;
        
	// Проверяем нажатие клавиши E
	if (player_nearby and keyboard_check(ord("E"))) {
		if (!key_pressed) 
			{
			key_pressed = true; // Блокируем повторное нажатие
			}
		if (active) {
			sprite_index = sprite_off;
			active = false;
			}
		else 
			{
			sprite_index = sprite_on;
			active = true;
			}
		} else 
		{
		key_pressed = false;
		}
	}
}


if (instance_exists(oPlayer)) {
    
	// Вычисляем расстояние до игрока
	var dist = point_distance(x, y, oPlayer.x, oPlayer.y);
	player_nearby = (dist <= interaction_distance);
	
		
	// Проверяем, находится ли игрок в радиусе взаимодействия
	if (dist <= interaction_distance) {
	    can_interact = true;
        
	    // Проверяем нажатие клавиши E
	    if (player_nearby && keyboard_check(ord("E"))) 
		{
			if (!key_pressed) 
				{	
		            key_pressed = true; // Блокируем повторное нажатие
		        }
		}
		else 
		{
	        key_pressed = false; // Разблокируем когда клавишу отпустили
	    }
        
	} else 
	{
	    can_interact = false;
	}
}