if (global.game_paused) exit;
if (can_exit) {
    if (distance_to_object(oPlayer) < 32 && keyboard_check_pressed(ord("E"))) {
        room_goto(Lobby);   // или нужная комната
    }
}