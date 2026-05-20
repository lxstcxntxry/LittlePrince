dialog_map = ds_map_create();
dialog_text = "";

dialog_queue = noone;
queue_active = false;
dialog_alpha = 0;
dialog_fade = 10;
dialog_showing = false;

global.game_paused = false;

// Загрузка диалогов из файла dialogs.txt (ds_list для каждого ключа)
var file;
if (file_exists("dialogs.txt")) {
    file = file_text_open_read("dialogs.txt");
    while (!file_text_eof(file)) {
        var line = file_text_read_string(file);
        file_text_readln(file);
        var sep = string_pos("|", line);
        if (sep > 0) {
            var key = string_trim(string_copy(line, 1, sep - 1));
            var txt = string_trim(string_copy(line, sep + 1, string_length(line) - sep));
            if (!ds_map_exists(dialog_map, key)) {
                var new_list = ds_list_create();
                ds_map_add(dialog_map, key, new_list);
            }
            var dialog_list = dialog_map[? key];
            ds_list_add(dialog_list, txt);
        }
    }
    file_text_close(file);
}

// Метод show_dialog для вызова извне — все строки сразу
/*show_dialog = function(key) {
    if (ds_map_exists(dialog_map, key)) {
        var dialog_list = dialog_map[? key];
        dialog_text = "";
        for (var i = 0; i < ds_list_size(dialog_list); i++) {
            if (i > 0) dialog_text += "\n";
            dialog_text += dialog_list[| i];
        }
        dialog_showing = true;
        dialog_alpha = 0;
        global.game_paused = true;
        dialog_current_key = key;
    }
}*/

/// wrap_text_pixel(text, max_pixel_width)
function wrap_text_pixel(_text, _max_width) {
    var _words = string_split(_text, " ");
    var _result = "";
    var _line = "";

    for (var i = 0; i < array_length(_words); i++) {
        var _word = _words[i];
        var _test_line = _line;
        if (_test_line != "") _test_line += " ";
        _test_line += _word;
        if (string_width(_test_line) > _max_width) {
            if (_result != "") _result += "\n";
            _result += _line;
            _line = _word;
        } else {
            if (_line != "") _line += " ";
            _line += _word;
        }
    }
    if (_line != "") {
        if (_result != "") _result += "\n";
        _result += _line;
    }
    return _result;
}

show_dialog = function(key) {
    if (ds_map_exists(dialog_map, key)) {
        var dialog_list = dialog_map[? key];
        dialog_text = "";
		var max_width = 250; // ширина рамки в пикселях\
		
        for (var i = 0; i < ds_list_size(dialog_list); i++) {
			var line = wrap_text_pixel(dialog_list[| i], max_width);
            if (i > 0) dialog_text += "\n";
            dialog_text += line;
        }
		
		
        // === отладка ===
        show_debug_message("=== show_dialog called with key: " + key);
        show_debug_message("dialog_text: [" + dialog_text + "]");
        var size = ds_list_size(dialog_list);
        show_debug_message("dialog_list size: " + string(size));
        if (size > 0) {
        show_debug_message("First element: [" + string(dialog_list[| 0]) + "]");
        }
        // ===============
        dialog_showing = true;
        dialog_alpha = 0;
        global.game_paused = true;
        dialog_current_key = key;
    } else {
        show_debug_message("ERROR: key not found in map: " + key);
    }
};

