// Рисуем спрайт растения
draw_self();
draw_set_font(FONT);

// Показываем подсказку при приближении
if (show_hint) {
// Параметры окна
    var box_width = 150;
    var box_height = 20;
    var box_x1 = x - box_width / 2;
    var box_y1 = y - 70;
    var box_x2 = x + box_width / 2;
    var box_y2 = y - 30;
    
    // Фон окна
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(box_x1, box_y1, box_x2, box_y2, false);
    
    // Рамка
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_rectangle(box_x1, box_y1, box_x2, box_y2, true);
    
    // Текст
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    
	draw_text(x, y - 52.5, interaction_text);
    
    // Сброс настроек
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
