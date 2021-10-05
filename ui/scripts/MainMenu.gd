extends Control

onready var levelManager = $"/root/LevelManager"
onready var sceneTransition = $"/root/SceneTransition"

func _on_Start_pressed() -> void:
	sceneTransition.transition_to(levelManager.get_current_level())


func _on_Options_pressed() -> void:
	pass # Replace with function body.


func _on_Exit_pressed() -> void:
	get_tree().quit()
