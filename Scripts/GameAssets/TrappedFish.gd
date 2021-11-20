extends Area2D

var isInteractable := false

export(PackedScene) var released_fish 

signal init_minigame(_speed, _key, _path)

func _ready() -> void:
	#hide()
	pass

func _process(delta: float) -> void:
	if isInteractable && Input.is_action_just_pressed("interaction"):
		emit_signal("init_minigame",30, get_path(), 1)




func _on_TrappedFish_body_entered(body: Node) -> void:
	isInteractable = true


func _on_TrappedFish_body_exited(body: Node) -> void:
	isInteractable = false
