if (global.game_paused) exit;

if (!puzzle_done && instance_exists(obj_planet_controller)) {
    if (obj_planet_controller.puzzle_solved) {
        sprite_index = spr_lantern_on;
        puzzle_done = true;
    }
}