extends Node2D

onready var anim := $AnimationPlayer

func _on_NetTrigger_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	anim.set_current_animation("Net")
