/// @description Инициализация планеты и рычагов

// Эффекты каждого рычага (А, Б, В, Г)
lever_effects = [-3, -11, -5, 3];

// Состояния рычагов: false = выключен, true = включен
// По умолчанию всё выключено (можно изменить в комнате)
levers = array_create(4, false);

// Текущая и целевая скорости
planet_speed = 10;
global.planet_speed = planet_speed;
target_speed = 2;

// Флаг решённой головоломки
solved = false;
next_dialog_shown = false;

// Тряска экрана
orig_cam_x = camera_get_view_x(view_camera[0]);
orig_cam_y = camera_get_view_y(view_camera[0]);
shake_timer = 0;
shake_intensity = 0;

// Карта подсказок: скорость -> ID диалога
hint_map = ds_map_create();
hint_map[? 13] = "lever_hint_13";
hint_map[? 10] = "lever_hint_10";
hint_map[? 8]  = "lever_hint_8";
hint_map[? 7]  = "lever_hint_7";
hint_map[? 5]  = "lever_hint_5";
hint_map[? 0]  = "lever_hint_0";
hint_map[? 2]  = "lever_success";

// Функция показа подсказки (кроме особого случая успеха)
show_hint = function(speed) {
	if (ds_map_exists(hint_map, speed)) {
		var d_id = hint_map[? speed];
		with (obj_dialog) show_dialog(d_id);
	}
}

// Метод, вызываемый рычагом при переключении
set_lever = function(ind, state) {
	levers[ind] = state;
	recalc_speed();
}

// Пересчёт скорости, эффекты и диалоги
recalc_speed = function() {
	var _new_speed = 10;
	for (var i = 0; i < 4; i++) {
		if (levers[i]) _new_speed += lever_effects[i];
	}
	
	planet_speed = _new_speed;
	global.planet_speed = planet_speed;
	
	// Визуальная отдача: тряска экрана
	screen_shake(4, 10);
	
	// Логика подсказок
	if (planet_speed == 2 && !solved) {
		solved = true;
		with (obj_dialog) show_dialog("lever_success");
		alarm[0] = 120; // через 2 сек (60 fps) покажем следующий диалог
	} else {
		show_hint(planet_speed);
	}
}

// Функция тряски камеры
screen_shake = function(intensity, duration) {
	shake_intensity = intensity;
	shake_timer = duration;
}