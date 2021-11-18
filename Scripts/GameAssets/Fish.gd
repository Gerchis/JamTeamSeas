extends KinematicBody2D

var velocity := Vector2.ZERO
var actual_time := 0.0
export var turn_time := 0.0
export var speed := 0.0
export var init_turn := false

func _ready() -> void:
	if init_turn:
		$Fish.flip_h = true

func _process(delta: float) -> void:
	
	actual_time += delta
	
	if $Fish.flip_h:
		velocity.x = -speed
	else:
		velocity.x = speed
	
	if actual_time >= turn_time:
		actual_time = 0.0
		if $Fish.flip_h:
			$Fish.flip_h = false
		else:
			$Fish.flip_h = true
	
	velocity = move_and_slide(velocity)
