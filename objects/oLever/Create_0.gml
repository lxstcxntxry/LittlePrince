effect = -2;

key_pressed = false;
active = false;
sprite_off = spr_lever_off;  // спрайт выключенного рычага
sprite_on  = spr_lever_on;   // спрайт включенного рычага
player_nearby = false;
interaction_distance = 200;  // Расстояние до игрока

// Переменная для проверки, может ли игрок взаимодействовать
can_interact = false;

interaction_text = "[E] - вкл/выкл";