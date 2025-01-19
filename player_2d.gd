
# получаем главный узел сцены
extends CharacterBody2D


# @onready - создаёт переменную только после прогрузки узла
@onready var sprite :AnimatedSprite2D  = get_node("AnimatedSprite2D")


var num_jump = 0



# метод _process - вызывается с каждым тактом процессора нужна для вычисления чего либо
#func _process(delta: float) -> void:

	#if(position.y < 450):
		# гравитация
		#position.y += 10
		
	
	
	
# метод _physics_process - вызывается с каждым кадром нужна для расчета физики
func _physics_process(delta: float) -> void:
	
	# Input.is_action_pressed - обрабатывает зажатие клавиш
	#print(Input.is_action_pressedadad("key_right"))
	
	# Input.is_action_just_pressed - обрабатывает клик клавиш
	#print(Input.is_action_just_pressed("key_right"))
	
	
	# движение игрока влево или право 
	if(Input.is_action_pressed("key_right")):
		self.position.x += 400 * delta
		# переворачиваем спрайт
		sprite.flip_h = false
	elif(Input.is_action_pressed("key_left")):
		position.x -= 400 * delta
		# переворачиваем спрайт
		sprite.flip_h = true
	
	# анимируем движение игрока
	if(Input.is_action_pressed("key_right")and num_jump == 0):
		sprite.play("run")
	elif(Input.is_action_pressed("key_left")and num_jump == 0):
		sprite.play("run")
	elif(num_jump == 0):
		sprite.play("idel")
	
	
	
	# прыжок игрока
	if(num_jump != 0):
		position.y -= num_jump * delta
		num_jump -= 10
		sprite.play("jump")
	# запуск прыжок
	if(Input.is_action_just_pressed("key_up") and is_on_floor()):
		num_jump = 800
		
		
	
	# пример работы position и velocity
	if(Input.is_action_pressed("key_teleport_t")):
		# position - меняет координаты в следующий кадр
		# position.x = 75

		# velocity - постоянная скорость объекта
		velocity.x = 75

	
	
	# is_on_floor() - возвращает true если сцена касается земли
	#print(is_on_floor())
	#print(not is_on_floor())
	
	
	
#	# постоянная гравитация
	#velocity.y += 1000 * delta
	
	
#	# включаем гравитацию если игрок не стоит на земле
	if(not is_on_floor()):
		position.y += 300 * delta
	
	
	
	# move_and_slide() - обязательная функция нужна для скольжения тел друг о друга
	move_and_slide()
