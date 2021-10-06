extends StaticBody2D

enum Mode { ALL, ANY, HALF }

export(Mode) var doorMode
export var nodePaths: Array

onready var animationPlayer = $AnimationPlayer

var energyNodes = []
var inputs = []

export var is_open = false


func _ready() -> void:
	if is_open:
		animationPlayer.play("open")
	
	for i in range(nodePaths.size()):
		var path = nodePaths[i]
		var node = get_node(path)
		if node is EnergyNode:
			energyNodes.append(node as EnergyNode)
			inputs.append(false)
			node.connect("energy_filled", self, "node_filled")


func node_filled(node: EnergyNode):
	var index = energyNodes.find(node)

	if index >= 0:
		inputs[index] = true

	check_status()


func check_status():
	var shouldOpen = should_door_open()

	if shouldOpen and not is_open:
		animationPlayer.play("open")
		is_open = true


func should_door_open() -> bool:
	match doorMode:
		Mode.ALL:
			for input in inputs:
				if not input:
					return false
			return true
		Mode.ANY:
			for input in inputs:
				if input:
					return true
		Mode.HALF:
			var half = inputs.size() / 2
			var sum = 0

			for input in inputs:
				if input:
					sum += 1

			return sum >= half
	return false
