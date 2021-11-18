extends Node2D

export var wb_shader : ShaderMaterial
export(Array, NodePath) var sprite_list : Array
export(Array, Texture) var new_sprites : Array


func grayscale_assets(_factor : float):
	for sprite_path in sprite_list:
		
		var sprite = get_node(sprite_path)
		
		if sprite.get_material() == wb_shader:
			sprite.material.set_shader_param("factor",_factor)
	
	for i in range(0, sprite_list.size()):
		
		var sprite = get_node(sprite_list[i])
		
		sprite.set_texture(new_sprites[i])
		
		if sprite.get_material() == wb_shader:
			sprite.material.set_shader_param("factor",_factor)

