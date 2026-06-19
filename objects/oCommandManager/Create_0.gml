// oCommandManager Create Event

command_names = [
    "Повернись [1]",
    "Подпрыгни [2]",
    "Поклонись [3]"
];

current_command = -1;
command_time = 0;
command_duration = 360; 
show_commands = false;
success_in_row = 0;
max_success = 5;
waiting_for_input = false;

// Для зелёной подсветки центрального окна
show_success = false;        // Показывать зелёную подсветку?
success_flash_timer = 0;     // Сколько кадров подсвечивать?
success_flash_duration = 30; // Длительность подсветки
