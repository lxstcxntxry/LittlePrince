
if (!transition_started) {
    timer += 1;
    if (timer >= wait_duration) {
        transition_started = true;
        // Перемещаем игрока на новый уровень, например:
        ready_to_transit = true;
		if (global.target_room == 1) {
		room_goto(Planet1);
		}
		if (global.target_room == 2) {
		room_goto(Planet2);
		}
		if (global.target_room == 3) {
		room_goto(Planet3);
		}
		if (global.target_room == 4) {
		room_goto(Planet4);
		}
    }
}
