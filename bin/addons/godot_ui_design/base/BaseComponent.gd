extends PanelContainer
class_name BaseComponent
######################### 形状相关代码 #########################
var update_shape_flag = true

@export var shape_style: UIDesignConstants.ShapeStyle:
	set(val):
		shape_style = val
		if shape_style != UIDesignConstants.ShapeStyle.CUSTOM:
			margin_size = UIDesignConstants.margin_size_map[shape_style]
			update_all_margin_size()
		update_shape_flag = true
	get:
		return shape_style

@export var shape_symmetry: UIDesignConstants.ShapeSymmetry:
	set(val):
		shape_symmetry = val
		update_all_margin_size()
		update_shape_flag = true
	get:
		return shape_symmetry

@export var shape_family: UIDesignConstants.ShapeFamily:
	set(val):
		shape_family = val
		update_shape_flag = true
	get:
		return shape_family

@export var shape_token: UIDesignConstants.ShapeToken:
	set(val):
		shape_token = val
		var token = UIDesignConstants.token_map[shape_token]
		shape_style = token["style"]
		shape_symmetry = token["symmetry"]
		shape_family = token["family"]
		update_shape_flag = true
	get:
		return shape_token

@export var margin_size = 0:
	set(val):
		margin_size = val
		update_shape_flag = true
@export var top_left = 0:
	set(val):
		top_left = val
		update_shape_flag = true
@export var top_right = 0:
	set(val):
		top_right = val
		update_shape_flag = true
@export var bottom_right = 0:
	set(val):
		bottom_right = val
		update_shape_flag = true
@export var bottom_left = 0:
	set(val):
		bottom_left = val
		update_shape_flag = true

func update_all_margin_size():
	match shape_symmetry:
		UIDesignConstants.ShapeSymmetry.CUSTOM:
			pass
		UIDesignConstants.ShapeSymmetry.NONE:
			top_left = margin_size
			top_right = margin_size
			bottom_right = margin_size
			bottom_left = margin_size
		UIDesignConstants.ShapeSymmetry.TOP:
			top_left = margin_size
			top_right = margin_size
			bottom_right = 0
			bottom_left = 0
		UIDesignConstants.ShapeSymmetry.BOTTOM:
			top_left = 0
			top_right = 0
			bottom_right = margin_size
			bottom_left = margin_size
		UIDesignConstants.ShapeSymmetry.START:
			top_left = margin_size
			top_right = 0
			bottom_right = 0
			bottom_left = margin_size
		UIDesignConstants.ShapeSymmetry.END:
			top_left = 0
			top_right = margin_size
			bottom_right = margin_size
			bottom_left = 0

func update_shape():
	if update_shape_flag == false:
		return 

	if shape_token!= UIDesignConstants.ShapeToken.CUSTOM:
		var token = UIDesignConstants.token_map[shape_token]
		if token["style"]!= shape_style or token["symmetry"]!= shape_symmetry or token["family"]!= shape_family:
			shape_token = UIDesignConstants.ShapeToken.CUSTOM
	
	if shape_style != UIDesignConstants.ShapeStyle.CUSTOM:
		if margin_size != UIDesignConstants.margin_size_map[shape_style]:
			shape_style = UIDesignConstants.ShapeStyle.CUSTOM
	
	if shape_symmetry != UIDesignConstants.ShapeSymmetry.CUSTOM:
		match shape_symmetry:
			UIDesignConstants.ShapeSymmetry.NONE:
				if top_left != margin_size or top_right!= margin_size or\
					bottom_right != margin_size or bottom_left!= margin_size:
					shape_symmetry = UIDesignConstants.ShapeSymmetry.CUSTOM
			UIDesignConstants.ShapeSymmetry.TOP:
				if top_left != margin_size or top_right!= margin_size or\
					bottom_right != 0 or bottom_left!= 0:
					shape_symmetry = UIDesignConstants.ShapeSymmetry.CUSTOM
			UIDesignConstants.ShapeSymmetry.BOTTOM:
				if top_left != 0 or top_right!= 0 or\
					bottom_right != margin_size or bottom_left!= margin_size:
					shape_symmetry = UIDesignConstants.ShapeSymmetry.CUSTOM
			UIDesignConstants.ShapeSymmetry.START:
				if top_left != margin_size or top_right!= 0 or\
					bottom_right != 0 or bottom_left!= margin_size:
					shape_symmetry = UIDesignConstants.ShapeSymmetry.CUSTOM
			UIDesignConstants.ShapeSymmetry.END:
				if top_left != 0 or top_right!= margin_size or\
					bottom_right != margin_size or bottom_left!= 0:
					shape_symmetry = UIDesignConstants.ShapeSymmetry.CUSTOM

	
	var corner_detail = 0
	match shape_family:
		UIDesignConstants.ShapeFamily.ROUNDED:
			corner_detail = 8
		UIDesignConstants.ShapeFamily.CUT:
			corner_detail = 1
	
	var shape_style = %Container.get("theme_override_styles/panel")
	shape_style.corner_radius_top_left = top_left
	shape_style.corner_radius_top_right = top_right
	shape_style.corner_radius_bottom_right = bottom_right
	shape_style.corner_radius_bottom_left = bottom_left
	shape_style.corner_detail = corner_detail
	
	var state_layer_style = %StateLayer.get("theme_override_styles/panel")
	state_layer_style.corner_radius_top_left = top_left
	state_layer_style.corner_radius_top_right = top_right
	state_layer_style.corner_radius_bottom_right = bottom_right
	state_layer_style.corner_radius_bottom_left = bottom_left
	state_layer_style.corner_detail = corner_detail
	
	
	for node in [%UmbraShadow, %PenumbraShadow, %AmbientShadow]:
		var shadow_style = node.get("theme_override_styles/normal")
		shadow_style.corner_radius_top_left = top_left
		shadow_style.corner_radius_top_right = top_right
		shadow_style.corner_radius_bottom_right = bottom_right
		shadow_style.corner_radius_bottom_left = bottom_left
		shadow_style.corner_detail = corner_detail

	update_shape_flag = false

######################### 阴影相关代码 #########################

var update_shadow_flag = true

@export var show_shadow_flag = true:
	set(val):
		show_shadow_flag = val
		%ShadowNode.visible = show_shadow_flag

@export_range(0,5,1) var elevation_level=0:
	set(val):
		elevation_level = val
		update_shadow_flag = true
	get:
		return elevation_level

@export var shadow_color = Color.BLACK:
	set(val):
		shadow_color = val
		update_shadow_flag = true


var show_shadow_animation = true
var shadow_tween:Tween
@export var animation_time = 0.1
func update_shadow():
	if update_shadow_flag == false:
		return 
		
	if show_shadow_flag == false:
		update_shadow_flag = true
		return 
	
	var target_dp_height = UIDesignConstants.elevation_level_map_dp_height[elevation_level]
	
	
	if show_shadow_animation:
		if shadow_tween:
			shadow_tween.kill()
		shadow_tween = create_tween()
		shadow_tween.set_parallel(true)
		for i in range(len(shadow_node_array)):
			var node = shadow_node_array[i]
			shadow_tween.tween_property(node, "theme_override_styles/normal:shadow_offset", UIDesignConstants.shadow_offset_array[i][target_dp_height], animation_time)
			shadow_tween.tween_property(node, "theme_override_styles/normal:shadow_size", UIDesignConstants.shadow_size_array[i][target_dp_height], animation_time)
			var shadow_style = node.get("theme_override_styles/normal")
			shadow_style.shadow_color = shadow_color
			shadow_style.shadow_color.a = UIDesignConstants.opacity_array[i]
			#shadow_tween.tween_property(node, "theme_override_styles/normal:shadow_color:a", UIDesignConstants.opacity_array[i], animation_time)
		for i in range(len(shadow_margin_node_array)):
			var node = shadow_margin_node_array[i]
			shadow_tween.tween_property(node, "theme_override_constants/margin_left", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height], animation_time)
			shadow_tween.tween_property(node, "theme_override_constants/margin_top", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height], animation_time)
			shadow_tween.tween_property(node, "theme_override_constants/margin_right", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height], animation_time)
			shadow_tween.tween_property(node, "theme_override_constants/margin_bottom", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height], animation_time)
	else:
		for i in range(len(shadow_node_array)):
			var node = shadow_node_array[i]
			var shadow_style = node.get("theme_override_styles/normal")
			shadow_style.shadow_offset = UIDesignConstants.shadow_offset_array[i][target_dp_height]
			shadow_style.shadow_size = UIDesignConstants.shadow_size_array[i][target_dp_height]
			shadow_style.shadow_color = shadow_color
			shadow_style.shadow_color.a = UIDesignConstants.opacity_array[i]
		for i in range(len(shadow_margin_node_array)):
			var node = shadow_margin_node_array[i]
			node.set("theme_override_constants/margin_left", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height])
			node.set("theme_override_constants/margin_top", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height])
			node.set("theme_override_constants/margin_right", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height])
			node.set("theme_override_constants/margin_bottom", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height])
	
	update_shadow_flag = false

######################### 状态层相关代码 #########################
@export var state:UIDesignConstants.State:
	set(val):
		state = val
		update_state_layer_flag = true
		update_state_flag = true
		
var update_state_layer_flag = true

func update_state_layer():
	if update_state_layer_flag == false:
		return 
	
	var target_opacity = UIDesignConstants.state_map_opacity[state]
	%StateLayer.modulate.a = target_opacity
	if state == UIDesignConstants.State.ACTIVATED:
		# TODO: change container color to secondary container color 
		# TODO: change content color to on-secondary container color
		pass
	update_state_layer_flag = false


######################### 颜色相关代码 #########################
@export var scheme:MCUSchemeContent:
	get:
		if scheme==null:
			return Engine.get_singleton("MCU").get_default_scheme()
		return scheme
	set(val):
		scheme = val
		
var container_color:UIDesignConstants.Role:
	get:
		return container_color
	set(val):
		container_color = val
		update_color_flag = true

var state_layer_color:UIDesignConstants.Role:
	get:
		return state_layer_color
	set(val):
		state_layer_color = val
		update_color_flag = true

#var focus_indicator_color:UIDesignConstants.Role:
	#get:
		#return focus_indicator_color
	#set(val):
		#focus_indicator_color = val
		#update_color_flag = true

#var update_focus_flag = true
#var focus_indicator_thickness:int:
	#get:
		#return focus_indicator_thickness
	#set(val):
		#focus_indicator_thickness = val
		#update_focus_flag = true
#
#var focus_indicator_offset:int:
	#get:
		#return focus_indicator_offset
	#set(val):
		#focus_indicator_offset = val
		#update_focus_flag = true

func get_role_color(cur_role):
	var cur_color = scheme.call(UIDesignConstants.func_map[cur_role])
	return cur_color

## 颜色角色其实跟状态有关，不同状态可能使用不同的颜色角色。但是一个控件中可能包含多个子内容需要调整颜色
var state_map_data = {
	UIDesignConstants.State.ENABLED:{
		"ContainerShape":UIDesignConstants.ShapeToken.FULLY_ROUNDED,
		"ContainerHeight":40,
		"ContainerElevation":UIDesignConstants.ElevationLevel.LEVEL_1,
		"ContainerShadowColor":UIDesignConstants.Role.SHADOW,
		"ContainerColor":UIDesignConstants.Role.SURFACE_CONTAINER_LOW,
	},
	UIDesignConstants.State.DISABLED:{
		"ContainerElevation":UIDesignConstants.ElevationLevel.LEVEL_0,
		"ContainerColor":UIDesignConstants.Role.ON_SURFACE,
		"ContainerOpacity":UIDesignConstants.disabled_state_layer_opacity,
	},
	UIDesignConstants.State.HOVERED:{
		"ContainerElevation":UIDesignConstants.ElevationLevel.LEVEL_2,

		"StateLayerColor":UIDesignConstants.Role.PRIMARY,
		"StateLayerOpacity":UIDesignConstants.hover_state_layer_opacity,

	},
	UIDesignConstants.State.FOCUSED:{
		"FocusIndicatorColor":UIDesignConstants.Role.SECONDARY,
		"FocusIndicatorThickness":UIDesignConstants.focus_indicator_thickness,
		"FocusIndicatorOffset":UIDesignConstants.focus_indicator_outer_offset,
		
		"ContainerElevation":UIDesignConstants.ElevationLevel.LEVEL_1,

		"StateLayerColor":UIDesignConstants.Role.PRIMARY,
		"StateLayerOpacity":UIDesignConstants.focus_state_layer_opacity,
	},
	UIDesignConstants.State.ACTIVATED:{},
	UIDesignConstants.State.PRESSED:{
		"ContainerElevation":UIDesignConstants.ElevationLevel.LEVEL_1,

		"StateLayerColor":UIDesignConstants.Role.PRIMARY,
		"StateLayerOpacity":UIDesignConstants.pressed_state_layer_opacity,
	},
	UIDesignConstants.State.DRAGGED:{},
}

func get_state_data(data_name,cur_state=null):
	if cur_state == null:
		cur_state = state
		
	var cur_state_map_data = get_state_map_data()
	if cur_state_map_data[cur_state].has(data_name):
		return cur_state_map_data[cur_state][data_name]
	return cur_state_map_data[UIDesignConstants.State.ENABLED].get(data_name,null)

func get_state_map_data():
	return state_map_data

func init_state():
	var target_container_shape_state_data = get_state_data("ContainerShape")
	var target_container_height_state_data = get_state_data("ContainerHeight")
	var target_container_shadow_color_state_data = get_state_data("ContainerShadowColor")
	shape_token = target_container_shape_state_data
	size.y = target_container_height_state_data
	custom_minimum_size.y = target_container_height_state_data
	if target_container_shadow_color_state_data!=null:
		shadow_color = get_role_color(target_container_shadow_color_state_data)
	else:
		shadow_color = Color.BLACK
	
	var target_focus_indicator_color_state_data = get_state_data("FocusIndicatorColor",UIDesignConstants.State.FOCUSED)
	var target_focus_indicator_thickness_state_data = get_state_data("FocusIndicatorThickness",UIDesignConstants.State.FOCUSED)
	var target_focus_indicator_offset_state_data = get_state_data("FocusIndicatorOffset",UIDesignConstants.State.FOCUSED)
	#focus_indicator_color = target_focus_indicator_color_state_data
	
	var cur_focus_indicator_color_color = get_role_color(target_focus_indicator_color_state_data)
	var focus_indicator_style = %FocusIndicator.get("theme_override_styles/panel")
	focus_indicator_style.border_color = cur_focus_indicator_color_color
	
	var focus_indicator_thickness = target_focus_indicator_thickness_state_data
	var focus_indicator_offset = target_focus_indicator_offset_state_data
	focus_indicator_style.border_width_left = focus_indicator_thickness
	focus_indicator_style.border_width_top = focus_indicator_thickness
	focus_indicator_style.border_width_right = focus_indicator_thickness
	focus_indicator_style.border_width_bottom = focus_indicator_thickness

	focus_indicator_style.expand_margin_left = focus_indicator_offset
	focus_indicator_style.expand_margin_top = focus_indicator_offset
	focus_indicator_style.expand_margin_right = focus_indicator_offset
	focus_indicator_style.expand_margin_bottom = focus_indicator_offset


var update_state_flag = true
func update_state():
	if update_state_flag == false:
		return 
	
	var target_container_elevation_state_data = get_state_data("ContainerElevation")
	var target_container_color_state_data = get_state_data("ContainerColor")
	var target_container_opacity_state_data = get_state_data("ContainerOpacity")
	if target_container_color_state_data!=null:
		container_color = target_container_color_state_data
	
	if target_container_elevation_state_data!=null:
		elevation_level = target_container_elevation_state_data
	
	if target_container_opacity_state_data!=null:
		%Container.modulate.a = target_container_opacity_state_data
	else:
		%Container.modulate.a = 1
	
	
	var target_state_layer_color_state_data = get_state_data("StateLayerColor")
	if target_state_layer_color_state_data:
		state_layer_color = target_state_layer_color_state_data
	
	var target_state_layer_opacity_state_data = get_state_data("StateLayerOpacity")
	if target_state_layer_opacity_state_data!=null:
		%StateLayer.modulate.a = target_state_layer_opacity_state_data
	else:
		%StateLayer.modulate.a = 0
	

	if state == UIDesignConstants.State.FOCUSED:
		%FocusIndicator.visible = true
	else:
		%FocusIndicator.visible = false
		pass
	update_state_flag = false

var  update_color_flag = true
func update_color():
	if update_color_flag == false:
		return 
	
	var cur_color = get_role_color(container_color)
	var shape_style = %Container.get("theme_override_styles/panel")
	shape_style.bg_color = cur_color

	var cur_state_layer_color = get_role_color(state_layer_color)
	var state_layer_style = %StateLayer.get("theme_override_styles/panel")
	state_layer_style.bg_color = cur_state_layer_color

	update_color_flag = false

		
var shadow_node_array = []
var shadow_margin_node_array = []

func init_node():
	shadow_node_array = [%UmbraShadow, %PenumbraShadow, %AmbientShadow]
	shadow_margin_node_array = [%UmbraShadowMargin, %PenumbraShadowMargin, %AmbientShadowMargin]
	pass
	

func init_styles():
	var shape_style_1 = %Container.get("theme_override_styles/panel").duplicate(true)
	%Container.set("theme_override_styles/panel",shape_style_1)
	var shape_style_2 = %Container.get("theme_override_styles/panel").duplicate(true)
	%StateLayer.set("theme_override_styles/panel",shape_style_2)
	
	var focus_indicator_style = %FocusIndicator.get("theme_override_styles/panel").duplicate(true)
	%FocusIndicator.set("theme_override_styles/panel",focus_indicator_style)

	for node in [%UmbraShadow, %PenumbraShadow, %AmbientShadow]:
		var shadow_style = node.get("theme_override_styles/normal").duplicate(true)
		
		node.set("theme_override_styles/normal",shadow_style)

func _ready():
	init_node()
	init_styles()
	init_state()

func _process(delta):
	update_shape()
	update_shadow()
	update_state_layer()
	update_state()
	update_color()

func disable():
	state = UIDesignConstants.State.DISABLED

func enable():
	if state == UIDesignConstants.State.DISABLED:
		state = UIDesignConstants.State.ENABLED
		check_state()

func _on_pressed():
	pass

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				_on_pressed()
				check_state()

func _on_focus_entered():
	check_state()

func _on_focus_exited():
	check_state()

func _on_mouse_entered():
	check_state()

func _on_mouse_exited():
	check_state()


var is_activated = false:
	set(val):
		is_activated = val
		check_state()
	get:
		return is_activated
		
func check_state():
	if state == UIDesignConstants.State.DISABLED:
		return 
	if get_viewport().gui_is_dragging():
		if check_mouse_position():
			state = UIDesignConstants.State.DRAGGED
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if check_mouse_position():
			state = UIDesignConstants.State.PRESSED
	elif check_mouse_position():
		if is_activated:
			state = UIDesignConstants.State.ACTIVATED
		elif has_focus():
			state = UIDesignConstants.State.FOCUSED
		else:
			state = UIDesignConstants.State.HOVERED
	else:
		if state == UIDesignConstants.State.HOVERED:
			state = UIDesignConstants.State.ENABLED
	
func check_mouse_position():
	var cur_mouse_position = get_global_mouse_position()
	return get_global_rect().has_point(cur_mouse_position)
	
