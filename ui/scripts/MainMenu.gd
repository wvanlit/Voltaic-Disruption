extends Control

onready var levelManager = $"/root/LevelManager"
onready var sceneTransition = $"/root/SceneTransition"
onready var globalEnv = $"/root/GlobalWorldEnvironment"
onready var options = preload("res://ui/screens/Options Menu.tscn")


func _ready() -> void:
	globalEnv.set_mode(globalEnv.EnvMode.MENU)


func _on_Start_pressed() -> void:
	sceneTransition.transition_to(levelManager.get_current_level())


func _on_Options_pressed() -> void:
	sceneTransition.transition_to(options)


func _on_Exit_pressed() -> void:
	get_tree().quit()
