extends Sprite

var speed := 0.0
var rounds := 0
var key := ""
var correct_key_pressed = false
var sender_path : NodePath

export var min_win_value := 0.0
export var max_win_value := 0.0
export var max_rounds := 0

signal minigame_phase (_rounds, _path)
signal minigame_complete (_path)

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	
	if is_visible_in_tree():
		$HSlider.value += speed * delta
		
		match key:
			"w":
				correct_key_pressed = Input.is_action_pressed("up")
			"s":
				correct_key_pressed = Input.is_action_pressed("down")
			"d":
				correct_key_pressed = Input.is_action_pressed("right")
			"a":
				correct_key_pressed = Input.is_action_pressed("left")
		
		if correct_key_pressed && $HSlider.value >= min_win_value && $HSlider.value <= max_win_value:
			if rounds >= max_rounds - 1:
				emit_signal("minigame_complete", sender_path)
				hide()
			else:
				emit_signal("minigame_phase",rounds, sender_path)
				rounds += 1
		
		if $HSlider.value >= 100:
			hide()



func _on_TrappedFish_init_minigame(_speed, _key, _path) -> void:
	if !is_visible_in_tree():
		$HSlider.value = 0.0
		rounds = 0
		speed = _speed
		key = _key
		sender_path = _path
		show()
