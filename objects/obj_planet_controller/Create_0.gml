base_speed = 10;                // начальная скорость
puzzle_solved = false;			// 
rotation_speed = base_speed;    // текущая скорость вращения
current_speed = base_speed;     // текущая скорость для подсказок

// Для тряски камеры
shake_duration = 0;
shake_intensity = 0;

update_lever = function(index, state) {
    lever_states[index] = state;
    recompute_speed();
    show_hint();
    start_shake(4, 15);   // небольшая тряска при каждом переключении
    //audio_play_sound(snd_lever, 1, false);
}

recompute_speed = function() {
    var sum = 0;
    for (var i = 0; i < 3; i++) {
        if (lever_states[i]) sum += lever_effects[i];
    }
    current_speed = max(0, base_speed + sum);
    rotation_speed = current_speed;

    // Проверка на победу
    if (current_speed == 2 && !puzzle_solved) {
        puzzle_solved = true;
        // Добавляем финальную реплику после текущей подсказки
        with (obj_dialog) {
            if (!queue_active) {
                dialog_queue = ds_list_create();
                queue_active = true;
            }
            ds_list_add(dialog_queue, "lantern_success");
        }
        // Активируем выход
        activate_exit();
    }
}



start_shake = function(intensity, duration) {
    shake_intensity = intensity;
    shake_duration = duration;
}

activate_exit = function() {
    with (oExit) {
        can_exit = true;
        visible = true;
        // если есть спрайт активного выхода, можно сменить:
        // sprite_index = spr_exit_active;
    }
}

// Начальная подсказка при входе на уровень
with (obj_dialog) {
    if (!queue_active) {
        dialog_queue = ds_list_create();
        queue_active = true;
    }
    ds_list_add(dialog_queue, "intro_hint_1");
    ds_list_add(dialog_queue, "intro_hint_2");
}