extends KinematicBody2D

const TARGET_FPS = 60
const ACCELERATION = 8
const MAX_SPEED = 64
const FRICTION = 10
const AIR_RESISTANCE = 1
const GRAVITY = 4
const JUMP_FORCE = 140

var motion = Vector2.ZERO

export var inAnimation: bool = false setget setInAnimation

onready var sprite = $Sprite
onready var animationPlayer = $Sprite/AnimationPlayer
onready var attackBox = $Sprite/AttackBox/CollisionShape2D


func _physics_process(delta):
	if inAnimation:
		return

	process_movement(delta)
	process_actions()


func process_movement(delta):
	var x_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

	if x_input != 0:
		animationPlayer.play("run")
		motion.x += x_input * ACCELERATION * delta * TARGET_FPS
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)

		sprite.scale.x = 1 if x_input > 0 else -1
	else:
		animationPlayer.play("idle")

	motion.y += GRAVITY * delta * TARGET_FPS

	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION * delta)

		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMP_FORCE
	else:
		animationPlayer.play("jump")

		if Input.is_action_just_released("jump") and motion.y < -JUMP_FORCE / 2:
			motion.y = -JUMP_FORCE / 2

		if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)

	motion = move_and_slide(motion, Vector2.UP)


func process_actions():
	if Input.is_action_just_pressed("hit"):
		animationPlayer.play("hit")
		inAnimation = true


func setInAnimation(state: bool):
	inAnimation = state


func setAttackBoxEnabled(state: bool):
	attackBox.disabled = !state
