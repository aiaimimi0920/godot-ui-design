extends BaseComponent2
	
@export var support_text: String:
	set(val):
		support_text = val
		set_dynamic_data("support_text", support_text)
	get:
		return support_text

func trigger_init_label():
	_trigger_init_label(%SupportTextLabel, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN,
	})

func trigger_update_label():
	_trigger_update_label(%SupportTextLabel, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY,
	})


func trigger_dynamic_label():
	_trigger_dynamic_label(%SupportTextLabel, {
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


@export var child_init_attr_data = {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.EXTRA_SMALL_ROUNDING,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		UIDesignConstants.Attr.SHAPE_HEIGHT:48,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
		
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.LabelToken.BODY_MEDIUM,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.INVERSE_SURFACE,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_3,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				
				
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.INVERSE_ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
				
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
			
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.ON_PRIMARY,
				
			},
		UIDesignConstants.State.DISABLED:{
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
			
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.INVERSE_PRIMARY,
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
			
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.INVERSE_PRIMARY,
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
			
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.INVERSE_PRIMARY,
			},
		UIDesignConstants.State.DRAGGED:{
			},
	}
	
func get_update_attr_data():
	return child_update_attr_data

var update_action_list_flag = false
@export var action_list = []:
	set(val):
		action_list = val
		update_action_list_flag = true
	get:
		return action_list

func _process(delta):
	super._process(delta)
	update_action_list()


@export var action_tscn = preload("res://addons/godot_ui_design/components/buttons/common_buttons/TextButton.tscn")

func update_action_list():
	if update_action_list_flag == false:
		return 

	var childs = %TextButtonHBoxContainer.get_children()
	for child_node in childs:
		%TextButtonHBoxContainer.remove_child(child_node)
	
	for cur_data in action_list:
		var action_name = cur_data.get("action_name","action_name")
		var action_sig_name = cur_data.get("action_sig_name","action_sig_name")
		var action_data = cur_data.get("action_data",{})
		var cur_node = action_tscn.instantiate()
		cur_node.child_update_attr_data = cur_node.child_update_attr_data.duplicate(true)
		
		cur_node.label_text = action_name
		cur_node.connect("pressed",pressed_func.bind(action_sig_name, action_data))
		cur_node.child_update_attr_data[UIDesignConstants.State.ENABLED][UIDesignConstants.Attr.LABEL_COLOR] = UIDesignConstants.Role.INVERSE_PRIMARY
		%TextButtonHBoxContainer.add_child(cur_node)


	update_action_list_flag = false

signal trigger_action
func pressed_func(action_sig_name, action_data):
	emit_signal("trigger_action",action_sig_name, action_data)

signal close_panel
func _on_head_icon_button_pressed():
	emit_signal("close_panel")

func _on_resized():
	%BaseComponent.custom_minimum_size = size

@export var show_close_button=false:
	set(val):
		show_close_button = val
		if not is_inside_tree():
			await ready
		if show_close_button:
			%CloseIconButton.visible = true
		else:
			%CloseIconButton.visible = false
	get:
		return show_close_button
