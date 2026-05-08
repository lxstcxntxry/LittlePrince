// Если диалог показывается
if (dialog_showing) {
    // Плавное появление окна (если используешь альфу)
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
    // Если нужно — плавное исчезновение окна (опционально)
    if (dialog_alpha > 0) {
        dialog_alpha -= 1 / dialog_fade;
        if (dialog_alpha < 0) dialog_alpha = 0;
    }
}