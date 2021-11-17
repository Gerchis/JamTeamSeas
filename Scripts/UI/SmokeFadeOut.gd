extends ColorRect

onready var anim := $AnimationPlayer

func fade_in_fade_out():
	anim.play("FadeOut")
