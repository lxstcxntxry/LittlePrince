// oFoxTameManager Create Event

action_names = [
    "Подойти [1]",
    "Протянуть руку [2]",
    "Ждать [3]"
];

// Правильная последовательность: 0, 1, 2
correct_sequence = [0, 1, 2];
current_step = 0; // на каком шаге сейчас игрок
fox_unhappy = false; // флаг "Лис недоволен"
show_actions = false; // Показывать ли окно с действиями?
waiting_for_input = false;

// Для подсветки успеха/неудачи
show_success = false;
show_fail = false;
flash_timer = 0;
flash_duration = 30;

final_step = false;
