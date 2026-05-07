if (dialog_showing || dialog_alpha > 0) {
    var xx = display_get_gui_width() - 400 - 24; // правый-нижний угол, регулируйте под себя
    var yy = display_get_gui_height() - 650 - 24;
    var w = 400;
    var h = 650;
    var margin = 16;

    draw_set_alpha(dialog_alpha);
    draw_set_color(c_black);
    draw_roundrect(xx, yy, xx + w, yy + h, false);
    draw_set_color(c_white);
    draw_text(xx + margin, yy + margin, dialog_text);
    draw_set_alpha(1);
}
