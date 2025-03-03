
# получаем главный узел сцены
extends Node2D



# HSlider - ползунок 
@onready var hs_lider:HSlider = $CanvasLayer/HSlider
# AudioServer - хранилище аудио шин
# AudioServer.get_bus_index(n) - получаем индекс шины по имени n
var bus_index = AudioServer.get_bus_index("Master")




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
	
	
	# linear_to_db - преобразовывает float в децибелы
	#print(linear_to_db(hs_lider.value))

	



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
	
	
	


func _on_h_slider_drag_ended(value_changed: bool) -> void:
	# получаем значение ползунка
	#print(hs_lider.value)

	# индекс шины
	#print(bus_index)
	


	# linear_to_db - преобразовывает float в децибелы
	print(linear_to_db(hs_lider.value))
	# AudioServer.set_bus_volume_db - меняем громкость шины по индексу
	AudioServer.set_bus_volume_db(bus_index , linear_to_db(hs_lider.value))
