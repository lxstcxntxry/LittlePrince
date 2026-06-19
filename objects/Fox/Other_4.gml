with (obj_dialog) {
    if (dialog_queue != noone) {
        ds_list_destroy(dialog_queue); // На всякий случай очищаем, если уже что-то было
    }
    dialog_queue = ds_list_create();
	ds_list_add(dialog_queue, "l4start");
    ds_list_add(dialog_queue, "l4start2");
	
    queue_active = true;
}