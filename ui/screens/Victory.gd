extends Control

onready var sceneTransition = $"/root/SceneTransition"

func _on_Exit_pressed() -> void:
	var scene = load("res://Main Menu.tscn")
	sceneTransition.transition_to(scene)
