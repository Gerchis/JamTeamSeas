extends Node2D

export var wb_shader : ShaderMaterial
export(Array, NodePath) var sprite_list : Array
export(Array, Texture) var new_sprites : Array
export(Array, NodePath) var hiddenFish : Array
export(Array, NodePath) var swimming_fish : Array


func grayscale_assets(_factor : float):
	for i in range(0, sprite_list.size()):
		
		var sprite = get_node(sprite_list[i])
		
		sprite.set_texture(new_sprites[i])
		
		if sprite.get_material() == wb_shader:
			sprite.material.set_shader_param("factor",_factor)
	
	for fish in hiddenFish:		
		get_node(fish).show()
	
	for fish in swimming_fish:
		get_node(fish).queue_free()


