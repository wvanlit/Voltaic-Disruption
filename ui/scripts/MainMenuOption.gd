extends Label

signal pressed

onready var animation_player = $AnimationPlayer

func _on_focus_entered() -> void:
	animation_player.play("_active")

func _on_focus_exited() -> void:
	animation_player.play("_idle")

func _on_mouse_entered() -> void:
	self.grab_focus()

func _on_mouse_exited() -> void:
	pass # Replace with function body.


func _on_gui_input(event: InputEvent) -> void:
	if(event.is_action_pressed("ui_accept")):
		emit_signal("pressed")
	
