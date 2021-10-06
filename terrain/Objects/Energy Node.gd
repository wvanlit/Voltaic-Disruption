class_name EnergyNode
extends RigidBody2D

signal energy_filled

onready var animationPlayer = $AnimationPlayer

var filled = false

func _ready() -> void:
	animationPlayer.play("idle")


func _on_body_entered(body: Node) -> void:
	if body is EnergyBall and not filled:
		body.queue_free()
		emit_signal("energy_filled", self)
		animationPlayer.play("fill")
		filled = true
	elif filled:
		(body as EnergyBall).should_reset()
