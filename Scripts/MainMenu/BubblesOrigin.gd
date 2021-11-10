extends Node2D

var scene := preload("res://Scenes/MainMenu/Bubbles.tscn")

export var bubbleTime :float = 1
var actualTime :float = 0

export var random_x_spawn :float = 0.2
var random = RandomNumberGenerator.new()

func _ready() -> void:
	random.randomize()

func _process(delta: float) -> void:
	actualTime += delta
	
	if actualTime > bubbleTime:
		var instance := scene.instance()
		add_child(instance)
		instance.random_spawn()
		actualTime = 0
