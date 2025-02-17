extends CharacterBody2D


# получаем игрока
@onready var player:CharacterBody2D = $"../player2D"
var near_player = false


func _process(delta: float) -> void:
	print(player)
	# меняем переменную игрока
	#player.text_coin.text = "x"
	
	# если игрок рябом двигаемся к нему
	if(player.position.x < self.position.x and near_player):
		self.velocity.x = - 300
	elif(player.position.x > position.x and near_player):
		velocity.x = 300
	else:
		velocity.x = 0
	
	
	
	
	if(not is_on_floor()):
		# гравитация через position
		#position.y += 300 * delta
		# гравитация через velocity
		velocity.y += 1200 * delta
		
	# move_and_slide() - обязательная функция нужна для скольжения тел друг о друга
	move_and_slide()





func _on_area_2d_body_entered(body: Node2D) -> void:
	# проверим рядом ли игорок
	if(body.name == "player2D"):
		near_player = true
