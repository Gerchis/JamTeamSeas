extends Node2D

export var wb_shader : ShaderMaterial
export(Array, NodePath) var sprite_list : Array

func _ready() -> void:
	grayscale_assets()

func grayscale_assets():
	for sprite_path in sprite_list:
		
		var sprite = get_node(sprite_path)
		
		if sprite.get_material() == wb_shader:
			sprite.material.set_shader_param("factor",0)

