extends AnimatedSprite

export var speed :float = 10
export var lifespan :float = 3

var actualTime :float = 0

export var random_range :float = 10
var random := RandomNumberGenerator.new()

func _ready() -> void:
	random.randomize()

func _process(delta: float) -> void:
	translate(Vector2(0, -speed * delta))
	
	actualTime += delta
	if actualTime > lifespan:
		queue_free()
	
	modulate.a = 1 - (actualTime/lifespan)

func random_spawn():
	translate(Vector2(random.randf_range(-random_range,random_range),0))
