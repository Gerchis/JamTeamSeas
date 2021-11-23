extends Node2D

export (String, FILE) var menu_scene

func _on_Timer_timeout() -> void:
	SceneManager.goto_scene(menu_scene)
