extends Control

export (String, FILE) var game_scene

func _on_Button_pressed() -> void:
	SceneManager.goto_scene(game_scene)

func mute_audio():
	if AudioServer.get_bus_volume_db(0) >= 0:
		AudioServer.set_bus_volume_db(0, -80)
	else:
		AudioServer.set_bus_volume_db(0,0)
