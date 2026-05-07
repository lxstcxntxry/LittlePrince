// Выбор цвета в зависимости от наведения
var current_color = is_hovered ? button_hover_color : button_color;

// Рисуем кнопку
draw_set_color(current_color);
draw_rectangle(x - button_width/2, y - button_height/2,
               x + button_width/2, y + button_height/2, false);

// Рисуем границу
draw_set_color(c_white);
draw_rectangle(x - button_width/2, y - button_height/2,
               x + button_width/2, y + button_height/2, true);

// Рисуем текст
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x, y, button_text);