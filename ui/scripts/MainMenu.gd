extends Control


func _on_Start_pressed() -> void:
	get_tree().change_scene("res://levels/Level 1.tscn")


func _on_Options_pressed() -> void:
	pass # Replace with function body.


func _on_Exit_pressed() -> void:
	get_tree().quit()
