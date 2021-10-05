extends Area2D

export(String, FILE) var nextScene

onready var levelManager = $"/root/LevelManager"
onready var sceneTransition = $"/root/SceneTransition"

func _on_Exit_body_entered(body: Node) -> void:
	if body is Player:
		sceneTransition.transition_to(levelManager.get_next_level())
