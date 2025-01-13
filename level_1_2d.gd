
# получаем главный узел сцены
extends Node2D


# создание обычной переменной
var num = 1
# создание не изменяемой переменной
const num_con = 7


# метод _ready вызывается при полной загрузки сцены
#func _ready() -> void:
	#print("hello ready")



# метод _process вызывается при отрисовки каждого кадра 
#func _process(delta: float) -> void:
	#print("hello")



# нажатие кнопки присоединил через узел
func _on_button_button_down() -> void:
	# вывод переменной const
	print(num_con)
	#var num = 1
	print("click")
	num += 1
	print(num)
	
	# получаем другой узел
	var but : Button = get_node("Button")
	but.position.x = 500
	
	
	
