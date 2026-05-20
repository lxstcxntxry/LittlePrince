if (dialog_showing || dialog_alpha > 0) {
    var xx = display_get_gui_width() - 400 - 24;
    var yy = display_get_gui_height() - 650 - 24;
    var w = 400;
    var h = 650;
    var margin = 30;

    draw_set_alpha(dialog_alpha);
    draw_set_color(c_black);
    draw_roundrect(xx, yy, xx + w, yy + h, false);

    // Применяем наш кириллический шрифт
    draw_set_font(FONT);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text_ext(xx + 30 + margin, yy + 30 + margin, dialog_text, -1, w - 2*margin);

    draw_set_alpha(1);
}