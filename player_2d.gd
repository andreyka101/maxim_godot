
# получаем главный узел сцены
extends CharacterBody2D


# @onready - создаёт переменную только после прогрузки узла
@onready var sprite = get_node("AnimatedSprite2D")





## метод _process - вызывается с каждым тактом процессора нужна для вычисления чего либо
#func _process(delta: float) -> void:

	## position - переменная координат
	#if(position.y < 450):
		## гравитация
		#position.y += 10
		
	
	
	
## метод _physics_process - вызывается с каждым кадром нужна для расчета физики
func _physics_process(delta: float) -> void:
	
	## Input.is_action_pressed - обрабатывает зажатие клавиш
	#print(Input.is_action_pressedadad("key_right"))
	
	## Input.is_action_just_pressed - обрабатывает клик клавиш
	#print(Input.is_action_just_pressed("key_right"))
	
	
	## движение игрока влево или право 
	if(Input.is_action_pressed("key_right")):
		self.position.x += 300 * delta
		
	if(Input.is_action_pressed("key_left")):
		position.x -= 300 * delta
		
	# прыжок игрока
	if(Input.is_action_pressed("key_up") and is_on_floor()):
		# position - меняет координаты в следующий кадр
		#position.y -= 10000 * delta
		
		# velocit - плавно переносит к координатам
		velocity.y -= 30000 * delta
		
	
	
	
	# is_on_floor() - возвращает true если сцена касается земли
	#print(is_on_floor())
	#print(not is_on_floor())
	
	
#	# постоянная гравитация
	#velocity.y += 1000 * delta
	
	
#	# включаем гравитацию если игрок не стоит на земле
	if(not is_on_floor()):
		velocity.y += 1000 * delta
	
	
	# move_and_slide() - обязательная функция нужна для скольжения тел друг о друга
	move_and_slide()
