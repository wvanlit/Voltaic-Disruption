class_name EnergyBall
extends RigidBody2D

const SPEED = 100
var startingPosition: Vector2
var shouldReset: bool = false


func _ready() -> void:
	startingPosition = position


func _physics_process(_delta: float) -> void:
	if shouldReset:
		reset_position()


func _on_area_entered(area: Area2D) -> void:
	var x_pos = self.global_position.x - area.global_position.x
	var direction = 1 if x_pos > 0 else -1
	set_velocity(Vector2(direction, 0))
	


func _on_rigid_body_entered(body: Node) -> void:
	if body is TileMap:
		shouldReset = true
		return
	
	if body is PhysicsBody2D:
		var pBody : PhysicsBody2D = body as PhysicsBody2D
		if pBody.get_collision_layer_bit(3):
			shouldReset = true
			return


func should_reset():
	shouldReset = true


func reset_position():
	set_velocity(Vector2(0, 0))
	shouldReset = false
	position = startingPosition

func set_velocity(vector: Vector2):
	set_linear_velocity(vector * SPEED)
