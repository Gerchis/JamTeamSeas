extends Node2D

export var wb_shader : ShaderMaterial
export(Array, NodePath) var sprite_list : Array


func grayscale_assets(_factor : float):
	for sprite_path in sprite_list:
		
		var sprite = get_node(sprite_path)
		
		if sprite.get_material() == wb_shader:
			sprite.material.set_shader_param("factor",_factor)

