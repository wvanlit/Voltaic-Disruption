extends StaticBody2D

enum Mode { ANY, ALL, HALF }

export var node_paths: Array

onready var animationPlayer = $AnimationPlayer

var energyNodes = []
var inputs = []


func _ready() -> void:
	for i in range(node_paths.size()):
		var path = node_paths[i]
		var node = get_node(path)
		if node is EnergyNode:
			energyNodes.append(node as EnergyNode)
			inputs.append(false)
			node.connect("energy_filled", self, "node_filled")


func node_filled(node: EnergyNode):
	animationPlayer.play("open")
	pass
