if (!instance_exists(obj_planet_controller)) exit;

var cur = obj_planet_controller.current_speed;
var fill = (cur - min_speed) / (max_speed - min_speed) * gauge_w;

// Фон шкалы
draw_set_color(c_dkgray);
draw_roundrect(gauge_x, gauge_y, gauge_x + gauge_w, gauge_y + gauge_h, false);

// Заполнение (цвет зависит от близости к цели)
if (cur == target_speed) {
    draw_set_color(c_lime);          // идеально – зелёный
} else if (abs(cur - target_speed) <= 3) {
    draw_set_color(c_yellow);        // близко – жёлтый
} else {
    draw_set_color(c_red);           // далеко – красный
}
draw_roundrect(gauge_x, gauge_y, gauge_x + fill, gauge_y + gauge_h, false);

// Рамка
draw_set_color(c_white);
draw_roundrect(gauge_x, gauge_y, gauge_x + gauge_w, gauge_y + gauge_h, true);

// Метка цели (вертикальная линия)
var target_x = gauge_x + (target_speed - min_speed) / (max_speed - min_speed) * gauge_w;
draw_set_color(c_white);
draw_line(target_x, gauge_y - 6, target_x, gauge_y + gauge_h + 6);

// Подписи
draw_set_font(FONT);   // используйте ваш шрифт с кириллицей
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);
draw_text(gauge_x, gauge_y + gauge_h + 8, "Скорость вращения: " + string(cur));

draw_set_halign(fa_center);
draw_text(target_x, gauge_y - 24, "Цель: 2");

// Сообщение при достижении цели
if (cur == target_speed) {
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_text(gauge_x + gauge_w/2, gauge_y - 44, "ЦЕЛЬ ДОСТИГНУТА!");
}