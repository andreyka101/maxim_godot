extends Area2D




# сигнал срабатывает когда узел или сцена входит в coin_area2D
func _on_body_entered(body: Node2D) -> void:
	# body - узел или сцена
	print(body)
	# получаем имя
	print(body.name)
	if(body.name == "player2D"):
		#body.position.x = 378
		#body.position.y = 315
		
		#print(body.position)
		#body.position = Vector2(378, 315)
		
		# меняем переменную узлу или сцене
		body.num_coin += 1
		print(body.num_coin)

		# удаляем узел или сцена
		queue_free()
		#self.queue_free()
		#body.queue_free()
	
	
