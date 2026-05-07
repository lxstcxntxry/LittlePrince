if (dialog_showing) {
    if (dialog_timer > 0) {
        dialog_timer--;
        if (dialog_alpha < 1) dialog_alpha += 1/dialog_fade;
        if (dialog_alpha > 1) dialog_alpha = 1;
    } else {
        if (dialog_alpha > 0) dialog_alpha -= 1/dialog_fade;
        if (dialog_alpha <= 0) {
            dialog_showing = false;
            dialog_text = "";
            dialog_alpha = 0;
			global.game_paused = false;
        }
    }
}
