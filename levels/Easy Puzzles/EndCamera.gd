extends Camera2D

onready var animationPlayer = $AnimationPlayer


func _on_The_Core_filled() -> void:
	animationPlayer.play("end")
