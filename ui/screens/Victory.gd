extends Control
onready var sceneTransition = $"/root/SceneTransition"


func _on_Exit_pressed() -> void:
	sceneTransition.transition_to("res://Main Menu.tscn")
