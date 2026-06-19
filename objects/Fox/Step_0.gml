if (global.game_paused) exit;

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
				if (first_touch) 
				{
					with (obj_dialog) 
						{
					    if (dialog_queue != noone) {
					        ds_list_destroy(dialog_queue); // На всякий случай очищаем, если уже что-то было
					    }
					    dialog_queue = ds_list_create();
					    ds_list_add(dialog_queue, "l4fox");
						
					    queue_active = true;
						}
					first_touch = false;
					ready_to_tame = true;
				} 
				if (oFoxTameManager.final_step) 
				{
					with (obj_dialog) 
						{
					    if (dialog_queue != noone) {
					        ds_list_destroy(dialog_queue); // На всякий случай очищаем, если уже что-то было
					    }
					    dialog_queue = ds_list_create();
					    ds_list_add(dialog_queue, "l4foxWin");
						ds_list_add(dialog_queue, "l4foxWin2");
						ds_list_add(dialog_queue, "l4foxWin3");
					    queue_active = true;
						}
				obj_event_controller.final_step4 = true;
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
