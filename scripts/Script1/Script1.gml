function rich_color_from_tag(_tag, _default_color) {
    _tag = string_lower(string_trim(_tag));

    switch (_tag) {
        case "/":
        case "white":
            return _default_color;

        case "yellow":
            return c_yellow;

        case "red":
            return c_red;

        case "green":
            return c_lime;

        case "blue":
            return c_aqua;

        case "orange":
            return c_orange;

        case "gray":
        case "grey":
            return c_gray;
    }

    return undefined;
}


function rich_next_word_width(_text, _pos) {
    var total_w = 0;
    var len = string_length(_text);
    var i = _pos;

    while (i <= len) {
        var ch = string_char_at(_text, i);

        if (ch == " " || ch == "\n") {
            break;
        }

        // Пропускаем цветовые теги при расчёте ширины
        if (ch == "[") {
            var rest = string_copy(_text, i, len - i + 1);
            var close_pos = string_pos("]", rest);

            if (close_pos > 0) {
                var tag = string_copy(rest, 2, close_pos - 2);
                var col = rich_color_from_tag(tag, c_white);

                if (!is_undefined(col)) {
                    i += close_pos;
                    continue;
                }
            }
        }

        total_w += string_width(ch);
        i++;
    }

    return total_w;
}


function draw_rich_text_ext(_x, _y, _text, _sep, _max_w, _default_color) {
    if (_sep < 0) {
        _sep = string_height("А") + 6;
    }

    var old_color = draw_get_color();

    var cx = _x;
    var cy = _y;

    var len = string_length(_text);
    var i = 1;

    var current_color = _default_color;
    var at_word_start = true;

    draw_set_color(current_color);

    while (i <= len) {
        var ch = string_char_at(_text, i);

        // Проверяем тег цвета: [yellow], [red], [/], и т.д.
        if (ch == "[") {
            var rest = string_copy(_text, i, len - i + 1);
            var close_pos = string_pos("]", rest);

            if (close_pos > 0) {
                var tag = string_copy(rest, 2, close_pos - 2);
                var new_color = rich_color_from_tag(tag, _default_color);

                if (!is_undefined(new_color)) {
                    current_color = new_color;
                    draw_set_color(current_color);

                    i += close_pos;
                    continue;
                }
            }
        }

        // Перенос строки
        if (ch == "\n") {
            cx = _x;
            cy += _sep;
            at_word_start = true;
            i++;
            continue;
        }

        // Пробел
        if (ch == " ") {
            var space_w = string_width(ch);

            if (cx + space_w > _x + _max_w) {
                cx = _x;
                cy += _sep;
            } else {
                draw_text(cx, cy, ch);
                cx += space_w;
            }

            at_word_start = true;
            i++;
            continue;
        }

        // Перенос по словам
        if (at_word_start) {
            var word_w = rich_next_word_width(_text, i);

            if (cx > _x && cx + word_w > _x + _max_w) {
                cx = _x;
                cy += _sep;
            }

            at_word_start = false;
        }

        draw_text(cx, cy, ch);
        cx += string_width(ch);

        i++;
    }

    draw_set_color(old_color);
}
