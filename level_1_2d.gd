
# получаем главный узел сцены
extends Node2D


# создание переменной
var num = 1


# метод _ready вызывается при полной загрузки сцены
#func _ready() -> void:
	#print("hello ready")



# метод _process вызывается при отрисовки каждого кадра 
#func _process(delta: float) -> void:
	#print("hello")



# нажатие кнопки присоединил через узел
func _on_button_button_down() -> void:
	#var num = 1
	print("click")
	num += 1
	print(num)
	
	
