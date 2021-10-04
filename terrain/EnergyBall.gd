class_name EnergyBall
extends RigidBody2D

onready var animationPlayer = $Sprite/AnimationPlayer
const SPEED = 100

func _ready() -> void:
	gravity_scale = 0

func _on_area_entered(area: Area2D) -> void:
	print('HIT')
	var x_pos = self.global_position.x - area.global_position.x
	var direction = 1 if x_pos > 0 else -1
	set_linear_velocity(Vector2(direction*SPEED, 0))
