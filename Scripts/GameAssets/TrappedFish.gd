extends Area2D

var isInteractable := false

export(PackedScene) var released_fish 
export(NodePath) var fish_parent

signal init_minigame(_speed, _key, _path)
signal stop_movement
signal start_movement

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if isInteractable && Input.is_action_just_pressed("interaction"):
		emit_signal("init_minigame",30, get_path(), 1)
		emit_signal("stop_movement")


func _on_TrappedFish_body_entered(body: Node) -> void:
	isInteractable = true


func _on_TrappedFish_body_exited(body: Node) -> void:
	isInteractable = false


func _on_BG_Slider_minigame_complete(_path) -> void:
	if _path == get_path():
		emit_signal("start_movement")
		get_node(fish_parent).add_child(released_fish.instance())
		queue_free()


func _on_BG_Slider_minigame_failed(_path) -> void:
	if _path == get_path():
		emit_signal("start_movement")
