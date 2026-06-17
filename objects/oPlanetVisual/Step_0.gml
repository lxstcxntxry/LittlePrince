if (global.game_paused) exit;
if (instance_exists(obj_planet_controller)) {
    angle += 0.5 * obj_planet_controller.rotation_speed;
}