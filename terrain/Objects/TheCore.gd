extends Node2D

export var nodePaths: Array
onready var animationPlayer = $AnimationPlayer
onready var levelManager = $"/root/LevelManager"
onready var sceneTransition = $"/root/SceneTransition"
onready var musicPlayer = $"/root/MusicPlayer"

signal filled

var energyNodes = []
var inputs = []


func _ready() -> void:
	musicPlayer.play_song_with_name("Neuromancer")
	musicPlayer.set_looping(true)

	for i in range(nodePaths.size()):
		var path = nodePaths[i]
		var node = get_node(path)

		if node is EnergyNode:
			energyNodes.append(node as EnergyNode)
			inputs.append(false)
			node.connect("energy_filled", self, "node_filled")


func _exit_tree() -> void:
	musicPlayer.set_looping(false)


func node_filled(node: EnergyNode):
	var index = energyNodes.find(node)

	if index >= 0:
		inputs[index] = true

	if is_filled():
		animationPlayer.play("filled")
		emit_signal("filled")


func is_filled() -> bool:
	for input in inputs:
		if not input:
			return false
	return true


func end_level():
	sceneTransition.transition_to(levelManager.get_next_level())
