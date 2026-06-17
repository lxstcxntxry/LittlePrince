if (global.game_paused) exit;

if (instance_exists(oPlayer) and instance_exists(oPlanetVisual)) {
    var angle = oPlanetVisual.angle % 360; // Получаем угол планеты (0..360)
    
    // Здесь фонарь горит на первой половине оборота
    if (angle < 180) {
        lantern_on = true;  // Переменная, отвечающая за включение фонаря
		oLanternKeeper.touch();
		sprite_index = lantern_spr_off;
    } else {
        lantern_on = false;
	
		sprite_index = lantern_spr_on;
    }
}
