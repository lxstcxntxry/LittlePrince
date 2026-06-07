if (!instance_exists(obj_king_controller)) exit;

var ctrl = obj_king_controller;
var xx = start_x;
var yy = start_y;

draw_set_font(FONT); // ваш шрифт
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

for (var i = 0; i < 4; i++) {
    var active = ctrl.button_active[i];
    var color = active ? c_white : c_gray;
    var bg = active ? c_navy : c_dkgray;
    
    // Фон кнопки
    draw_set_color(bg);
    draw_roundrect(xx, yy, xx + button_w, yy + button_h, false);
    
    // Текст
    draw_set_color(color);
    draw_text(xx + button_w/2, yy + button_h/2, ctrl.action_names[i] + " (" + string(i+1) + ")");
    
    // Рамка
    draw_set_color(c_white);
    draw_roundrect(xx, yy, xx + button_w, yy + button_h, true);
    
    xx += button_w + gap;
}