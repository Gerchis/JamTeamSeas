extends Node2D

onready var anim := $AnimationPlayer
onready var trigger := $NetTrigger

signal stop_movement

func _on_NetTrigger_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	anim.set_current_animation("Pre_Net")
	
	emit_signal("stop_movement")
	
	trigger.queue_free()


func _on_PLayer_start_running() -> void:
	anim.set_current_animation("Pos_Net")

func destroy_net():
	queue_free()
