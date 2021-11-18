extends Area2D

var isInteractable := false

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if isInteractable && Input.is_action_just_pressed("interaction"):
		queue_free()



func _on_TrappedFish_body_entered(body: Node) -> void:
	isInteractable = true


func _on_TrappedFish_body_exited(body: Node) -> void:
	isInteractable = false
