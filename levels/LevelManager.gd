class_name LevelManagerNode
extends Node

export(Array, PackedScene) var levels
export(PackedScene) var victory

var currentLevelIndex = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		reset_level()

func get_current_level() -> PackedScene:
	return levels[currentLevelIndex] 

func get_next_level() -> PackedScene:
	currentLevelIndex += 1
	if currentLevelIndex < levels.size():
		return levels[currentLevelIndex] 
	else:
		return victory

func reset_level():
	# TODO - Add some animation
	get_tree().reload_current_scene()
