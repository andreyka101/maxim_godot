extends CharacterBody2D


# получаем игрока
@onready var player:CharacterBody2D = $"../player2D"
@onready var sprite :AnimatedSprite2D  = get_node("AnimatedSprite2D")
var near_player = false
var dead_orc = false
var orc_attack = false



func _process(delta: float) -> void:
	
	
	#print(player)
	# меняем переменную игрока
	#player.text_coin.text = "x"
	
	# если игрок рябом двигаемся к нему
	if(player.position.x < self.position.x - 30 and near_player and not dead_orc and not orc_attack):
		self.velocity.x = - 300
		sprite.flip_h = true
	elif(player.position.x > position.x + 30 and near_player and not dead_orc and not orc_attack):
		velocity.x = 300
		sprite.flip_h = false
	elif(not dead_orc and not orc_attack):
		velocity.x = 0
		sprite.play("idel")
		
	if(velocity.x != 0 and not orc_attack):
		sprite.play("run")
	
	#print(velocity)
	
	
	
	
	if(not is_on_floor()):
		# гравитация через position
		#position.y += 300 * delta
		# гравитация через velocity
		velocity.y += 1200 * delta

	
	
	# is_on_ceiling() - возвращает true если сцена касается потолка
	#print(is_on_ceiling())
	# is_on_wall() - возвращает true если сцена касается стены
	#print(is_on_wall())
	# орк прыгает если касается стены
	if(is_on_wall()):
		velocity.y = - 600
	
	

	# уменьшаем скорость толчка игрока по оси x
	if(player.hit_push):
		if(player.position.x < self.position.x):
			player.velocity.x += 200 * delta
			if(player.velocity.x >= -150):
				player.hit_push = false
		elif(player.position.x > self.position.x):
			player.velocity.x -= 200 * delta
			if(player.velocity.x <= 150):
				player.hit_push = false
	
	
	
	# если hp игрока меньше или ровно нулю тогда меняем сцену
	if(player.hp_num_player <= 0):
		# get_tree() - дерево сцен
		#print(get_tree())
		
		# меняем сцену
		get_tree().change_scene_to_file("res://game_over.tscn")
		
	
		
	
		
	# move_and_slide() - обязательная функция нужна для скольжения тел друг о друга
	move_and_slide()



func _on_area_2d_body_entered(body: Node2D) -> void:
	# проверим рядом ли игорок
	if(body.name == "player2D"):
		near_player = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	# проверим рядом ли игорок
	if(body.name == "player2D"):
		near_player = false



func _on_area_atack_body_entered(body: Node2D) -> void:
	# если игрок зашёл в зону атаки тогда толкаем его
	if(body.name == "player2D"):
		sprite.play("attack")
		orc_attack = true
		await get_tree().create_timer(0.1).timeout
		player.hp_num_player -= 20
		player.hit_push = true
		player.velocity.y = -900
		if(player.position.x < self.position.x and near_player):
			player.velocity.x = - 500
		elif(player.position.x > position.x and near_player):
			player.velocity.x = 500
		await sprite.animation_finished
		orc_attack = false
		
		
		

# орк умирает если игрок его атакует 
func _on_area_2d_player_body_entered(body: Node2D) -> void:
	if(body.name == "player2D"):
		#print("a1")
		#await get_tree().create_timer(4).timeout
		#print("b2")
		#print("с3")
		
		
		
		dead_orc = true
		sprite.play("dead")
		await sprite.animation_finished
		queue_free()
		
