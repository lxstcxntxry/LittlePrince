if (global.game_paused) exit;
if (instance_exists(obj_planet_controller)) {
    angle += obj_planet_controller.rotation_speed;
}