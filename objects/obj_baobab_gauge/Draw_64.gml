if (appearence) {
	var cur = oEnemySprout_zone.baobabs_cut;   // или твоя переменная
	if (cur > target) cur = target;
	var max_baobabs = target;       // можно global.baobabs_needed
	var fill = (cur / max_baobabs) * gauge_w;

	// Фон шкалы
	draw_set_color(c_dkgray);
	draw_roundrect(gauge_x, gauge_y, gauge_x + gauge_w, gauge_y + gauge_h, false);

	// Заполнение
	if (cur >= max_baobabs) {
	    draw_set_color(c_lime);        // выполнено – зелёный
	} else if (cur >= max_baobabs * 0.6) {
	    draw_set_color(c_yellow);      // больше половины – жёлтый
	} else {
	    draw_set_color(c_red);         // мало – красный
	}
	draw_roundrect(gauge_x, gauge_y, gauge_x + fill, gauge_y + gauge_h, false);

	// Рамка
	draw_set_color(c_white);
	draw_roundrect(gauge_x, gauge_y, gauge_x + gauge_w, gauge_y + gauge_h, true);

	// Подписи
	draw_set_font(FONT);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text(gauge_x, gauge_y + gauge_h + 8, "Срублено баобабов: " + string(cur) + " / " + string(target));

	// Если цель достигнута
	if (cur == target) {
	    draw_set_color(c_yellow);
	    draw_set_halign(fa_center);
	    draw_text(gauge_x + gauge_w/2, gauge_y - 24, "УРОВЕНЬ ПРОЙДЕН!");
	}
}