class_name LevelManagerNode
extends Node

export(Array, PackedScene) var levels
export(PackedScene) var victory

var currentLevelIndex = 0

onready var globalEnv = $"/root/GlobalWorldEnvironment"

var in_game_menu_scene = load("res://ui/screens/In-Game Menu.tscn")
var in_game_menu_instance = null


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		reset_level()
	if event.is_action_pressed("menu"):
		if in_game_menu_instance == null:
			show_in_game_menu()
		else:
			hide_in_game_menu()


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


func show_in_game_menu():
	globalEnv.set_mode(globalEnv.EnvMode.MENU)
	get_tree().paused = true
	in_game_menu_instance = in_game_menu_scene.instance()
	get_tree().get_root().add_child(in_game_menu_instance)


func hide_in_game_menu():
	globalEnv.set_mode(globalEnv.EnvMode.GAME)
	get_tree().paused = false
	in_game_menu_instance.queue_free()
	in_game_menu_instance = null
