with (obj_dialog) {
    if (dialog_queue != noone) {
        ds_list_destroy(dialog_queue); // На всякий случай очищаем, если уже что-то было
    }
    dialog_queue = ds_list_create();
    ds_list_add(dialog_queue, "l1start");
    ds_list_add(dialog_queue, "l1start2");
    // Можно добавить сколько угодно ключей!
    queue_active = true;
}
