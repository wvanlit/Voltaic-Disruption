class_name LevelManagerNode
extends Node

export(Array, PackedScene) var levels
export(PackedScene) var victory

var currentLevelIndex = 0

onready var globalEnv = $"/root/GlobalWorldEnvironment"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		reset_level()

func get_current_level() -> PackedScene:
	globalEnv.set_mode(globalEnv.EnvMode.GAME)
	return levels[currentLevelIndex] 

func get_next_level() -> PackedScene:
	currentLevelIndex += 1
	if currentLevelIndex < levels.size():
		globalEnv.set_mode(globalEnv.EnvMode.GAME)
		return levels[currentLevelIndex] 
	else:
		globalEnv.set_mode(globalEnv.EnvMode.MENU)
		currentLevelIndex = 0
		return victory

func reset_level():
	# TODO - Add some animation
	get_tree().reload_current_scene()
