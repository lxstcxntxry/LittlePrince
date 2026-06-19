// Рисуем спрайт растения
draw_self();
draw_set_font(FONT);

// Показываем подсказку при приближении
if (player_nearby) and ((first_touch) or (oFoxTameManager.final_step)) {
// Параметры окна
    var box_width = 340;
    var box_height = 20;
    var box_x1 = x + 50 - box_width / 2;
    var box_y1 = y - 70;
    var box_x2 = x + 50 + box_width / 2;
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
    if (first_touch) 
	{
		draw_text(x + 50, y - 52.5, interaction_text);
	}
    if (oFoxTameManager.final_step) 
	{
		draw_text(x + 50, y - 52.5, interaction_text2);
	}
    // Сброс настроек
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
