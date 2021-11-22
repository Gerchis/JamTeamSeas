extends ColorRect

export (String, FILE) var game_scene
export (String, FILE) var menu_scene

var finished := false

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "FadeOut":
		SceneManager.goto_scene(game_scene)
	elif anim_name == "EndFadeOut":
		finished = true
		$Sprite2.show()


func _on_DeadTrigger_body_entered(body: Node) -> void:
	$AnimationPlayer.set_current_animation("FadeOut")

func _input(event):
	if finished && event is InputEventKey && event.pressed:
		SceneManager.goto_scene(menu_scene)
