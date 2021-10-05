extends CanvasLayer

onready var animationPlayer = $AnimationPlayer

func transition_to(scene: PackedScene):
	animationPlayer.play("fade")
	yield(animationPlayer, "animation_finished")
	get_tree().change_scene_to(scene)
	animationPlayer.play_backwards("fade")
