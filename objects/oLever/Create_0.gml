lever_index = 0;        // задать в редакторе: 0–3 (A, Б, В, Г)
active = false;         // выключен (опущен)
sprite_off = spr_lever_off;   // спрайт выключенного рычага
sprite_on  = spr_lever_on;    // спрайт включенного рычага

sprite_index = sprite_off;

toggle = function() {
    active = !active;
    sprite_index = active ? sprite_on : sprite_off;
    
    // Сохраняем нужные значения в локальные переменные ДО with
    var _index = lever_index;
    var _active = active;
    
    // Теперь вызываем метод контроллера, передавая локальные переменные
    with (obj_planet_controller) {
        update_lever(_index, _active);
    }
}