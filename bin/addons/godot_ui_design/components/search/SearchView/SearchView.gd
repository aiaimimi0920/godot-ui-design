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
	
@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER_HIGH,
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

func _on_search_head_pressed_lead():
	queue_free()



@export var input_text: String:
	set(val):
		if not is_inside_tree():
			await ready
		%SearchHead.input_text = input_text
	get:
		if not is_inside_tree():
			return ""
		return %SearchHead.input_text


@export var support_text: String:
	set(val):
		if not is_inside_tree():
			await ready
		%SearchHead.support_text = support_text
	get:
		if not is_inside_tree():
			return ""
		return %SearchHead.support_text


func _on_resized():
	%BaseComponent.custom_minimum_size = size


signal search_something
func _on_search_head_search_something(new_text):
	emit_signal("search_something",new_text)
