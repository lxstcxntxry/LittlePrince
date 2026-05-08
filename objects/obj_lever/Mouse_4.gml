/// @description Переключение рычага
active = !active;
image_index = active ? 1 : 0;

// Звук механизма
//audio_play_sound(snd_lever_mechanism, 1, false);

// Сообщаем контроллеру
with (obj_planet_controller) {
	set_lever(other.lever_index, other.active);
}