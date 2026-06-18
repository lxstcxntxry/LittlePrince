if (!oKing.king_ready) exit;

// obj_UIBanner: Draw GUI
var txt = string(global.order_text);
var mx = x;
var my = y;

var tw = string_width(txt);
var th = string_height(txt);

var x1 = mx - (tw/2) - pad_x;
var y1 = my - pad_y;
var x2 = mx + (tw/2) + pad_x;
var y2 = my + th + pad_y;

// Фон
draw_set_alpha(0.9);
draw_set_color(bg_col);
draw_roundrect(x1, y1, x2, y2, false);
draw_set_alpha(1);

// Рамка
draw_set_color(border_col);
draw_roundrect(x1, y1, x2, y2, true);

// Текст с лёгкой тенью
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(shadow_col);
draw_text(mx+1, my+1, txt);
draw_set_color(txt_col);
draw_text(mx, my, txt);
