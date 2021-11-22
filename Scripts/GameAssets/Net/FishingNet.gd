extends Node2D

export(NodePath) var run_anim
export(NodePath) var player

onready var anim := $AnimationPlayer
onready var trigger := $NetTrigger

var passed := false

signal stop_movement

func _on_NetTrigger_body_shape_entered(body_id: int, body: Node, body_shape: int, local_shape: int) -> void:
	
	if $NetTrigger.global_position.x < get_node(player).global_position.x:
		if passed:
			anim.set_current_animation("Pre_Net")
			
			emit_signal("stop_movement")
			
			trigger.queue_free()
		else:
			passed = true



func _on_PLayer_start_running() -> void:
	anim.set_current_animation("Pos_Net")
	get_node(run_anim).play("End")

func destroy_net():
	queue_free()
