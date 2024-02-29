extends BaseComponent2

@export var active_track:bool:
	set(val):
		active_track = val
		update_cur_state_data_flag = true

enum TrackMode{LEFT,CENTER,RIGHT}
@export var track_mode:TrackMode:
	set(val):
		track_mode = val

@export var left_value = 0:
	set(val):
		left_value = val

@export var right_value = 0:
	set(val):
		right_value = val

@export var min_value = 0:
	set(val):
		min_value = val

@export var max_value = 0:
	set(val):
		max_value = val

@export var total_width = 0:
	set(val):
		total_width = val


func get_real_width():
	var cur_total_width = total_width*(right_value-left_value)*1.0/(max_value-min_value)
	if track_mode == TrackMode.LEFT or track_mode == TrackMode.RIGHT:
		return cur_total_width - 2
	return cur_total_width - 4


func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		
		UIDesignConstants.Attr.SHAPE_MARGIN_SIZE:UIDesignConstants.Attr.SHAPE_MARGIN_SIZE,

		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})

func trigger_update_shape():
	_trigger_update_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
		UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.Attr.SHAPE_ELEVATION,
	})


@export var new_child_init_attr_data = {
	UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
	UIDesignConstants.Attr.SHAPE_HEIGHT:4,
	UIDesignConstants.Attr.SHAPE_WIDTH:0,
	UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
}

func get_init_attr_data():
	var cur_new_child_init_attr_data = new_child_init_attr_data.duplicate(true)
	cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = get_real_width()
	if cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH]<=0:
		visible = false
	else:
		visible = true
	
	cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_MARGIN_SIZE] = 2

	return cur_new_child_init_attr_data
	

@export var active_update_attr_data = {
	UIDesignConstants.State.ENABLED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
			UIDesignConstants.Attr.SHAPE_OPACITY:1,
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
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


@export var inactive_update_attr_data = {
	UIDesignConstants.State.ENABLED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_CONTAINER,
			UIDesignConstants.Attr.SHAPE_OPACITY:1,
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
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
	if active_track:
		return active_update_attr_data
	else:
		return inactive_update_attr_data

