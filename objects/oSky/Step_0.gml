if (instance_exists(oLobbyController)) {
    var ctrl = instance_find(oLobbyController, 0);
    var t = clamp(ctrl.timer / ctrl.wait_duration, 0, 1);
    y = start_y + target_offset * t;
}
