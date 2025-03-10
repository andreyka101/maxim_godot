extends Node2D


@onready var but = $Button
var bool_rot = false


func _process(delta: float) -> void:
	if(bool_rot):
		# self.rotation - вращаем узел по радианам
		# self.rotation_degrees - вращаем узел по градусам

		but.rotation_degrees += 4
		print(but.rotation_degrees)
		if(but.rotation_degrees >= 360):
			but.rotation_degrees -= 360
			
		




func _on_button_mouse_entered() -> void:
	print(1)
	bool_rot = true
	
	

func _on_button_mouse_exited() -> void:
	print(2)
	bool_rot = false


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1_2d.tscn")
