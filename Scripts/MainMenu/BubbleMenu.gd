extends AnimatedSprite

export var speed :float = 10
export var lifespan :float = 3
var actualTime :float = 0

func _process(delta: float) -> void:
	translate(Vector2(0, -speed * delta))
	
	actualTime += delta
	if actualTime > lifespan:
		queue_free()
