extends AudioStreamPlayer

var music = []
var is_looping = false


func _ready() -> void:
	randomize()

	music = get_files_in_directory("res://music/songs/")
	if music.size() == 0:
		playing = false
	else:
		play_song_with_name("Rise of the Machines")


func get_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and not file.ends_with(".import"):
			files.append(path + file)

	dir.list_dir_end()
	return files


func _on_AudioStreamPlayer_finished() -> void:
	if not is_looping:
		play_random_song()


func play_random_song():
	var song = music[randi() % music.size()]
	play_song(song)


func set_volume(value):
	volume_db = linear2db(value)
	playing = value == 0


func play_song_with_name(text: String):
	for song in music:
		if text in song:
			play_song(song)
			return

	printerr("Couldn't find song containing '%s'" % text)


func play_song(song):
	stream = load(song)
	playing = true


func set_looping(value):
	is_looping = value
