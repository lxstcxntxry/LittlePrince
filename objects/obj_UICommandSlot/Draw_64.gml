/// obj_UICommandSlot: Draw GUI
var x1 = x;
var y1 = y;
var x2 = x + slot_w;
var y2 = y + slot_h;

// Подложка
draw_set_alpha(0.9);
draw_set_color(bg_col);
draw_roundrect(x1, y1, x2, y2, false);
draw_set_alpha(1);

// Рамка
draw_set_color(border_col);
draw_roundrect(x1, y1, x2, y2, true);

// Текст
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(title_col);
draw_text(x1 + 10, y1 + 8, slot_title);

draw_set_color(hint_col);
draw_text(x1 + 10, y1 + 8 + 22, slot_hint);
