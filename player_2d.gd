
# получаем главный узел сцены
extends CharacterBody2D




func _process(delta: float) -> void:
	# position - переменная координат
	if(position.y < 450):
		# гравитация
		position.y += 10
	
