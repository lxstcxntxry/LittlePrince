/// obj_OrderController: Create

// ---------------------------
// Конфигурация
// ---------------------------
enum eCommand {
    TURN = 0,   // Повернуться
    JUMP = 1,   // Подпрыгнуть
    BOW  = 2    // Поклониться
};

// Тайминги (в шагах; 60 = 1 сек при room_speed=60)
order_window_steps = 150;    // Время, чтобы повторить приказ (напр. 2.5 сек)
between_orders_steps = 30;   // Пауза между приказами
room_speed_target = room_speed; // Для читабельности

// Условия прохождения/провала
streak_to_win = 4;

// Клавиши (можете поменять под свой проект)
key_turn_left  = ord("1");
key_turn_right = ord("1");
key_jump_1     = ord("2");
key_jump_2     = ord("2");
key_bow_1      = ord("3");
key_bow_2      = ord("3");

// ---------------------------
// Служебные переменные
// ---------------------------
current_command = -1;
waiting_for_input = false;
time_left = 0;
streak = 0;
round_active = false;
game_over = false;
level_cleared = false;

// Текст баннера (его рисует obj_UIBanner)
global.order_text = "";

// Создание UI слотов (3 штуки слева)
var base_x = 32;
var base_y = 96;
var slot_w = 220;
var slot_h = 60;
var pad    = 12;

// 1) Повернуться
var s1 = instance_create_layer(base_x, base_y + 0*(slot_h+pad), "GUI", obj_UICommandSlot);
s1.slot_title = "Повернуться";
s1.slot_hint  = "1";
s1.slot_w = slot_w;
s1.slot_h = slot_h;

// 2) Подпрыгнуть
var s2 = instance_create_layer(base_x, base_y + 1*(slot_h+pad), "GUI", obj_UICommandSlot);
s2.slot_title = "Подпрыгнуть";
s2.slot_hint  = "2";
s2.slot_w = slot_w;
s2.slot_h = slot_h;

// 3) Поклониться
var s3 = instance_create_layer(base_x, base_y + 2*(slot_h+pad), "GUI", obj_UICommandSlot);
s3.slot_title = "Поклониться";
s3.slot_hint  = "3";
s3.slot_w = slot_w;
s3.slot_h = slot_h;

// Баннер с приказом
instance_create_layer(display_get_gui_width()/2, 32, "GUI", obj_UIBanner);

// Старт
alarm[0] = 1; // небольшой тик, затем начать первый приказ
