extends BaseComponent2

@export var subhead_text: String:
	set(val):
		subhead_text = val
		set_dynamic_data("subhead_text", subhead_text)
	get:
		return subhead_text

@export var support_text: String:
	set(val):
		support_text = val
		set_dynamic_data("support_text", support_text)
	get:
		return support_text

@export var action_array: Array:
	set(val):
		action_array = val
		rebuild_action_array_node()
	get:
		return action_array

@export var text_button_tscn = preload("res://addons/godot_ui_design/components/buttons/common_buttons/TextButton.tscn")

func rebuild_action_array_node():
	if not is_inside_tree():
		await ready
	var childs = %ActionFlowContainer.get_children()
	for child_node in childs:
		%ActionFlowContainer.remove_child(child_node)
	
	for key_value in action_array:
		var cur_node = text_button_tscn.instantiate()
		%ActionFlowContainer.add_child(cur_node)
		cur_node.label_text = key_value[0]
		cur_node.icon_name = ""
	
	pass

func trigger_init_label():
	_trigger_init_label(%SubheadLabel, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN,
	})
	_trigger_init_label(%SupportLabel, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN+100,
	})

func trigger_update_label():
	_trigger_update_label(%SubheadLabel, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY,
	})
	_trigger_update_label(%SupportLabel, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR+100,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY,
	})

func trigger_dynamic_label():
	_trigger_dynamic_label(%SubheadLabel, {
		"text":"subhead_text",
	})
	_trigger_dynamic_label(%SupportLabel, {
		"text":"support_text",
	})

func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})

	_trigger_init_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
	})
	
	_trigger_init_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
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
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.LabelToken.TITLE_SMALL,
		UIDesignConstants.Attr.LABEL_TOKEN+100:UIDesignConstants.LabelToken.BODY_MEDIUM,
		
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.MEDIUM_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:24,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_COLOR+100:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,
				
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
				
				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
			},
		UIDesignConstants.State.DISABLED:{
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_COLOR+100:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_OPACITY:0.38,
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
				
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
			},
		UIDesignConstants.State.DRAGGED:{
			},
	}

func get_update_attr_data():
	return child_update_attr_data

func _on_tree_entered():
	begin_change_visible()

func begin_change_visible():
	var style_box = StyleBoxEmpty.new()
	get_parent().set("theme_override_styles/panel",style_box)
	get_parent().gui_disable_input = true
	get_parent().handle_input_locally = false
	get_parent().always_on_top = true
	#get_parent().gui_embed_subwindows = true

	await get_tree().process_frame
	modulate.a = 1
	var panel = get_parent().get_child(0,true)
	panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	panel.visible = false

	
