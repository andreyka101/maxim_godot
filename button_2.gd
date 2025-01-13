extends Button





# нажатие кнопки присоединил через узел
func _on_pressed() -> void:
	print("ok")

	# меняем координаты
	position.y = 200
	position.x = 775

	# меняем размер
	size.x = 200

	# крутим
	rotation = 150

	# меняем текст кнопки
	text = "hello"
	text = str(position.y)

	# два способа изменить цвет текста
	#add_theme_color_override("font_color" , "#A2231D")
	set("theme_override_colors/font_color" , "#A2231D")
	set("theme_override_colors/font_focus_color" , "#FFFF00")
	
	# меняем style
	var style_box = StyleBoxFlat.new()
	style_box.bg_color = "#00FA9A"
	set("theme_override_styles/normal" , style_box)
	
