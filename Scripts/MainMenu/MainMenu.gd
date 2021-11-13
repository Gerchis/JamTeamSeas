extends Control

export (String, FILE) var game_scene

func _on_Button_pressed() -> void:
	SceneManager.goto_scene(game_scene)
