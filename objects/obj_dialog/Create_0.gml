dialog_map = ds_map_create();
dialog_text = "";
dialog_timer = 0;
dialog_duration = 120; // сколько кадров показывается диалог (2 сек при 60fps)
dialog_alpha = 0;      // прозрачность для плавного появления и исчезания
dialog_fade = 10;      // скорость появления/исчезания
dialog_showing = false;

global.game_paused = false;

// Загрузка диалогов из файла dialogs.txt
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
            dialog_map[? key] = txt;
        }
    }
    file_text_close(file);
}

// Метод show_dialog для вызова извне
show_dialog = function(key) {
    if (ds_map_exists(dialog_map, key)) {
        dialog_text = dialog_map[? key];
        dialog_timer = dialog_duration;
        dialog_showing = true;
        dialog_alpha = 0;
		global.game_paused = true;
    }
};