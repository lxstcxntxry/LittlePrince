/// Step Event - Объект диалогового окна
//if (keyboard_check_pressed(vk_space)) {
 //   obj_dialog.show_dialog("start_1");
//}

if (is_active) {
    // Анимация появления
    if (show_animation < 1) {
        show_animation += animation_speed;
        if (show_animation > 1) show_animation = 1;
    }
    
    // Постепенное появление текста (эффект печатания)
    if (current_char < string_length(current_text)) {
        current_char += text_speed;
        displayed_text = string_copy(current_text, 1, floor(current_char));
    }
    
    // Закрытие диалога (например, по клавише или автоматически)
    // Раскомментируйте нужный вариант:
    
    // Вариант 1: Закрытие по нажатию клавиши Enter/Space
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        if (current_char >= string_length(current_text)) {
            // Текст полностью показан - закрываем
            is_active = false;
            show_animation = 0;
        } else {
            // Текст ещё печатается - показываем весь сразу
            current_char = string_length(current_text);
            displayed_text = current_text;
        }
    }
    
    // Вариант 2: Автоматическое закрытие через 3 секунды
    // if (current_char >= string_length(current_text)) {
    //     alarm[0] = 180; // 3 секунды при 60 FPS
    // }
    
} else {
    // Скрываем окно
    if (show_animation > 0) {
        show_animation -= animation_speed * 2;
        if (show_animation < 0) show_animation = 0;
    }
}