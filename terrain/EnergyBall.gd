class_name EnergyBall
extends RigidBody2D

const SPEED = 100
var startingPosition: Vector2
var shouldReset: bool = false


func _ready() -> void:
	startingPosition = position

func _physics_process(delta: float) -> void:
	if shouldReset:
		resetPosition()

func _on_area_entered(area: Area2D) -> void:
	var x_pos = self.global_position.x - area.global_position.x
	var direction = 1 if x_pos > 0 else -1
	set_linear_velocity(Vector2(direction * SPEED, 0))


func _on_rigid_body_entered(body: Node) -> void:
	if body is TileMap:
		shouldReset = true


func resetPosition():
	set_linear_velocity(Vector2(0, 0))
	shouldReset = false
	position = startingPosition
