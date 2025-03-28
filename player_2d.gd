
# получаем главный узел сцены
extends CharacterBody2D


# @onready - создаёт переменную только после прогрузки сцены
@onready var sprite :AnimatedSprite2D  = get_node("AnimatedSprite2D")
@onready var camera :Camera2D  = get_node("Camera2D")
@onready var text_coin = get_node("../CanvasLayer/Label")
# AudioStreamPlayer - воспроизводит звук
@onready var audio_coin :AudioStreamPlayer = $AudioStreamPlayer
@onready var label_hp :Label = $"../CanvasLayer/Label_HP"


var num_jump = 0
var num_coin = 0
var hp_num_player = 100
var hit_push = false



# метод _process - вызывается с каждым тактом процессора нужна для вычисления чего либо
func _process(delta: float) -> void:

	#if(position.y < 450):
		# гравитация
		#position.y += 10
		
	
	# отображаем количество hp
	label_hp.text = "hp " + str(hp_num_player)
		
	
	
	
# метод _physics_process - вызывается с каждым кадром нужна для расчета физики
func _physics_process(delta: float) -> void:
	#print("a1")
	#await get_tree().create_timer(6).timeout
	#print("b2")
	#print("с3")
	#print(delta)
	#print(2000*delta)
	
	
	# Input.is_action_pressed - обрабатывает зажатие клавиш
	#print(Input.is_action_pressedadad("key_right"))
	
	# Input.is_action_just_pressed - обрабатывает клик клавиш
	#print(Input.is_action_just_pressed("key_right"))
	#print(camera.rotation)
	
	# движение игрока влево или право 
	if(Input.is_action_pressed("key_right")):
		# движение через position
		#self.position.x += 400 * delta
		# движение через velocity
		self.velocity.x = 600
		# переворачиваем спрайт
		sprite.flip_h = false
		# вращаем камеру
		camera.rotation = 2 * delta
	elif(Input.is_action_pressed("key_left")):
		# движение через position
		#position.x -= 400 * delta
		# движение через velocity
		velocity.x = -600
		# переворачиваем спрайт
		sprite.flip_h = true
		# вращаем камеру
		camera.rotation = -2 * delta
	elif(not hit_push):
		velocity.x = 0
		# вращаем камеру
		camera.rotation = 0 * delta
		
	
	# анимируем движение игрока
	if(Input.is_action_pressed("key_right")and velocity.y == 0):
		sprite.play("run")
	elif(Input.is_action_pressed("key_left")and velocity.y == 0):
		sprite.play("run")
	elif(velocity.y == 0):
		sprite.play("idel")
	
	
	
	# прыжок игрока через position 
	#if(num_jump != 0):
		#position.y -= num_jump * delta
		#num_jump -= 10
		#sprite.play("jump")
	## запуск прыжок
	#if(Input.is_action_just_pressed("key_up") and is_on_floor()):
		#num_jump = 800
	
	
	
	# прыжок игрока через velocity
	if(Input.is_action_just_pressed("key_up") and is_on_floor()):
		velocity.y = -700
		
	if(velocity.y != 0):
		sprite.play("jump")
		
		
	
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
		# гравитация через position
		#position.y += 300 * delta
		# гравитация через velocity
		velocity.y += 1200 * delta
	
	
	
	
	#if(hit_push and is_on_floor()):
		#print("ik")
		#velocity.x += 100 * delta
		#hit_push = false
		
	
	

	# move_and_slide() - обязательная функция нужна для скольжения тел друг о друга
	move_and_slide()
