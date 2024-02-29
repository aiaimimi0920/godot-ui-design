extends Button
class_name BaseComponent2

func start_enable():
	state|=UIDesignConstants.State.ENABLED
	update_cur_state_data_flag = true

func finish_enable():
	state&=(~UIDesignConstants.State.ENABLED)
	update_cur_state_data_flag = true

func is_enabled():
	if state&UIDesignConstants.State.ENABLED==UIDesignConstants.State.ENABLED:
		return true
	return false

func start_hover():
	state|=UIDesignConstants.State.HOVERED
	update_cur_state_data_flag = true


func finish_hover():
	state&=(~UIDesignConstants.State.HOVERED)
	update_cur_state_data_flag = true


func is_hovered():
	if state&UIDesignConstants.State.HOVERED==UIDesignConstants.State.HOVERED:
		return true
	return false

func start_focus():
	state|=UIDesignConstants.State.FOCUSED
	update_cur_state_data_flag = true

func finish_focus():
	state&=(~UIDesignConstants.State.FOCUSED)
	update_cur_state_data_flag = true

func is_focused():
	if state&UIDesignConstants.State.FOCUSED==UIDesignConstants.State.FOCUSED:
		return true
	return false

func start_activate():
	state|=UIDesignConstants.State.ACTIVATED
	update_cur_state_data_flag = true

func finish_activate():
	state&=(~UIDesignConstants.State.ACTIVATED)
	update_cur_state_data_flag = true

func is_activated():
	if state&UIDesignConstants.State.ACTIVATED==UIDesignConstants.State.ACTIVATED:
		return true
	return false

func start_press():
	state|=UIDesignConstants.State.PRESSED
	update_cur_state_data_flag = true

func finish_press():
	state&=(~UIDesignConstants.State.PRESSED)
	update_cur_state_data_flag = true

func is_pressed():
	if state&UIDesignConstants.State.PRESSED == UIDesignConstants.State.PRESSED:
		return true
	return false

func start_drag():
	state|=UIDesignConstants.State.DRAGGED
	update_cur_state_data_flag = true

func finish_drag():
	state&=(~UIDesignConstants.State.DRAGGED)
	update_cur_state_data_flag = true

func is_dragged():
	if state&UIDesignConstants.State.DRAGGED==UIDesignConstants.State.DRAGGED:
		return true
	return false

func _on_pressed():
	var last_activated_node = Engine.get_singleton("MCU").get_meta("activated_node",null)
	if last_activated_node!=null:
		last_activated_node.finish_activate()
	
	start_activate()
	Engine.get_singleton("MCU").set_meta("activated_node",self)
	pass
	
@export_flags("Enabled", "Hovered", "Focused", "Activated", "Pressed", "Dragged" ) var state:int = UIDesignConstants.State.ENABLED:
	set(val):
		state = val
		_update_flag = true
		
@export var scheme:MCUSchemeContent:
	get:
		if scheme==null:
			return Engine.get_singleton("MCU").get_default_scheme()
		return scheme
	set(val):
		scheme = val
		
func get_role_color(cur_role):
	var cur_color = scheme.call(UIDesignConstants.func_map[cur_role])
	return cur_color

#func check_state():
	#if state == UIDesignConstants.State.DISABLED:
		#return 
	#if get_viewport().gui_is_dragging():
		#if check_mouse_position():
			#state = UIDesignConstants.State.DRAGGED
	#elif Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#if check_mouse_position():
			#state = UIDesignConstants.State.PRESSED
	#elif check_mouse_position():
		#if is_activated:
			#state = UIDesignConstants.State.ACTIVATED
		#elif has_focus():
			#state = UIDesignConstants.State.FOCUSED
		#else:
			#state = UIDesignConstants.State.HOVERED
	#else:
		#if state == UIDesignConstants.State.HOVERED:
			#state = UIDesignConstants.State.ENABLED
	
#func check_mouse_position():
	#var cur_mouse_position = get_global_mouse_position()
	#return get_global_rect().has_point(cur_mouse_position)

var cur_update_attr_data = {}
var update_cur_state_data_flag = true
func update_cur_state_data():
	if update_cur_state_data_flag==false:
		return 
	var update_attr_data = get_update_attr_data()
	cur_update_attr_data = {}
	var cur_enabled_data = update_attr_data.get(UIDesignConstants.State.ENABLED,null)
	if cur_enabled_data!=null:
		cur_update_attr_data.merge(cur_enabled_data,true)
	if is_enabled()==false:
		var cur_disabled_data = update_attr_data.get(UIDesignConstants.State.DISABLED,null)
		if cur_disabled_data!=null:
			cur_update_attr_data.merge(cur_disabled_data,true)
		update_cur_state_data_flag = false
		return 
	
	if is_hovered():
		var cur_hovered_data = update_attr_data.get(UIDesignConstants.State.HOVERED,null)
		if cur_hovered_data!=null:
			cur_update_attr_data.merge(cur_hovered_data,true)

	if is_focused():
		var cur_focused_data = update_attr_data.get(UIDesignConstants.State.FOCUSED,null)
		if cur_focused_data!=null:
			cur_update_attr_data.merge(cur_focused_data,true)

	if is_activated():
		var cur_activated_data = update_attr_data.get(UIDesignConstants.State.ACTIVATED,null)
		if cur_activated_data!=null:
			cur_update_attr_data.merge(cur_activated_data,true)

	if is_pressed():
		var cur_pressed_data = update_attr_data.get(UIDesignConstants.State.PRESSED,null)
		if cur_pressed_data!=null:
			cur_update_attr_data.merge(cur_pressed_data,true)

	if is_dragged():
		var cur_dragged_data = update_attr_data.get(UIDesignConstants.State.DRAGGED,null)
		if cur_dragged_data!=null:
			cur_update_attr_data.merge(cur_dragged_data,true)
		
	update_cur_state_data_flag = false

func _ready():
	trigger_init()
	trigger_update()
	trigger_dynamic()
	_init_all()
	
func _process(delta):
	update_cur_state_data()
	_init_all()
	_update_all()
	_dynamic_all()

func trigger_init():
	trigger_init_label()
	trigger_init_shape()
	trigger_init_icon()
	
func trigger_update():
	trigger_update_label()
	trigger_update_shape()
	trigger_update_icon()

func trigger_dynamic():
	trigger_dynamic_label()
	trigger_dynamic_shape()
	trigger_dynamic_icon()
	pass


func _init_all():
	if _init_flag == false:
		return 
		
	_init_label()
	_init_shape()
	_init_icon()
	
	_init_flag = false
	
func _update_all():
	if _update_flag == false:
		return 
		
	_update_label()
	_update_shape()
	_update_icon()
	
	_update_flag = false

func _dynamic_all():
	if _dynamic_flag == false:
		return 
		
	_dynamic_label()
	_dynamic_shape()
	_dynamic_icon()

	_dynamic_flag = false

var _init_flag = true
var _update_flag = true
var _dynamic_flag = true

################################### Label begin ####################################
var _trigger_init_label_list = {}
## cur_data 存储的格式为LABEL_TOKEN：对应具体的key，可以0：0，这样会去用0去搜索具体的使用属性
func _trigger_init_label(cur_node, cur_data):
	_trigger_init_label_list[cur_node] = cur_data

func trigger_init_label():
	pass

func _init_label():
	for cur_node in _trigger_init_label_list:
		var data = _trigger_init_label_list[cur_node]
		if UIDesignConstants.Attr.LABEL_TOKEN in data:
			var token_key = _get_init_attr(data[UIDesignConstants.Attr.LABEL_TOKEN])
			if token_key!=null:
				var token = UIDesignConstants.label_token_map[token_key]
				if token!=null:
					cur_node.set("theme_override_fonts/font",token)
					cur_node.set("theme_override_font_sizes/font_size",token.font_size)
					cur_node.set("theme_override_constants/line_spacing",token.font_height-token.font_size)
				## TODO: weight, weight_prominent,tracking

		if UIDesignConstants.Attr.LABEL_FONT_SIZE in data:
			var font_size = _get_init_attr(data[UIDesignConstants.Attr.LABEL_FONT_SIZE])
			if font_size!=null:
				cur_node.set("theme_override_font_sizes/font_size",font_size)
				
		if UIDesignConstants.Attr.LABEL_FONT_HEIGHT in data:
			var font_height = _get_init_attr(data[UIDesignConstants.Attr.LABEL_FONT_HEIGHT])
			if font_height!=null:
				cur_node.set("theme_override_constants/line_spacing",font_height - cur_node.get("theme_override_font_sizes/font_size"))


var _trigger_update_label_list = {}
## cur_data 存储的格式为LABEL_TOKEN：对应具体的key，可以0：0，这样会去用0去搜索具体的使用属性
func _trigger_update_label(cur_node, cur_data):
	_trigger_update_label_list[cur_node] = cur_data

func trigger_update_label():
	pass

func _update_label():
	for cur_node in _trigger_update_label_list:
		var data = _trigger_update_label_list[cur_node]
		if UIDesignConstants.Attr.LABEL_COLOR in data:
			var color_role = _get_update_attr(data[UIDesignConstants.Attr.LABEL_COLOR])
			if color_role!=null:
				cur_node.set("theme_override_colors/font_color", get_role_color(color_role))
			
		if UIDesignConstants.Attr.LABEL_OPACITY in data:
			var label_opacity = _get_update_attr(data[UIDesignConstants.Attr.LABEL_OPACITY])
			if label_opacity!=null:
				var cur_color = cur_node.get("theme_override_colors/font_color")
				cur_color.a = label_opacity
				cur_node.set("theme_override_colors/font_color", cur_color)


var _trigger_dynamic_label_list = {}
## cur_data 为节点属性：dynamic key的结构
func _trigger_dynamic_label(cur_node, cur_data):
	_trigger_dynamic_label_list[cur_node] = cur_data

func trigger_dynamic_label():
	pass

func _dynamic_label():
	for cur_node in _trigger_dynamic_label_list:
		var data = _trigger_dynamic_label_list[cur_node]
		for key in data:
			var value = get_dynamic_data(data[key])
			if value!=null:
				cur_node.set(key, value)
				if key=="text":
					if value=="":
						cur_node.visible = false
					else:
						cur_node.visible = true

################################### Label end ####################################


################################### Shape begin ####################################
var _trigger_init_shape_list = {}
## cur_data 存储的格式为LABEL_TOKEN：对应具体的key，可以0：0，这样会去用0去搜索具体的使用属性
func _trigger_init_shape(cur_node, cur_data):
	_trigger_init_shape_list[cur_node] = cur_data

func trigger_init_shape():
	pass

func _init_shape():
	for cur_node in _trigger_init_shape_list:
		var data = _trigger_init_shape_list[cur_node]
		
		var cur_shape_style = null
		var cur_shape_symmetry = null
		var cur_shape_family = null
		
		if UIDesignConstants.Attr.SHAPE_TOKEN in data:
			var token_key = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_TOKEN])
			if token_key!=null:
				var token = UIDesignConstants.token_map[token_key]
				cur_shape_style = token["style"]
				cur_shape_symmetry = token["symmetry"]
				cur_shape_family = token["family"]

		if UIDesignConstants.Attr.SHAPE_STYLE in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_STYLE])
			if cur_data!=null:
				cur_shape_style = cur_data

		if UIDesignConstants.Attr.SHAPE_SYMMETRY in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_SYMMETRY])
			if cur_data!=null:
				cur_shape_symmetry = cur_data

		if UIDesignConstants.Attr.SHAPE_FAMILY in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_FAMILY])
			if cur_data!=null:
				cur_shape_family = cur_data
		
		var cur_margin_size = 0
		if cur_shape_style!=null:
			cur_margin_size = UIDesignConstants.margin_size_map[cur_shape_style]
		
		if UIDesignConstants.Attr.SHAPE_MARGIN_SIZE in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_MARGIN_SIZE])
			if cur_data!=null:
				cur_margin_size = cur_data
		
		var cur_top_left = 0
		var cur_top_right = 0
		var cur_bottom_right = 0
		var cur_bottom_left = 0
		match cur_shape_symmetry:
			UIDesignConstants.ShapeSymmetry.CUSTOM:
				pass
			UIDesignConstants.ShapeSymmetry.NONE:
				cur_top_left = cur_margin_size
				cur_top_right = cur_margin_size
				cur_bottom_right = cur_margin_size
				cur_bottom_left = cur_margin_size
			UIDesignConstants.ShapeSymmetry.TOP:
				cur_top_left = cur_margin_size
				cur_top_right = cur_margin_size
				cur_bottom_right = 0
				cur_bottom_left = 0
			UIDesignConstants.ShapeSymmetry.BOTTOM:
				cur_top_left = 0
				cur_top_right = 0
				cur_bottom_right = cur_margin_size
				cur_bottom_left = cur_margin_size
			UIDesignConstants.ShapeSymmetry.START:
				cur_top_left = cur_margin_size
				cur_top_right = 0
				cur_bottom_right = 0
				cur_bottom_left = cur_margin_size
			UIDesignConstants.ShapeSymmetry.END:
				cur_top_left = 0
				cur_top_right = cur_margin_size
				cur_bottom_right = cur_margin_size
				cur_bottom_left = 0

		if UIDesignConstants.Attr.SHAPE_TOP_LEFT in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_TOP_LEFT])
			if cur_data!=null:
				cur_top_left = cur_data
				
		if UIDesignConstants.Attr.SHAPE_TOP_RIGHT in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_TOP_RIGHT])
			if cur_data!=null:
				cur_top_right = cur_data

		if UIDesignConstants.Attr.SHAPE_BOTTOM_RIGHT in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_BOTTOM_RIGHT])
			if cur_data!=null:
				cur_bottom_right = cur_data

		if UIDesignConstants.Attr.SHAPE_BOTTOM_LEFT in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_BOTTOM_LEFT])
			if cur_data!=null:
				cur_bottom_left = cur_data


		var cur_corner_detail = 0
		match cur_shape_family:
			UIDesignConstants.ShapeFamily.ROUNDED:
				cur_corner_detail = 8
			UIDesignConstants.ShapeFamily.CUT:
				cur_corner_detail = 1
		
		var shape_style = cur_node.get("theme_override_styles/panel").duplicate(true)
		cur_node.set("theme_override_styles/panel",shape_style)
		shape_style.corner_radius_top_left = cur_top_left
		shape_style.corner_radius_top_right = cur_top_right
		shape_style.corner_radius_bottom_right = cur_bottom_right
		shape_style.corner_radius_bottom_left = cur_bottom_left
		shape_style.corner_detail = cur_corner_detail

		if UIDesignConstants.Attr.SHAPE_WIDTH in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_WIDTH])
			if cur_data!=null:
				cur_node.custom_minimum_size.x = cur_data
				cur_node.size.x = cur_data
				%BaseComponent.custom_minimum_size.x = 0
				%BaseComponent.size.x = 0

		if UIDesignConstants.Attr.SHAPE_HEIGHT in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_HEIGHT])
			if cur_data!=null:
				cur_node.custom_minimum_size.y = cur_data
				cur_node.size.y = cur_data
				%BaseComponent.custom_minimum_size.y = 0
				%BaseComponent.size.y = 0
		
		var cur_shadow_margin_node_array = []
		for cur_path in shadow_margin_node_path_array:
			var target_node = cur_node.get_node_or_null(cur_path)
			if target_node!=null:
				cur_shadow_margin_node_array.append(target_node)
		var cur_shadow_node_array = []
		for cur_path in shadow_node_path_array:
			var target_node = cur_node.get_node_or_null(cur_path)
			if target_node!=null:
				cur_shadow_node_array.append(target_node)
		
		if len(cur_shadow_margin_node_array)==3 and len(cur_shadow_node_array)==3:
			
			for i in range(len(cur_shadow_node_array)):
				var node = cur_shadow_node_array[i]
				var shadow_style = node.get("theme_override_styles/normal").duplicate(true)
				node.set("theme_override_styles/normal",shadow_style)
				shadow_style.corner_radius_top_left = cur_top_left
				shadow_style.corner_radius_top_right = cur_top_right
				shadow_style.corner_radius_bottom_right = cur_bottom_right
				shadow_style.corner_radius_bottom_left = cur_bottom_left
				shadow_style.corner_detail = cur_corner_detail
			
				if UIDesignConstants.Attr.SHAPE_SHADOWCOLOR in data:
					var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_SHADOWCOLOR])
					if cur_data!=null:
						shadow_style.shadow_color = cur_data
				
				shadow_style.shadow_color.a = UIDesignConstants.opacity_array[i]

		if UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH])
			if cur_data!=null:
				shape_style.border_width_left = cur_data
				shape_style.border_width_top = cur_data
				shape_style.border_width_right = cur_data
				shape_style.border_width_bottom = cur_data

		if UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET])
			if cur_data!=null:
				shape_style.expand_margin_left = cur_data
				shape_style.expand_margin_top = cur_data
				shape_style.expand_margin_right = cur_data
				shape_style.expand_margin_bottom = cur_data

		
var shadow_margin_node_path_array = ["UmbraShadowMargin","PenumbraShadowMargin","AmbientShadowMargin"]
var shadow_node_path_array = ["UmbraShadowMargin/UmbraShadow","PenumbraShadowMargin/PenumbraShadow","AmbientShadowMargin/AmbientShadow"]

var _trigger_update_shape_list = {}
## cur_data 存储的格式为LABEL_TOKEN：对应具体的key，可以0：0，这样会去用0去搜索具体的使用属性
func _trigger_update_shape(cur_node, cur_data):
	_trigger_update_shape_list[cur_node] = cur_data

func trigger_update_shape():
	pass

var shadow_animation_time = 0.1

func _update_shape():
	for cur_node in _trigger_update_shape_list:
		var data = _trigger_update_shape_list[cur_node]
		if UIDesignConstants.Attr.SHAPE_COLOR in data:
			var cur_data = _get_update_attr(data[UIDesignConstants.Attr.SHAPE_COLOR])
			if cur_data!=null:
				var shape_style = cur_node.get("theme_override_styles/panel")
				shape_style.bg_color = get_role_color(cur_data)

		if UIDesignConstants.Attr.SHAPE_OPACITY in data:
			var cur_data = _get_update_attr(data[UIDesignConstants.Attr.SHAPE_OPACITY])
			if cur_data!=null:
				var shape_style = cur_node.get("theme_override_styles/panel")
				shape_style.bg_color.a = cur_data
				
		if UIDesignConstants.Attr.SHAPE_ELEVATION in data:
			var cur_data = _get_update_attr(data[UIDesignConstants.Attr.SHAPE_ELEVATION])
			if cur_data!=null:
				var target_dp_height = UIDesignConstants.elevation_level_map_dp_height[cur_data]
				var shadow_tween = cur_node.get_meta("tween")
				if shadow_tween == null:
					pass
				else:
					shadow_tween.kill()

				shadow_tween = create_tween()
				cur_node.set_meta("tween", shadow_tween)
				shadow_tween.set_parallel(true)
			
				var cur_shadow_margin_node_array = []
				for cur_path in shadow_margin_node_path_array:
					var target_node = cur_node.get_node_or_null(cur_path)
					if target_node!=null:
						cur_shadow_margin_node_array.append(target_node)
				var cur_shadow_node_array = []
				for cur_path in shadow_node_path_array:
					var target_node = cur_node.get_node_or_null(cur_path)
					if target_node!=null:
						cur_shadow_node_array.append(target_node)
				
				if len(cur_shadow_margin_node_array)==3 and len(cur_shadow_node_array)==3:
					for i in range(len(cur_shadow_node_array)):
						var node = cur_shadow_node_array[i]
						shadow_tween.tween_property(node, "theme_override_styles/normal:shadow_offset", UIDesignConstants.shadow_offset_array[i][target_dp_height], shadow_animation_time)
						shadow_tween.tween_property(node, "theme_override_styles/normal:shadow_size", UIDesignConstants.shadow_size_array[i][target_dp_height], shadow_animation_time)
					for i in range(len(cur_shadow_margin_node_array)):
						var node = cur_shadow_margin_node_array[i]
						shadow_tween.tween_property(node, "theme_override_constants/margin_left", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height], shadow_animation_time)
						shadow_tween.tween_property(node, "theme_override_constants/margin_top", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height], shadow_animation_time)
						shadow_tween.tween_property(node, "theme_override_constants/margin_right", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height], shadow_animation_time)
						shadow_tween.tween_property(node, "theme_override_constants/margin_bottom", -UIDesignConstants.shadow_expand_size_array[i][target_dp_height], shadow_animation_time)
		
		if UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR in data:
			var cur_data = _get_update_attr(data[UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR])
			if cur_data!=null:
				var shape_style = cur_node.get("theme_override_styles/panel")
				shape_style.border_color = get_role_color(cur_data)

		if UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY in data:
			var cur_data = _get_update_attr(data[UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY])
			if cur_data!=null:
				var shape_style = cur_node.get("theme_override_styles/panel")
				shape_style.border_color.a = cur_data


var _trigger_dynamic_shape_list = {}
## cur_data 为节点属性：dynamic key的结构
func _trigger_dynamic_shape(cur_node, cur_data):
	_trigger_dynamic_shape_list[cur_node] = cur_data

func trigger_dynamic_shape():
	pass

func _dynamic_shape():
	for cur_node in _trigger_dynamic_shape_list:
		var data = _trigger_dynamic_shape_list[cur_node]
		for key in data:
			var value = get_dynamic_data(data[key])
			if value!=null:
				cur_node.set(key, value)

################################### Shape end ####################################


################################### Icon begin ####################################
var _trigger_init_icon_list = {}
## cur_data 存储的格式为LABEL_TOKEN：对应具体的key，可以0：0，这样会去用0去搜索具体的使用属性
func _trigger_init_icon(cur_node, cur_data):
	_trigger_init_icon_list[cur_node] = cur_data

func trigger_init_icon():
	pass

func _init_icon():
	for cur_node in _trigger_init_icon_list:
		var data = _trigger_init_icon_list[cur_node]
		if UIDesignConstants.Attr.ICON_SIZE in data:
			var cur_data = _get_init_attr(data[UIDesignConstants.Attr.ICON_SIZE])
			if cur_data!=null:
				cur_node.icon_size = cur_data
			
			
var _trigger_update_icon_list = {}
## cur_data 存储的格式为LABEL_TOKEN：对应具体的key，可以0：0，这样会去用0去搜索具体的使用属性
func _trigger_update_icon(cur_node, cur_data):
	_trigger_update_icon_list[cur_node] = cur_data

func trigger_update_icon():
	pass

func _update_icon():
	for cur_node in _trigger_update_icon_list:
		var data = _trigger_update_icon_list[cur_node]
		if UIDesignConstants.Attr.ICON_COLOR in data:
			var color_role = _get_update_attr(data[UIDesignConstants.Attr.ICON_COLOR])
			if color_role!=null:
				cur_node.set("theme_override_colors/font_color", get_role_color(color_role))

		if UIDesignConstants.Attr.ICON_OPACITY in data:
			var cur_data = _get_update_attr(data[UIDesignConstants.Attr.ICON_OPACITY])
			if cur_data!=null:
				var cur_color = cur_node.get("theme_override_colors/font_color")
				cur_color.a = cur_data
				cur_node.set("theme_override_colors/font_color", cur_color)


var _trigger_dynamic_icon_list = {}
## cur_data 为节点属性：dynamic key的结构
func _trigger_dynamic_icon(cur_node, cur_data):
	_trigger_dynamic_icon_list[cur_node] = cur_data

func trigger_dynamic_icon():
	pass

func _dynamic_icon():
	for cur_node in _trigger_dynamic_icon_list:
		var data = _trigger_dynamic_icon_list[cur_node]
		for key in data:
			var value = get_dynamic_data(data[key])
			if value!=null:
				cur_node.set(key, value)
				if key=="icon_name":
					if value=="":
						cur_node.visible = false
					else:
						cur_node.visible = true

################################### Icon end ####################################

func _get_init_attr(attr_key):
	var attr_data = get_init_attr_data()
	var result = attr_data.get(attr_key,null)
	if result==null:
		return null
	if typeof(result) == TYPE_DICTIONARY:
		if toggle_mode:
			if button_pressed:
				return result.get("selected",null)
			else:
				return result.get("unselected",null)
		else:
			return result.get("selected",result.get("default",null))
	else:
		return result

func get_init_attr_data():
	return {}


func _get_update_attr(attr_key, cur_state=null):
	var result = null
	if cur_state == null:
		result = cur_update_attr_data.get(attr_key,null)
	else:
		var attr_data = get_update_attr_data()
		
		if attr_key in attr_data[cur_state]:
			result = attr_data[cur_state][attr_key]
		else:
			result = attr_data[UIDesignConstants.State.ENABLED].get(attr_key, null)
		
	if result==null:
		return null
	
	if typeof(result) == TYPE_DICTIONARY:
		if toggle_mode:
			if button_pressed:
				return result.get("selected",null)
			else:
				return result.get("unselected",null)
		else:
			return result.get("selected",result.get("default",null))
	else:
		return result

func get_update_attr_data():
	return {}

var dynamic_data = {}

func set_dynamic_data(key,value):
	dynamic_data[key] = value
	_dynamic_flag = true

func get_all_dynamic_data():
	return dynamic_data

func get_dynamic_data(key):
	return dynamic_data.get(key,null)


func _on_base_component_resized():
	self.custom_minimum_size = %BaseComponent.size
	self.size = %BaseComponent.size
	
