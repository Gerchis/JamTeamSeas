extends Node2D

export var min_x := -1684.0
export var max_x := 2248.0
export var y_pos := -300
export(PackedScene) var plastic

func _on_Timer_timeout() -> void:	
	var new_plastic = plastic.instance()
	new_plastic.global_position = Vector2(rand_range(min_x, max_x), y_pos)
	add_child(new_plastic)

func init_timer():
	$Timer.start()
