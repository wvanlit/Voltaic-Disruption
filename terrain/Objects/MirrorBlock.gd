extends RigidBody2D

enum Rotation{
	North
	East
	South
	West
}

export(Rotation) var currentRotation

onready var animationPlayer = $AnimationPlayer
onready var center : Position2D = $Center

func _ready() -> void:
	turn_to(currentRotation)

func _on_area_entered(area: Area2D) -> void:
	var groups = area.get_groups()
	
	if "EnergyBall" in groups:
		bounce_energy_ball(area)
	elif "Player" in groups:
		turn_90_degrees()

func rotation_to_str(rotation) -> String:
	return str(Rotation.keys()[rotation])

func bounce_energy_ball(area: Area2D):
	var ball = area.get_parent() as EnergyBall
	var bounce : Vector2 = get_ball_bounce_direction_vector(ball)
	
	if bounce.length() < 1:
		ball.should_reset()
	else:
		animationPlayer.play("glow")
		bounce_ball_with_velocity(ball, bounce)
	
	
	
func turn_90_degrees():
	match currentRotation:
		Rotation.North:
			currentRotation = Rotation.East
		Rotation.East:
			currentRotation = Rotation.South
		Rotation.South:
			currentRotation = Rotation.West
		Rotation.West:
			currentRotation = Rotation.North
	turn_to(currentRotation)
	
func turn_to(rotation):
	animationPlayer.play("turn" + rotation_to_str(rotation))
	
func bounce_ball_with_velocity(ball : EnergyBall, velocity: Vector2):
	ball.global_position = center.global_position
	ball.set_velocity(velocity)

func get_ball_direction(ball):
	var positionDifference : Vector2 = (ball.global_position - global_position).floor()
	
	if positionDifference.x >= 1:
		return Rotation.East
	elif positionDifference.x <= -1:
		return Rotation.West
	elif positionDifference.y >= 1:
		return Rotation.South
	else:
		return Rotation.North

func get_ball_bounce_direction_vector(ball) -> Vector2:
	var ballDirection = get_ball_direction(ball)
	
	match currentRotation:
		Rotation.North:
			if ballDirection == Rotation.West:
				return Vector2(0, -1)
			elif ballDirection == Rotation.North:
				return Vector2(-1, 0)
		Rotation.East:
			if ballDirection == Rotation.East:
				return Vector2(0, -1)
			elif ballDirection == Rotation.North:
				return Vector2(1, 0)
		Rotation.South:
			if ballDirection == Rotation.East:
				return Vector2(0, 1)
			elif ballDirection == Rotation.South:
				return Vector2(1, 0)
		Rotation.West:
			if ballDirection == Rotation.West:
				return Vector2(0, 1)
			elif ballDirection == Rotation.South:
				return Vector2(-1, 0)
	
	return Vector2(0, 0)
