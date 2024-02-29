extends BaseComponent2
	
func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})


func trigger_update_shape():
	_trigger_update_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
		UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.Attr.SHAPE_ELEVATION,
	})

@export var child_init_attr_data = {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.NO_ROUNDING,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
	}
	
func get_init_attr_data():
	return child_init_attr_data
@export var normal_child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
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

@export var scroll_child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
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
	if show_mode==ShowMode.NORMAL:
		return normal_child_update_attr_data
	elif show_mode==ShowMode.ON_SCROLL:
		return scroll_child_update_attr_data


var show_mode:
	set(val):
		if not is_inside_tree():
			await ready
		%FullScreenDialogHead.show_mode = val
	get:
		return %FullScreenDialogHead.show_mode
	
enum ShowMode {NORMAL, ON_SCROLL}
func _on_content_panel_container_resized():
	if %ContentPanelContainer.size.y>%ContentScrollContainer.size.y:
		show_mode = ShowMode.NORMAL
	else:
		show_mode = ShowMode.ON_SCROLL


func _on_full_screen_dialog_head_close_panel():
	queue_free()

signal trigger_action
func _on_full_screen_dialog_head_trigger_action(action_sig_name, action_data):
	emit_signal("trigger_action",action_sig_name, action_data)


@export var head_text: String:
	set(val):
		if not is_inside_tree():
			await ready
		%FullScreenDialogHead.head_text = head_text
	get:
		if not is_inside_tree():
			return ""
		return %FullScreenDialogHead.head_text


@export var action_list=[]:
	set(val):
		if not is_inside_tree():
			await ready
		%FullScreenDialogHead.action_list = action_list
	get:
		if not is_inside_tree():
			return []
		return %FullScreenDialogHead.action_list


func _on_resized():
	%BaseComponent.custom_minimum_size = size
