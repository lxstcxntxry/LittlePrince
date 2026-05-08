// Если диалог показывается
if (dialog_showing) {
    // Плавное появление окна
    if (dialog_alpha < 1) {
        dialog_alpha += 1 / dialog_fade;
        if (dialog_alpha > 1) dialog_alpha = 1;
    }

    // Проверка нажатия пробела для закрытия диалога
    if (keyboard_check_pressed(vk_space)) {
        dialog_showing = false;
        global.game_paused = false;
    }
} else {
    // Если нужно — плавное исчезновение окна
    if (dialog_alpha > 0) {
        dialog_alpha -= 1 / dialog_fade;
        if (dialog_alpha < 0) dialog_alpha = 0;
    }

    // Проверяем очередь диалогов (если очередь активна и окно скрыто)
    if (queue_active && dialog_alpha <= 0) {
        if (ds_list_size(dialog_queue) > 0) {
            var next_key = dialog_queue[| 0];
            ds_list_delete(dialog_queue, 0);
            show_dialog(next_key);
        } else {
            // Очередь закончилась — чистим
            queue_active = false;
            ds_list_destroy(dialog_queue);
            dialog_queue = noone;
        }
    }
}