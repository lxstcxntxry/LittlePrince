Keeper_spr_on = spr_keeper_1;
Keeper_spr_off = spr_keeper_2;

first_touch = true;
interaction_distance = 200;  // Расстояние до игрока
interaction_text = "Нажми [E] для того, что поговорить";
interaction_text2 = "Нажми [E] для того, что поговорить";
can_interact = false;
key_pressed = false;
player_nearby = false;       // Рядом ли игрок

sprite_index = spr_keeper_2;

touch = function()
{
sprite_index = Keeper_spr_off;
alarm[0] = 1;
}
