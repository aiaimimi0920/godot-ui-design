extends BaseComponent2

@export var active_track:bool:
	set(val):
		active_track = val
		update_cur_state_data_flag = true

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




func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})

func trigger_update_shape():
	_trigger_update_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
		UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.Attr.SHAPE_ELEVATION,
		UIDesignConstants.Attr.SHAPE_OUTLINE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY,
	})
	
	_trigger_update_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
	})

	_trigger_update_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
	})


@export var new_child_init_attr_data = {
	UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
	UIDesignConstants.Attr.SHAPE_HEIGHT:48,
	UIDesignConstants.Attr.SHAPE_WIDTH:48,
	UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:4,
	UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
}

func get_init_attr_data():
	return new_child_init_attr_data
	

@export var active_update_attr_data = {
	UIDesignConstants.State.ENABLED:{
			UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
			UIDesignConstants.Attr.SHAPE_OPACITY:0,
			UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:1,
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
			UIDesignConstants.Attr.SHAPE_OPACITY:0,
			UIDesignConstants.Attr.SHAPE_OUTLINE_OPACITY:1,
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

var offset = 5

func get_points():
	var inner_radius = new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH]/2-new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH]
	var outer_radius = new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH]/2
	var left_angle = (left_value+(max_value-min_value)*1.0/50-min_value)*1.0/(max_value-min_value)*2*PI
	var real_left_angle = (left_value-min_value)*1.0/(max_value-min_value)*2*PI

	var ring_left_center_pos = Vector2((outer_radius+inner_radius)/2*sin(left_angle),-(outer_radius+inner_radius)/2*cos(left_angle))
	var left_point_array = []
	var left_point_angle_array = []
	for i in range(9):
		left_point_angle_array.append((8.0+i)/8.0*PI+left_angle)
	
	for cur_angle in left_point_angle_array:
		left_point_array.append(Vector2((outer_radius-inner_radius)/2*sin(cur_angle),-(outer_radius-inner_radius)/2*cos(cur_angle))+ring_left_center_pos)

	var right_angle = (right_value-(max_value-min_value)*1.0/50-min_value)*1.0/(max_value-min_value)*2*PI
	var real_right_angle = (right_value-min_value)*1.0/(max_value-min_value)*2*PI
	

	
	var ring_right_center_pos = Vector2((outer_radius+inner_radius)/2*sin(right_angle),-(outer_radius+inner_radius)/2*cos(right_angle))
	var right_point_array = []
	var right_point_angle_array = []
	for i in range(9):
		right_point_angle_array.append((i)/8.0*PI+right_angle)
	
	for cur_angle in right_point_angle_array:
		right_point_array.append(Vector2((outer_radius-inner_radius)/2*sin(cur_angle),-(outer_radius-inner_radius)/2*cos(cur_angle))+ring_right_center_pos)
	
	var all_points = []
	
	var center_pos = Vector2(outer_radius,outer_radius)
	var left_top_pos = Vector2(-offset,-offset)
	var right_top_pos = Vector2(2*outer_radius+offset,-offset)
	var right_bottom_pos = Vector2(2*outer_radius+offset,2*outer_radius+offset)
	var left_bottom_pos = Vector2(-offset,2*outer_radius+offset)
	

	
	if (left_angle-right_angle)*(real_left_angle-real_right_angle)>0:
		pass
	else:
		if active_track:
			return []
		else:
			all_points=[left_top_pos,right_top_pos,right_bottom_pos,left_bottom_pos]
			return all_points
	
	all_points.append(center_pos)
	left_angle = fmod(left_angle,2*PI)
	real_left_angle = fmod(real_left_angle,2*PI)
	right_angle = fmod(right_angle,2*PI)
	real_right_angle = fmod(real_right_angle,2*PI)
	
	if (right_value == min_value and max_value == left_value) or (right_value == min_value and min_value == left_value)\
		 or (right_value == max_value and max_value == left_value):
		if active_track:
			return []
		else:
			all_points=[left_top_pos,right_top_pos,right_bottom_pos,left_bottom_pos]
			return all_points
	elif left_value == min_value and max_value == right_value:
		all_points=[left_top_pos,right_top_pos,right_bottom_pos,left_bottom_pos]
		return all_points
	
	for cur_point in left_point_array:
		all_points.append(center_pos+cur_point)
	
	var left_index = 0
	var right_index = 0
	
	if real_left_angle<=PI/2 and 0<real_left_angle:
		left_index = 0
		#all_points.append(right_top_pos)
	elif real_left_angle>PI/2 and real_left_angle<=PI:
		left_index = 1
		#all_points.append(right_bottom_pos)
	elif real_left_angle>PI and real_left_angle<=1.5*PI:
		left_index = 2
		#all_points.append(left_bottom_pos)
	elif real_left_angle>1.5*PI and real_left_angle<=2*PI:
		left_index = 3
		#all_points.append(left_top_pos)

	if real_right_angle<=PI/2 and 0<real_right_angle:
		right_index = 0
		#all_points.append(right_top_pos)
	elif real_right_angle>PI/2 and real_right_angle<=PI:
		right_index = 1
		#all_points.append(right_bottom_pos)
	elif real_right_angle>PI and real_right_angle<=1.5*PI:
		right_index = 2
		#all_points.append(left_bottom_pos)
	elif real_right_angle>1.5*PI and real_right_angle<=2*PI:
		right_index = 3
		#all_points.append(left_top_pos)
	
	var add_index_array = []
	if left_index == right_index and (left_value<right_value or (left_value==max_value and left_value>=right_value)):
		add_index_array.append(left_index)
	else:
		var cur_index = left_index
		add_index_array.append(cur_index)
		cur_index+=1
		cur_index=cur_index%4
		while cur_index != right_index:
			add_index_array.append(cur_index)
			cur_index+=1
			cur_index=cur_index%4
		add_index_array.append(right_index)
	
	for cur_one_index in add_index_array:
		if cur_one_index == 0:
			all_points.append(right_top_pos)
		elif cur_one_index == 1:
			all_points.append(right_bottom_pos)
		elif cur_one_index == 2:
			all_points.append(left_bottom_pos)
		elif cur_one_index == 3:
			all_points.append(left_top_pos)
	
	if left_index == right_index and left_value>=right_value:
		var cur_value = all_points[-1]
		if left_index == 0:
			cur_value.x = cur_value.x - 1
			all_points[-1] = cur_value
		elif left_index == 1:
			cur_value.y = cur_value.y - 1
			all_points[-1] = cur_value
		elif left_index == 2:
			cur_value.x = cur_value.x + 1
			all_points[-1] = cur_value
		elif left_index == 3:
			cur_value.y = cur_value.y + 1
			all_points[-1] = cur_value
	#
	for cur_point in right_point_array:
		all_points.append(center_pos+cur_point)

	return all_points
