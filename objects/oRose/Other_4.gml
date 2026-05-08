with (obj_dialog) {
    dialog_queue = ds_list_create();
    ds_list_add(dialog_queue, "l1start");
    ds_list_add(dialog_queue, "l1start2");
    show_next_dialog = function() {
        if (ds_list_size(dialog_queue) > 0) {
            var next_key = dialog_queue[| 0];
            ds_list_delete(dialog_queue, 0);
            show_dialog(next_key);
        } else {
            ds_list_destroy(dialog_queue);
        }
    }
    show_next_dialog(); // Показываем первый диалог
}