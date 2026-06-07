if (!instance_exists(obj_king_controller)) exit;
var ctrl = obj_king_controller;

// Если кнопки активны (order_loop, king_ordered, final_wait_turn, ...)
if (ctrl.state == "order_loop" || ctrl.state == "king_ordered" || ctrl.state == "final_wait_turn") {
    var btn_w = 180;
    var btn_h = 40;
    var start_x = 50;
    var start_y = display_get_gui_height() - 60;
    var gap = 20;
    var xx = start_x;
    var yy = start_y;

    draw_set_font(FONT);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);

    // Нежно-розовый цвет для активных кнопок
    var active_color = make_colour_rgb(255, 182, 193); // LightPink
    var inactive_bg = c_dkgray;
    var inactive_text = c_gray;
    var active_text = c_white;

    for (var i = 0; i < 4; i++) {
        var active = ctrl.button_active[i];
        // В состоянии final_wait_turn делаем активной только кнопку 3 ("Повернуться")
        if (ctrl.state == "final_wait_turn" && i != 2) {
            active = false; // кроме "Повернуться"
        }
        var bg = active ? active_color : inactive_bg;
        var col = active ? active_text : inactive_text;
        
        draw_set_color(bg);
        draw_roundrect(xx, yy, xx + btn_w, yy + btn_h, false);
        draw_set_color(col);
        draw_text(xx + btn_w/2, yy + btn_h/2, ctrl.action_names[i] + " (" + string(i+1) + ")");
        draw_set_color(c_white);
        draw_roundrect(xx, yy, xx + btn_w, yy + btn_h, true);
        
        xx += btn_w + gap;
    }
}