if (!instance_exists(oFoxTameManager)) exit;
var manager = instance_find(oFoxTameManager, 0);
if (!manager.show_actions) exit;

var gap = 60;
var x0 = 100;
var y0 = 300;

// Список действий
for (var i = 0; i < 3; i++) {
    draw_set_color(c_black);
    draw_roundrect(x0, y0 + gap * i, x0 + 200, y0 + 40 + gap * i, false);
    draw_set_color(c_white);
    draw_roundrect(x0, y0 + gap * i, x0 + 200, y0 + 40 + gap * i, true);
    draw_set_color(c_white);
    draw_text(x0 + 10, y0 + 10 + gap * i, manager.action_names[i]);
}

// В центре экрана — окошко прогресса
var ww = display_get_gui_width();
var wh = display_get_gui_height();
var rw = 300;
var rh = 60;
var rx = ww / 2 - 150;
var ry = wh * 0.1 - rh / 2;

// Цвет фона по статусу
if (manager.show_success) {
    draw_set_color(c_lime);
} else if (manager.show_fail) {
    draw_set_color(c_red);
} else {
    draw_set_color(c_black);
}
draw_roundrect(rx, ry, rx + rw, ry + rh, false);
draw_set_color(c_white);
draw_roundrect(rx, ry, rx + rw, ry + rh, true);

// Текст прогресса
draw_set_color(c_white);
var progress_text = "Шаг " + string(manager.current_step + 1) + " из 3";
draw_text(rx + 20, ry + 20, progress_text);

// Если лис недоволен — выводим сообщение
if (manager.fox_unhappy) {
    draw_set_color(c_red);
    draw_text(rx + 20, ry + 40, "Лис недоволен!");
}
