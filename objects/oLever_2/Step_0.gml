if (global.game_paused) exit;

if (oLanternKeeper.first_touch) exit;   // после решения рычаги не работают

if (instance_exists(oPlayer)) and (!obj_planet_controller.victory) {
    
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
				if (sprite_index == sprite_on) 
				{
				key_pressed = true; // Блокируем повторное нажатие
				sprite_index = sprite_off;
				effect_create_above(ef_smoke, x, y, 10, c_white);
				obj_planet_controller.start_shake(4, 15);
				obj_planet_controller.rotation_speed -= effect;
				obj_planet_controller.current_speed -= effect;
				}
				else 
				{
				key_pressed = true; // Блокируем повторное нажатие
				sprite_index = sprite_on;
				effect_create_above(ef_smoke, x, y, 10, c_white);
				obj_planet_controller.start_shake(4, 15);
				obj_planet_controller.rotation_speed += effect;
				obj_planet_controller.current_speed += effect;
				}
		        
				
		    }
			
	    } 
		else 
		{
	        key_pressed = false; // Разблокируем когда клавишу отпустили
	    }
        
	} 
	else 
	{
	    can_interact = false;
	}
    
} 
else 
{
	can_interact = false;
	player_nearby = false;
}
