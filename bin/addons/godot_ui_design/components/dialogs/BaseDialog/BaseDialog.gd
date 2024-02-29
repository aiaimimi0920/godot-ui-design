extends BaseComponent2

@export var support_text: String:
	set(val):
		support_text = val
		set_dynamic_data("support_text", support_text)
	get:
		return support_text
	
@export var head_text: String:
	set(val):
		head_text = val
		set_dynamic_data("head_text", head_text)
	get:
		return head_text

@export var head_icon_name = "":
	set(val):
		head_icon_name = val
		set_dynamic_data("head_icon_name", head_icon_name)
	get:
		return head_icon_name

func trigger_init_label():
	_trigger_init_label(%HeadLabel, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN+100,
	})
	_trigger_init_label(%SupportLabel, {
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.Attr.LABEL_TOKEN+200,
	})

func trigger_update_label():
	_trigger_update_label(%HeadLabel, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR+100,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY,
	})

	_trigger_update_label(%SupportLabel, {
		UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Attr.LABEL_COLOR+200,
		UIDesignConstants.Attr.LABEL_OPACITY:UIDesignConstants.Attr.LABEL_OPACITY,
	})


func trigger_dynamic_label():
	_trigger_dynamic_label(%HeadLabel, {
		"text":"head_text",
	})
	
	_trigger_dynamic_label(%SupportLabel, {
		"text":"support_text",
	})

func trigger_init_icon():
	_trigger_init_icon(%HeadIcon, {
		UIDesignConstants.Attr.ICON_SIZE:UIDesignConstants.Attr.ICON_SIZE,
	})

func trigger_update_icon():
	_trigger_update_icon(%HeadIcon, {
		UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Attr.ICON_COLOR,
		UIDesignConstants.Attr.ICON_OPACITY:UIDesignConstants.Attr.ICON_OPACITY,
	})


func trigger_dynamic_icon():
	_trigger_dynamic_icon(%HeadIcon, {
		"icon_name":"head_icon_name",
	})


func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})


func trigger_update_shape():
	_trigger_update_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
		UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.Attr.SHAPE_ELEVATION,
	})


@export var child_init_attr_data = {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.EXTRA_LARGE_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:48,
		UIDesignConstants.Attr.SHAPE_WIDTH:280,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
		
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.LabelToken.LABEL_LARGE,
		UIDesignConstants.Attr.LABEL_TOKEN+100:UIDesignConstants.LabelToken.HEADLINE_SMALL,
		UIDesignConstants.Attr.LABEL_TOKEN+200:UIDesignConstants.LabelToken.BODY_MEDIUM,
		UIDesignConstants.Attr.ICON_SIZE:24,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER_HIGH,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_3,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				
				
				UIDesignConstants.Attr.ICON_COLOR:UIDesignConstants.Role.SECONDARY_COLOR,
				UIDesignConstants.Attr.ICON_OPACITY:1,
				
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_COLOR+100:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_COLOR+200:UIDesignConstants.Role.ON_SURFACE_VARIANT,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
			},
		UIDesignConstants.State.DISABLED:{
			},
		UIDesignConstants.State.HOVERED:{
			},
		UIDesignConstants.State.FOCUSED:{
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
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
		cur_node.label_text = action_name
		cur_node.connect("pressed",pressed_func.bind(action_sig_name, action_data))
	
		%TextButtonHBoxContainer.add_child(cur_node)


	update_action_list_flag = false

signal trigger_action
func pressed_func(action_sig_name, action_data):
	emit_signal("trigger_action",action_sig_name, action_data)
	#printt("trigger_action",action_sig_name, action_data)
