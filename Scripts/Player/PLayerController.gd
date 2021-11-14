extends KinematicBody2D

export var speed := 500.0
export var accel := 10.0
export var rotation_speed := 5.0

var actual_velocity := Vector2.ZERO
var actual_rotation := 0.0

func _physics_process(delta: float) -> void:
	var _movement_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"))
	
	
	
	if _movement_direction.dot(Vector2.RIGHT) < 0:
		
		$Graphics.flip_h = false
		
	elif !$Graphics.flip_h && _movement_direction.x != 0:
		$Graphics.flip_h = true
	
	var _target_rotation = _movement_direction.normalized().angle() if $Graphics.flip_h else (-_movement_direction).normalized().angle()
	
	var _target_velocity = _movement_direction.normalized() * speed
	
	actual_velocity = actual_velocity.linear_interpolate(_target_velocity, delta * accel)
	
	actual_velocity = move_and_slide(actual_velocity)
	
	if _movement_direction != Vector2.ZERO:
		rotation = lerp_angle(rotation, _target_rotation, delta * rotation_speed)
