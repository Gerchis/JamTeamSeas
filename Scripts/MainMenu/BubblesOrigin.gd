extends Node2D

var scene := preload("res://Scenes/MainMenu/Bubbles.tscn")

export var bubbleTime :float = 1
var actualTime :float = 0

func _process(delta: float) -> void:
	actualTime += delta
	
	if actualTime > bubbleTime:
		add_child(scene.instance())
		actualTime = 0
