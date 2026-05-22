if (global.game_paused) exit;

var health_percent = (current_health / max_health) * 100;

if (!first_touch) and (!obj_event_controller.victory) {
	if (current_health > 0) {
		current_health -= health_decay_speed * (1 / room_speed);
		current_health = max(0, current_health); // Не меньше 0
	
		// Смена спрайта в зависимости от здоровья
		if (health_percent > 66) {
			sprite_index = sprite_1;
		} else if (health_percent > 33) {
			sprite_index = sprite_2;
		} else {
			sprite_index = sprite_3;
		}
		if (current_health == 0) {
				
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
			if (first_touch) 
			{
					with (obj_dialog) 
					{
				    if (dialog_queue != noone) {
				        ds_list_destroy(dialog_queue); // На всякий случай очищаем, если уже что-то было
				    }
				    dialog_queue = ds_list_create();
				    ds_list_add(dialog_queue, "l1rosewc");
					ds_list_add(dialog_queue, "l1rosewc2");
					ds_list_add(dialog_queue, "l1baobabRise");
	
				    // Можно добавить сколько угодно ключей!
				    queue_active = true;
					}
			first_touch = false;
			obj_baobab_gauge.appearence = true;
			}
			if (obj_event_controller.victory) 
			{
			with (obj_dialog) 
					{
				    if (dialog_queue != noone) {
				        ds_list_destroy(dialog_queue); // На всякий случай очищаем, если уже что-то было
				    }
				    dialog_queue = ds_list_create();
				    ds_list_add(dialog_queue, "l1rosefd1");
					ds_list_add(dialog_queue, "l1rosefd2");
					ds_list_add(dialog_queue, "l1rosefd3");
	
				    // Можно добавить сколько угодно ключей!
				    queue_active = true;
					}
			obj_event_controller.final_step = true;
			}
			else
			{
		        if (!key_pressed) 
				{	
					current_health = max_health;
		            key_pressed = true; // Блокируем повторное нажатие
		        }
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
