class_name LevelManagerNode
extends Node

export(Array, PackedScene) var levels
export(PackedScene) var victory

var currentLevelIndex = 0

func get_current_level() -> PackedScene:
	return levels[currentLevelIndex] 

func get_next_level() -> PackedScene:
	currentLevelIndex += 1
	if currentLevelIndex < levels.size():
		return levels[currentLevelIndex] 
	else:
		return victory
