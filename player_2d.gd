
## получаем главный узел сцены
extends CharacterBody2D


#var sprite = get_node("AnimatedSprite2D")




## метод _process - вызывается с каждым тактом процессора нужна для вычисления чего либо
#func _process(delta: float) -> void:

	## position - переменная координат
	#if(position.y < 450):
		## гравитация
		#position.y += 10
		
	
	#if(not is_on_floor()):
	#print(not is_on_floor())
	#velocity.y += 100 * delta
	#move_and_slide()
		
	
	
	
## метод _physics_process - вызывается с каждым кадром нужна для расчета физики
func _physics_process(delta: float) -> void:
	
	## Input.is_action_pressed - обрабатывает зажатие клавиш
	#print(Input.is_action_pressedadad("key_right"))
	
	## Input.is_action_just_pressed - обрабатывает клик клавиш
	#print(Input.is_action_just_pressed("key_right"))
	
	
	## движение игрока влево или право 
	if(Input.is_action_pressed("key_right")):
		position.x += 10
	if(Input.is_action_pressed("key_left")):
		position.x -= 10
	
