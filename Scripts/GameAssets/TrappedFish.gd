extends Area2D

var isInteractable := false

export(PackedScene) var released_fish 
export(NodePath) var fish_parent
export(Array, Texture) var extra_key
export(NodePath) var player
export(NodePath) var slider

signal init_minigame(_speed, _key, _path)
signal stop_movement
signal start_movement

func _ready() -> void:
	connect("start_movement", get_node(player), "_on_TrappedFish_start_movement")
	connect("stop_movement", get_node(player), "_on_TrappedFish_stop_movement")
	connect("init_minigame", get_node(slider), "_on_TrappedFish_init_minigame")
	hide()

func _process(delta: float) -> void:
	if isInteractable && Input.is_action_just_pressed("interaction"):
		emit_signal("init_minigame",30, get_path(), 1)
		emit_signal("stop_movement")


func _on_TrappedFish_body_entered(body: Node) -> void:
	isInteractable = true
	$Graphics/Exclamation.texture = extra_key[1]


func _on_TrappedFish_body_exited(body: Node) -> void:
	isInteractable = false
	$Graphics/Exclamation.texture = extra_key[0]


func _on_BG_Slider_minigame_complete(_path) -> void:
	if _path == get_path():
		emit_signal("start_movement")
		var instance = released_fish.instance()
		get_node(fish_parent).add_child(instance)
		instance.position = position
		queue_free()


func _on_BG_Slider_minigame_failed(_path) -> void:
	if _path == get_path():
		emit_signal("start_movement")
