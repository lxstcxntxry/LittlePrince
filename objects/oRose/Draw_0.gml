// Принудительная отрисовка спрайта
draw_self();
draw_set_font(FONT);

// Параметры окна
var box_width = 360;
var box_height = 80;
var box_x1 = x - box_width / 2;
var box_y1 = y - 200 - 120; //ЕЩЁ -200 чтобы отодвинуться от якоря
var box_x2 = x + box_width / 2;
var box_y2 = y - 200 - 40;


// Если игрок рядом - показываем интерфейс
if (player_nearby) 
{
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
	
	if (first_touch) {
		draw_text(x, y - 200 - 95, interaction_text2);
	}
	else
	{
	    draw_text(x, y - 200 - 95, interaction_text);
    
	    // Полоска здоровья
	    var health_bar_width = 160;
	    var health_bar_height = 20;
	    var health_bar_x = x - health_bar_width / 2;
	    var health_bar_y = y - 200 - 70;
    
	    // Фон полоски
	    draw_set_color(c_dkgray);
	    draw_rectangle(health_bar_x, health_bar_y, 
	                   health_bar_x + health_bar_width, 
	                   health_bar_y + health_bar_height, false);
    
	    // Заполнение полоски (цвет зависит от здоровья)
	    var health_percent = current_health / max_health;
	    var fill_width = health_bar_width * health_percent;
    
	    if (health_percent > 0.66) {
	        draw_set_color(c_lime); // Зеленый - здоров
	    } else if (health_percent > 0.33) {
	        draw_set_color(c_yellow); // Желтый - поврежден
	    } else {
	        draw_set_color(c_red); // Красный - критическое состояние
	    }
    
	    draw_rectangle(health_bar_x, health_bar_y, 
	                   health_bar_x + fill_width, 
	                   health_bar_y + health_bar_height, false);
    
	    // Рамка полоски здоровья
	    draw_set_color(c_white);
	    draw_rectangle(health_bar_x, health_bar_y, 
	                   health_bar_x + health_bar_width, 
	                   health_bar_y + health_bar_height, true);
    
	    // Процент здоровья
	    draw_set_color(c_black);
	    draw_text(x, health_bar_y + health_bar_height / 2, 
	              string(floor(current_health)) + "/" + string(max_health));
    
    
	    // Сброс настроек рисования
	    draw_set_halign(fa_left);
	    draw_set_valign(fa_top);
	    draw_set_alpha(1);
	}
}