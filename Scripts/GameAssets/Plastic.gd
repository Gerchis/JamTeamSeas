extends Sprite

export var speed := 40.0
export var min_y := 1000.0

func _ready() -> void:
	rotate(rand_range(0, 2*PI))
	frame = rand_range(0, 4)

func _process(delta: float) -> void:
	global_position.y += speed*delta
	if global_position.y >= min_y:
		queue_free()
