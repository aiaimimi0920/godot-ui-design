extends BaseComponent2


func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
		
		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH,
	})


func trigger_update_shape():
	_trigger_update_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
		UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.Attr.SHAPE_ELEVATION,
		
		UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY,
	})


@export var new_child_init_attr_data = {
	UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
	UIDesignConstants.Attr.SHAPE_HEIGHT:44,
	UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
	
	UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:1,
}

var begin_pos = Vector2.ZERO
var end_pos = Vector2.ZERO
var last_pos = Vector2.ZERO

signal change_handle_pos
signal start_pressed
signal finish_pressed

func start_press():
	super.start_press()
	_init_flag = true
	begin_pos = get_local_mouse_position()
	end_pos = begin_pos
	last_pos = begin_pos
	emit_signal("start_pressed")
	emit_signal("change_handle_pos")

func finish_press():
	super.finish_press()
	_init_flag = true
	end_pos = get_local_mouse_position()
	begin_pos = end_pos
	last_pos = end_pos
	emit_signal("finish_pressed")
	emit_signal("change_handle_pos")

func _input(event):
	if event is InputEventMouseMotion and (super.is_pressed()):
		last_pos = get_local_mouse_position()
		
		emit_signal("change_handle_pos")
		get_viewport().set_input_as_handled()
	elif event is InputEventMouseButton and (super.is_pressed()):
		if event.button_index==MOUSE_BUTTON_LEFT and event.pressed == false:
			finish_press()

signal start_focused
signal finish_focused
func start_focus():
	super.start_focus()
	_init_flag = true
	emit_signal("start_focused")
	emit_signal("change_handle_pos")

func finish_focus():
	super.finish_focus()
	_init_flag = true
	emit_signal("finish_focused")
	emit_signal("change_handle_pos")
	
func get_init_attr_data():
	var cur_new_child_init_attr_data = new_child_init_attr_data.duplicate(true)
	if super.is_pressed() or super.is_focused():
		cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH]=8
	else:
		cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH]=12
	
	return cur_new_child_init_attr_data
	

@export var new_child_update_attr_data = {
	UIDesignConstants.State.ENABLED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
			UIDesignConstants.Attr.SHAPE_OPACITY:1,
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_1,
			
			UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Role.ON_PRIMARY,
			UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:0,
		},
	UIDesignConstants.State.DISABLED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.ON_SURFACE,
			UIDesignConstants.Attr.SHAPE_OPACITY:0.38,
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
		},
	UIDesignConstants.State.HOVERED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
		},
	UIDesignConstants.State.FOCUSED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
		},
	UIDesignConstants.State.ACTIVATED:{
		},
	UIDesignConstants.State.PRESSED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
		},
	UIDesignConstants.State.DRAGGED:{
		},
}

func get_update_attr_data():
	return new_child_update_attr_data



