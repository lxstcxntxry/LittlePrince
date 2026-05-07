// Проверка наведения мыши
is_hovered = point_in_rectangle(mouse_x, mouse_y, 
    x - button_width/2, y - button_height/2,
    x + button_width/2, y + button_height/2);

// Проверка клика
if (is_hovered && mouse_check_button_pressed(mb_left)) {
    if (target_room != -1) {
        room_goto(target_room);
    }
}