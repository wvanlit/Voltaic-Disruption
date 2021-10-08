extends Panel

onready var levelManager = $"/root/LevelManager"
onready var sceneTransition = $"/root/SceneTransition"
onready var mainMenu = load("res://Main Menu.tscn")


func _on_Back_To_Menu_pressed() -> void:
	levelManager.hide_in_game_menu()
	sceneTransition.transition_to(mainMenu)


func _on_Resume_pressed() -> void:
	levelManager.hide_in_game_menu()
