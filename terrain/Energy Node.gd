class_name EnergyNode
extends RigidBody2D

signal energy_filled

onready var animationPlayer = $AnimationPlayer


func _ready() -> void:
	animationPlayer.play("idle")


func _on_body_entered(body: Node) -> void:
	print("Hit")
	if body is EnergyBall:
		body.queue_free()
		emit_signal("energy_filled", self)
		animationPlayer.play("fill")
