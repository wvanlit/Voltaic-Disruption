extends Panel

onready var musicPlayer = $"/root/MusicPlayer"
onready var mainMenu = load("res://Main Menu.tscn")
onready var transition = $"/root/SceneTransition"
onready var slider = $VBoxContainer/HSlider


func _ready() -> void:
	slider.value = db2linear(musicPlayer.volume_db)


func _on_volume_slider_value_changed(value: float) -> void:
	musicPlayer.set_volume(value)


func _on_Back_pressed() -> void:
	transition.transition_to(mainMenu)
