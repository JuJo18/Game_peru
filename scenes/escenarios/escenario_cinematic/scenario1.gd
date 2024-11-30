extends Node2D

func _ready():
	$AnimationPlayer.play("acto1")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "acto1":
		
		get_tree().change_scene_to_file("res://scenes/escenarios/escenario_juego/escenario-1.tscn")
