extends PanelContainer
class_name BaseDesignNode

# Enums
enum ShapeStyle { CUSTOM=0, NONE, EXTRA_SMALL, SMALL, MEDIUM, LARGE, EXTRA_LARGE, FULL }
enum ShapeSymmetry { CUSTOM=0, NONE, TOP, BOTTOM, START, END }
enum ShapeFamily { ROUNDED=0, CUT }
enum ShapeToken { CUSTOM=0, FULLY_ROUNDED, EXTRA_LARGE_TOP_ROUNDING, EXTRA_LARGE_ROUNDING, LARGE_TOP_ROUNDING, 
				  LARGE_END_ROUNDING, LARGE_START_ROUNDING, LARGE_ROUNDING, MEDIUM_ROUNDING, SMALL_ROUNDING,
				  EXTRA_SMALL_TOP_ROUNDING, EXTRA_SMALL_ROUNDING, NO_ROUNDING }

@export var scheme:MCUSchemeContent

@export_enum("Custom", "None", "Extra small", "Small", "Medium", "Large", "Extra large", "Full") 
var shape_style: int:
	set(val):
		shape_style = val
		update_shape_flag = true
	get:
		return shape_style

@export_enum("Custom", "None", "Top", "Bottom", "Start", "End") 
var shape_symmetry: int:
	set(val):
		shape_symmetry = val
		update_shape_flag = true
	get:
		return shape_symmetry

@export_enum("Rounded", "Cut") 
var shape_family: int:
	set(val):
		shape_family = val
		update_shape_flag = true
	get:
		return shape_family

@export_enum("Custom", "Fully rounded", "Extra large top rounding", "Extra large rounding", "Large top rounding", 
		"Large end rounding", "Large start rounding", "Large rounding", "Medium rounding", "Small rounding",
		"Extra small top rounding", "Extra small rounding", "No rounding") 
var shape_token: int:
	set(val):
		shape_token = val
		var token = token_map[shape_token]
		shape_style = token["style"]
		shape_symmetry = token["symmetry"]
		shape_family = token["family"]
	get:
		return shape_token

@export var margin_size = 0
@export var top_left = 0
@export var top_right = 0
@export var bottom_right = 0
@export var bottom_left = 0


const token_map = {
	ShapeToken.CUSTOM:{
		"style":ShapeStyle.CUSTOM,
		"symmetry":ShapeSymmetry.CUSTOM,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.FULLY_ROUNDED:{
		"style":ShapeStyle.FULL,
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.EXTRA_LARGE_TOP_ROUNDING:{
		"style":ShapeStyle.EXTRA_LARGE,#28
		"symmetry":ShapeSymmetry.TOP,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.EXTRA_LARGE_ROUNDING:{
		"style":ShapeStyle.EXTRA_LARGE,
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.LARGE_TOP_ROUNDING:{
		"style":ShapeStyle.LARGE,#16
		"symmetry":ShapeSymmetry.TOP,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.LARGE_END_ROUNDING:{
		"style":ShapeStyle.LARGE,
		"symmetry":ShapeSymmetry.END,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.LARGE_START_ROUNDING:{
		"style":ShapeStyle.LARGE,
		"symmetry":ShapeSymmetry.START,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.LARGE_ROUNDING:{
		"style":ShapeStyle.LARGE,
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.MEDIUM_ROUNDING:{
		"style":ShapeStyle.MEDIUM,#12
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.SMALL_ROUNDING:{
		"style":ShapeStyle.SMALL,#8
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.EXTRA_SMALL_TOP_ROUNDING:{
		"style":ShapeStyle.EXTRA_SMALL,#4
		"symmetry":ShapeSymmetry.TOP,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.EXTRA_SMALL_ROUNDING:{
		"style":ShapeStyle.EXTRA_SMALL,
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
	ShapeToken.NO_ROUNDING:{
		"style":ShapeStyle.NONE,#0
		"symmetry":ShapeSymmetry.NONE,
		"family":ShapeFamily.ROUNDED,
	},
}

var shadow_node_array
var shadow_margin_node_array
var shadow_node_normal_style_array

var update_shape_flag = false
func _process(delta):
	if update_shape_flag:
		update_shape()
		update_shape_flag = false

func update_shape():
	match shape_style:
		ShapeStyle.CUSTOM:
			pass
		ShapeStyle.NONE:
			margin_size = 0
		ShapeStyle.EXTRA_SMALL:
			margin_size = 4
		ShapeStyle.SMALL:
			margin_size = 8
		ShapeStyle.MEDIUM:
			margin_size = 12
		ShapeStyle.LARGE:
			margin_size = 16
		ShapeStyle.EXTRA_LARGE:
			margin_size = 28
		ShapeStyle.FULL:
			margin_size = 1024
	
	match shape_symmetry:
		ShapeSymmetry.CUSTOM:
			pass
		ShapeSymmetry.NONE:
			top_left = margin_size
			top_right = margin_size
			bottom_right = margin_size
			bottom_left = margin_size
		ShapeSymmetry.TOP:
			top_left = margin_size
			top_right = margin_size
			bottom_right = 0
			bottom_left = 0
		ShapeSymmetry.BOTTOM:
			top_left = 0
			top_right = 0
			bottom_right = margin_size
			bottom_left = margin_size
		ShapeSymmetry.START:
			top_left = margin_size
			top_right = 0
			bottom_right = 0
			bottom_left = margin_size
		ShapeSymmetry.END:
			top_left = 0
			top_right = margin_size
			bottom_right = margin_size
			bottom_left = 0
	
	match shape_family:
		ShapeFamily.ROUNDED:
			style_box.corner_detail = 8
		ShapeFamily.CUT:
			style_box.corner_detail = 1

	style_box.corner_radius_top_left = top_left
	style_box.corner_radius_top_right = top_right
	style_box.corner_radius_bottom_right = bottom_right
	style_box.corner_radius_bottom_left = bottom_left
	


	if shadow_node_array==null or shadow_margin_node_array == null:
		return 
	for i in range(3):
		var normal_style = shadow_node_normal_style_array[i]
		match shape_family:
			ShapeFamily.ROUNDED:
				normal_style.corner_detail = 8
			ShapeFamily.CUT:
				normal_style.corner_detail = 1
		
		normal_style.corner_radius_top_left = top_left
		normal_style.corner_radius_top_right = top_right
		normal_style.corner_radius_bottom_right = bottom_right
		normal_style.corner_radius_bottom_left = bottom_left
	
var style_box = null

func _ready():
	style_box = get("theme_override_styles/panel").duplicate(true)
	set("theme_override_styles/panel",style_box)
	update_shape_flag = true
	
	shadow_node_array = [%UmbraShadow, %PenumbraShadow, %AmbientShadow]
	shadow_margin_node_array = [%MarginContainer1, %MarginContainer2, %MarginContainer3]
	shadow_node_normal_style_array = []
	for i in range(3):
		var shadow_node = shadow_node_array[i]
		var cur_style = shadow_node.get("theme_override_styles/normal").duplicate(true)
		shadow_node_normal_style_array.append(cur_style)
		shadow_node.set("theme_override_styles/normal",cur_style)
	call_deferred("update_height_animation")
	call_deferred("test_func")


const elevation_level_map_dp_height={
	0:0,
	1:1,
	2:3,
	3:6,
	4:8,
	5:12,
}

const umbra_shadow_offset = {
	0:Vector2(0,0),
	1:Vector2(0,2),
	3:Vector2(0,3),
	6:Vector2(0,3),
	8:Vector2(0,5),
	12:Vector2(0,7),
}

const penumbra_shadow_offset = {
	0:Vector2(0,0),
	1:Vector2(0,1),
	3:Vector2(0,3),
	6:Vector2(0,6),
	8:Vector2(0,8),
	12:Vector2(0,12),
}

const ambient_shadow_offset = {
	0:Vector2(0,0),
	1:Vector2(0,1),
	3:Vector2(0,1),
	6:Vector2(0,1),
	8:Vector2(0,3),
	12:Vector2(0,5),
}

const shadow_offset_array = [umbra_shadow_offset, penumbra_shadow_offset, ambient_shadow_offset]

const umbra_shadow_size = {
	0:0,
	1:1,
	3:3,
	6:5,
	8:5,
	12:8,
}

const penumbra_shadow_size = {
	0:0,
	1:1,
	3:4,
	6:10,
	8:10,
	12:17,
}

const ambient_shadow_size = {
	0:0,
	1:3,
	3:8,
	6:18,
	8:14,
	12:22,
}

const shadow_size_array = [umbra_shadow_size, penumbra_shadow_size, ambient_shadow_size]

const umbra_shadow_expand_size = {
	0:0,
	1:-1,
	3:-2,
	6:-1,
	8:-3,
	12:-4,
}

const penumbra_shadow_expand_size = {
	0:0,
	1:0,
	3:0,
	6:0,
	8:1,
	12:2,
}

const ambient_shadow_expand_size = {
	0:0,
	1:0,
	3:0,
	6:0,
	8:2,
	12:4,
}

const shadow_expand_size_array = [umbra_shadow_expand_size, penumbra_shadow_expand_size, ambient_shadow_expand_size]

const umbra_opacity = 0.2
const penumbra_opacity = 0.14
const ambient_opacity = 0.12

const opacity_array = [umbra_opacity, penumbra_opacity, ambient_opacity]


var target_dp_height = 0
@export_range(0,5,1) var high_elevation_level = 0
@export_range(0,5,1) var low_elevation_level = 0

@export_range(0,5,1) var elevation_level = low_elevation_level:
	set(val):
		elevation_level = val
		var cur_target_dp_height = elevation_level_map_dp_height[elevation_level]
		if target_dp_height!= cur_target_dp_height:
			target_dp_height = cur_target_dp_height
			update_height_animation()
	get:
		return elevation_level

var tween
@export var animation_time = 0.1
func update_height_animation():
	if is_node_ready():
		if tween:
			tween.kill() # 终止之前的补间动画。
		tween = create_tween()
		tween.set_parallel(true)
		
		for i in range(3):
			var shadow_node = shadow_node_array[i]
			var shadow_margin_node = shadow_margin_node_array[i]

			tween.tween_property(shadow_node, "theme_override_styles/normal:shadow_offset", shadow_offset_array[i][target_dp_height], animation_time)
			tween.tween_property(shadow_node, "theme_override_styles/normal:shadow_size", shadow_size_array[i][target_dp_height], animation_time)
			tween.tween_property(shadow_node, "theme_override_styles/normal:shadow_color:a", opacity_array[i], 0)
			
			tween.tween_property(shadow_margin_node, "theme_override_constants/margin_left", -shadow_expand_size_array[i][target_dp_height], animation_time)
			tween.tween_property(shadow_margin_node, "theme_override_constants/margin_top", -shadow_expand_size_array[i][target_dp_height], animation_time)
			tween.tween_property(shadow_margin_node, "theme_override_constants/margin_right", -shadow_expand_size_array[i][target_dp_height], animation_time)
			tween.tween_property(shadow_margin_node, "theme_override_constants/margin_bottom", -shadow_expand_size_array[i][target_dp_height], animation_time)

	else:
		if shadow_node_array==null or shadow_margin_node_array == null:
			return 
		for i in range(3):
			var shadow_node = shadow_node_array[i]
			var shadow_margin_node = shadow_margin_node_array[i]
			shadow_node.set("theme_override_styles/normal:shadow_offset", shadow_offset_array[i][target_dp_height])
			shadow_node.set("theme_override_styles/normal:shadow_size", shadow_size_array[i][target_dp_height])
			shadow_node.set("theme_override_styles/normal:shadow_color", Color("BLACK",opacity_array[i]))
				
			shadow_margin_node.set("theme_override_constants/margin_left", -shadow_expand_size_array[i][target_dp_height])
			shadow_margin_node.set("theme_override_constants/margin_top", -shadow_expand_size_array[i][target_dp_height])
			shadow_margin_node.set("theme_override_constants/margin_right", -shadow_expand_size_array[i][target_dp_height])
			shadow_margin_node.set("theme_override_constants/margin_bottom", -shadow_expand_size_array[i][target_dp_height])


func _on_button_down():
	elevation_level = high_elevation_level
	z_index = 64


func _on_button_up():
	elevation_level = low_elevation_level
	z_index = 0


func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				_on_button_down()
			else:
				_on_button_up()
				
func test_func():
	printt("scheme.get_primary_palette_key_color()",scheme.get_primary_palette_key_color())
	printt("scheme.get_secondary_palette_key_color()",scheme.get_secondary_palette_key_color())
	printt("scheme.get_tertiary_palette_key_color()",scheme.get_tertiary_palette_key_color())
	printt("scheme.get_neutral_palette_key_color()",scheme.get_neutral_palette_key_color())
	printt("scheme.get_neutral_variant_palette_key_color()",scheme.get_neutral_variant_palette_key_color())
	printt("scheme.get_background()",scheme.get_background())
