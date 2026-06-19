// oCommandBanner Draw GUI Event

if (!instance_exists(oCommandManager)) exit;
var manager = instance_find(oCommandManager, 0);
if (!manager.show_commands) exit;

var gap = 60;
var x0 = 100;
var y0 = 300;

// Слева — список всех команд, без выделения, черный фон, белая обводка
for (var i = 0; i < 3; i++) {
    draw_set_color(c_black);
    draw_roundrect(x0, y0 + gap * i, x0 + 200, y0 + 40 + gap * i, false); // внутренность черная
    draw_set_color(c_white);
    draw_roundrect(x0, y0 + gap * i, x0 + 200, y0 + 40 + gap * i, true);  // белая рамка
    draw_set_color(c_white);
    draw_text(x0 + 10, y0 + 10 + gap * i, manager.command_names[i]);
}

// В центре экрана — отдельное окошко с текущим приказом
if (manager.current_command != -1) {
    var ww = display_get_gui_width();
    var wh = display_get_gui_height();
    var rw = 260;
    var rh = 60;
    var rx = ww / 2 - 180;
    var ry = wh * 0.1 - rh / 2;

    // Зеленая подсветка если show_success==true, иначе черный фон
    if (manager.show_success) {
        draw_set_color(c_lime);
        draw_roundrect(rx, ry, rx + rw, ry + rh, false); // заливка зелёная
    } else {
        draw_set_color(c_black);
        draw_roundrect(rx, ry, rx + rw, ry + rh, false); // заливка чёрная
    }
    draw_set_color(c_white);
    draw_roundrect(rx, ry, rx + rw, ry + rh, true);      // белая рамка

    // Текст приказа
    draw_set_color(c_white);
    draw_text(rx + 20, ry + 20, "ПРИКАЗ: " + string(manager.command_names[manager.current_command]));

    // Стрик справа от окна
    var streak_text = "Правильно: " + string(manager.success_in_row);
    draw_set_color(c_white);
    draw_text(rx + rw + 20, ry + rh/2 - 8, streak_text);
}
