extends BaseComponent2

func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET:UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET,
	})

	_trigger_init_shape(%Content, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET:UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET,
	})

	_trigger_init_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
	})
	
	_trigger_init_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,

		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET,
	})
	pass


func trigger_update_shape():
	_trigger_update_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
		UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.Attr.SHAPE_ELEVATION,
		UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY,
	})

	_trigger_update_shape(%Content, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY+100,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY+100,
	})

	_trigger_update_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.STATE_LAYER_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.STATE_LAYER_OPACITY,
	})
	
	_trigger_update_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY,
		UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY,
	})


@export var child_init_attr_data = {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.EXTRA_LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_WIDTH:40,
		UIDesignConstants.Attr.SHAPE_HEIGHT:40,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:1,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET:0,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				
				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.OUTLINE,
				UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:1,
				
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,

				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
				UIDesignConstants.Attr.SHAPE_OPACITY+100:1,
				UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY+100:0,
			},
		UIDesignConstants.State.DISABLED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE,
				UIDesignConstants.Attr.SHAPE_OPACITY:0.38,

				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.OUTLINE,
				UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:0.12,
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
				
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				
				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.OUTLINE,
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
				
				UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.ON_SURFACE,
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
			
			UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_SURFACE,
			UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
			
			UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.OUTLINE,
			},
		UIDesignConstants.State.DRAGGED:{

			},
	}

func get_update_attr_data():
	return child_update_attr_data

@export var item_heigth = 100

@export var no_item_width = 0

@export var small_item_width = 40
@export var medium_item_width = 60
@export var large_item_width = 120

var now_width = 0
var target_width = 0

var first_init = true

enum ShowMode {NO, SMALL, MEDIUM, LARGE}
@export var show_mode:ShowMode = ShowMode.NO:
	set(val):
		show_mode = val
		if not is_inside_tree():
			await ready
		#await get_tree().process_frame
		if show_mode == ShowMode.NO:
			target_width = no_item_width
			begin_width_change_animation()
		elif show_mode == ShowMode.SMALL:
			target_width = small_item_width
			begin_width_change_animation()
		elif show_mode == ShowMode.MEDIUM:
			target_width = medium_item_width
			begin_width_change_animation()
		elif show_mode == ShowMode.LARGE:
			target_width = large_item_width
			begin_width_change_animation()

var width_change_tween = null

func begin_width_change_animation():
	if first_init:
		width_change(target_width)
		first_init = false
		return 

	if width_change_tween == null:
		pass
	else:
		width_change_tween.kill()

	width_change_tween = create_tween()
	width_change_tween.tween_method(width_change, now_width, target_width, 0.5)

	
signal now_width_change
func width_change(cur_width):
	child_init_attr_data = child_init_attr_data.duplicate(true)
	child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = cur_width
	child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT] = item_heigth
	_init_flag = true
	now_width = cur_width
	if now_width <= 8:
		visible = false
	else:
		visible = true
	emit_signal("now_width_change",now_width)
	var parent_control = get_parent()
	if parent_control:
		if visible:
			parent_control.custom_minimum_size.x = now_width + 8
		else:
			parent_control.custom_minimum_size.x = 2 * now_width
		if now_width <= 0:
			parent_control.visible = false
		else:
			parent_control.visible = true

var begin_pos = Vector2.ZERO
var end_pos = Vector2.ZERO
func start_press():
	super.start_press()
	begin_pos = get_global_mouse_position()
	end_pos = begin_pos

signal finish_pressed
func finish_press():
	super.finish_press()
	end_pos = get_global_mouse_position()
	if get_global_rect().has_point(end_pos):
		return 
	else:
		emit_signal("finish_pressed", begin_pos, end_pos)
		return 

func set_tscn(cur_node):
	var childs = %CenterContainer.get_children()
	for child_node in childs:
		%CenterContainer.remove_child(child_node)
	%CenterContainer.add_child(cur_node)

func get_id():
	var cur_node = %CenterContainer.get_child(0)
	if cur_node:
		return cur_node.get_meta("node_id")
	return null
