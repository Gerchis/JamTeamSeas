extends HSlider

export var speed := 0.0

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	
	if is_visible_in_tree():
		value += speed * delta



func _on_TrappedFish_init_minigame(_speed, _key) -> void:
	value = 0.0
	show()
