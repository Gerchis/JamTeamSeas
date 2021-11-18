extends ColorRect

export (String, FILE) var game_scene

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	SceneManager.goto_scene(game_scene)


func _on_DeadTrigger_body_entered(body: Node) -> void:
	$AnimationPlayer.set_current_animation("FadeOut")
