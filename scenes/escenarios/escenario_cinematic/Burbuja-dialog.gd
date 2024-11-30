extends Sprite2D

@export var texto:String = "":
	set(value):
		visible = true
		texto = value
		$Timer.start()

var index = 0

func _ready():
	$Label.add_theme_color_override("font_color", Color.BLACK)

func _on_timer_timeout():
	if index >= texto.length():
		$Timer2.start()
		$Timer.stop()
	else:
		$Label.text = $Label.text + texto[index]
		index += 1


func _on_timer_2_timeout():
	visible = false
