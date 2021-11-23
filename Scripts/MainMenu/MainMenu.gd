extends Control

export (String, FILE) var game_scene
export (Array, Texture) var audio_texture

func _on_Button_pressed() -> void:
	SceneManager.goto_scene(game_scene)

func mute_audio():
	if AudioServer.get_bus_volume_db(0) >= 0:
		AudioServer.set_bus_volume_db(0, -80)
		$MuteButton.texture = audio_texture[0]
	else:
		AudioServer.set_bus_volume_db(0,0)
		$MuteButton.texture = audio_texture[1]


func _on_Button2_button_down() -> void:
	mute_audio()
