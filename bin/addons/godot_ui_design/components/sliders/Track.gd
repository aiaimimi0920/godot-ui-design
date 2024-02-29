extends BaseComponent2

@export var point_tscn:PackedScene

enum TrackMode{LEFT,CENTER,RIGHT}
@export var track_mode:TrackMode:
	set(val):
		track_mode = val

@export var active_track:bool:
	set(val):
		active_track = val

@export var left_value = 0:
	set(val):
		left_value = val
		_update_tick_node_flag =true

@export var right_value = 0:
	set(val):
		right_value = val
		_update_tick_node_flag =true

@export var min_value = 0:
	set(val):
		min_value = val
		_update_tick_node_flag =true

@export var max_value = 0:
	set(val):
		max_value = val
		_update_tick_node_flag =true

@export var total_width = 0:
	set(val):
		total_width = val

var _update_tick_node_flag = true
@export var total_tick_count = 0:
	set(val):
		total_tick_count = val
		_update_tick_node_flag = true

		
@export var show_center_value = false:
	set(val):
		show_center_value = val

@export var center_value = 0:
	set(val):
		center_value = val
		

enum NumMode {CONTINUOUS, DISCRETE}
@export var num_mode:NumMode = NumMode.CONTINUOUS:
	set(val):
		num_mode = val

var handle_is_pressed:=false

func get_real_width():
	var cur_total_width = total_width*(right_value-left_value)/(max_value-min_value)
	var offset_value = 0
	if handle_is_pressed:
		offset_value = 6+4
	else:
		offset_value = 6+6
	if track_mode == TrackMode.LEFT or track_mode == TrackMode.RIGHT:
		return cur_total_width - offset_value + 4
	if handle_is_pressed:
		return cur_total_width-22
	else:
		return cur_total_width-24


func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		
		UIDesignConstants.Attr.SHAPE_TOP_LEFT:UIDesignConstants.Attr.SHAPE_TOP_LEFT,
		UIDesignConstants.Attr.SHAPE_TOP_RIGHT:UIDesignConstants.Attr.SHAPE_TOP_RIGHT,
		UIDesignConstants.Attr.SHAPE_BOTTOM_RIGHT:UIDesignConstants.Attr.SHAPE_BOTTOM_RIGHT,
		UIDesignConstants.Attr.SHAPE_BOTTOM_LEFT:UIDesignConstants.Attr.SHAPE_BOTTOM_LEFT,
		
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
	UIDesignConstants.Attr.SHAPE_HEIGHT:16,
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
	
	if track_mode==TrackMode.LEFT:
		cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_TOP_RIGHT] = 4
		cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_BOTTOM_RIGHT] = 4
	elif track_mode==TrackMode.RIGHT:
		cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_TOP_LEFT] = 4
		cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_BOTTOM_LEFT] = 4
	else:
		cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_TOP_RIGHT] = 0
		cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_BOTTOM_RIGHT] = 0
		cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_TOP_LEFT] = 0
		cur_new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_BOTTOM_LEFT] = 0

	return cur_new_child_init_attr_data
	

@export var active_update_attr_data = {
	UIDesignConstants.State.ENABLED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
			UIDesignConstants.Attr.SHAPE_OPACITY:1,
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
		},
	UIDesignConstants.State.DISABLED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.ON_SURFACE,
			UIDesignConstants.Attr.SHAPE_OPACITY:0.38,
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
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
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_VARIANT,
			UIDesignConstants.Attr.SHAPE_OPACITY:0.38,
			UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
		},
	UIDesignConstants.State.HOVERED:{
		},
	UIDesignConstants.State.FOCUSED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SECONDARY_CONTAINER,
		},
	UIDesignConstants.State.ACTIVATED:{
		},
	UIDesignConstants.State.PRESSED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SECONDARY_CONTAINER,
		},
	UIDesignConstants.State.DRAGGED:{
		},
}



func get_update_attr_data():
	if active_track:
		return active_update_attr_data
	else:
		return inactive_update_attr_data


func update_tick_node():
	if _update_tick_node_flag:
		if not is_inside_tree():
			await ready
		var childs = %TickNodes.get_children()
		for child_node in childs:
			%TickNodes.remove_child(child_node)
			
		var show_value = []
		if total_tick_count <= 0:
			pass
		elif total_tick_count == 1:
			show_value = [max_value]
		elif total_tick_count == 2:
			show_value = [min_value, max_value]
		else:
			show_value = [min_value]
			var step = (max_value-min_value)*1.0/(total_tick_count-1)
			var cur_value = min_value+step
			while cur_value<max_value:
				show_value.append(cur_value)
				cur_value = cur_value+step
			show_value.append(max_value)
		
		var cur_show_value = []
		for key in show_value:
			if key<=right_value and key>=left_value:
				cur_show_value.append(key)
		
		if len(cur_show_value)>0:
			#var cur_step_width = total_width*1.0/(total_tick_count-1)
			var cur_show_value_pos = []
			var left_pos = 0
			var right_pos = 0
			if track_mode == TrackMode.RIGHT:
				left_pos = (left_value-min_value)*1.0/(max_value-min_value)*total_width
				var offset_value = 0
				if handle_is_pressed:
					offset_value = 6+4
				else:
					offset_value = 6+6
				
				left_pos = left_pos + offset_value +4
				right_pos = total_width + 4 +4
			elif track_mode == TrackMode.LEFT:
				left_pos = 0
				right_pos = (right_value-min_value)*1.0/(max_value-min_value)*total_width
				var offset_value = 0
				if handle_is_pressed:
					offset_value = 6+4
				else:
					offset_value = 6+6
				
				right_pos = right_pos - offset_value + 4
			
			for key in cur_show_value:
				var center_pos = (key-min_value)*1.0/(max_value-min_value)*total_width+4
				if center_pos >= left_pos and center_pos <= right_pos:
					cur_show_value_pos.append(center_pos-2-left_pos)
			
			for key_x in cur_show_value_pos:
				var cur_node = point_tscn.instantiate()
				%TickNodes.add_child(cur_node)
				cur_node.is_active = active_track
				cur_node.position = Vector2(key_x,-2)
				cur_node.mouse_filter = MOUSE_FILTER_IGNORE
				#cur_node._update_shape()
				
				
	_update_tick_node_flag = false
	pass


func _process(delta):
	super._process(delta)
	update_tick_node()


func _on_resized():
	%Content.size.y = 0
	%TickNodes.size_flags_vertical = SIZE_SHRINK_CENTER
