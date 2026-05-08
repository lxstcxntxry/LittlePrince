/// Create Event - Объект диалогового окна

// Загрузка диалогов из файла
dialog_map = ds_map_create();
dialog_file = "dialogs.txt";

if (file_exists(dialog_file)) {
    var file = file_text_open_read(dialog_file);
    
    while (!file_text_eof(file)) {
        var line = file_text_read_string(file);
        file_text_readln(file);
        
        if (string_length(line) > 0 && string_char_at(line, 1) != "#") {
            var separator_pos = string_pos("|", line);
            if (separator_pos > 0) {
                var dialog_id = string_copy(line, 1, separator_pos - 1);
                var dialog_text = string_delete(line, 1, separator_pos);
                
                ds_map_add(dialog_map, dialog_id, dialog_text);
            }
        }
    }
    
    file_text_close(file);
    show_debug_message("Диалоги загружены успешно!");
} else {
    show_debug_message("Файл диалогов не найден: " + dialog_file);
}

// Функция для показа диалога по ID
show_dialog = function(_dialog_id) {
    if (ds_map_exists(dialog_map, _dialog_id)) {
        current_text = dialog_map[? _dialog_id];
        displayed_text = "";
        current_char = 0;          // было char_index
        is_visible = true;
        is_active = true;          // <-- ВАЖНО: активируем диалог
        show_animation = 0;        // сбрасываем анимацию появления
        alpha = 0;
        timer = 0;
    } else {
        show_debug_message("Dialog ID not found: " + _dialog_id);
    }
}

// Параметры диалогового окна
dialog_width = 600;
dialog_height = 120;
dialog_x = (room_width - dialog_width) / 2;
dialog_y = room_height - dialog_height - 20;

// Текущий диалог
current_text = "";
displayed_text = "";
current_char = 0;
text_speed = 0.5;
is_active = false;

// Визуальные параметры
padding = 15;
border_color = c_white;
bg_color = c_black;
bg_alpha = 0.8;
text_color = c_white;

// Анимация появления
show_animation = 0;
animation_speed = 0.1;