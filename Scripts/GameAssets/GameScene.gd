extends Node2D

export var wb_shader : ShaderMaterial
export var player_wb_shader : ShaderMaterial
export(Array, NodePath) var sprite_list : Array
export(Array, Texture) var new_sprites : Array
export(Array, NodePath) var hiddenFish : Array
export(Array, NodePath) var swimming_fish : Array
export var added_color := 0.2
export var max_fish_trapped := 5

var fish_saved := 0

func _ready() -> void:
	if !SceneManager.mute:
		AudioServer.set_bus_volume_db(0, 0)

func grayscale_assets(_factor : float):
	for i in range(0, sprite_list.size()):
		
		var sprite = get_node(sprite_list[i])
		
		sprite.set_texture(new_sprites[i])
	
	wb_shader.set_shader_param("factor",_factor)
	
	for fish in hiddenFish:		
		get_node(fish).show()
	
	for fish in swimming_fish:
		get_node(fish).queue_free()
	
	$AsstesPlastic.show()

func add_color(_path):
	wb_shader.set_shader_param("factor", wb_shader.get_shader_param("factor") + added_color)
	player_wb_shader.set_shader_param("factor", player_wb_shader.get_shader_param("factor") - added_color)
	
	$PLayer.speed /= 1.15
	
	fish_saved += 1
	if fish_saved >= max_fish_trapped:
		$UI/FadeOut/AnimationPlayer.play("EndFadeOut")
