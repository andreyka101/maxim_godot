extends Button






func _on_pressed() -> void:
	print("ok")
	position.y = 200
	position.x = 775
	size.x = 200
	rotation = 150
	text = "hello"
	text = str(position.y)
	#add_theme_color_override("font_color" , "#A2231D")
	
	set("theme_override_colors/font_color" , "#A2231D")
	set("theme_override_colors/font_focus_color" , "#FFFF00")
	
	
	var style_box = StyleBoxFlat.new()
	style_box.bg_color = "#00FA9A"
	set("theme_override_styles/normal" , style_box)
	
