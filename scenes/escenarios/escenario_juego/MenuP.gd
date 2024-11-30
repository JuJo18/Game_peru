extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Soundtrack.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_jugar_pressed():
	$Soundtrack.stop()
	get_tree().change_scene_to_file("res://scenes/escenarios/escenario_cinematic/scenario1.tscn")

func _on_salir_pressed():
	get_tree().quit()

