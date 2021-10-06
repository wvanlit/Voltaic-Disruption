class_name Spikes
extends Area2D

onready var levelManager = $"/root/LevelManager"

func _on_body_entered(body: Node) -> void:
	if body is Player:
		levelManager.reset_level()
