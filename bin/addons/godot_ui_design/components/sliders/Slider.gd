extends BaseComponent2

func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})

	_trigger_init_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
	})
	
	_trigger_init_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,

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
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.FULLY_ROUNDED,
		UIDesignConstants.Attr.SHAPE_HEIGHT:40,
		UIDesignConstants.Attr.SHAPE_WIDTH:40,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SECONDARY_CONTAINER,
				UIDesignConstants.Attr.SHAPE_OPACITY:0,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.PRIMARY_COLOR,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
				
				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
			},
		UIDesignConstants.State.DISABLED:{
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.hover_state_layer_opacity,
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.focus_state_layer_opacity,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:1,
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
			UIDesignConstants.Attr.STATE_LAYER_OPACITY:UIDesignConstants.pressed_state_layer_opacity,
			},
		UIDesignConstants.State.DRAGGED:{
			},
	}

func get_update_attr_data():
	return child_update_attr_data

@export var total_width = 100:
	set(val):
		total_width = val
		if not is_inside_tree():
			await ready
		%NoCenterLeftTrack.total_width = total_width
		%NoCenterRightTrack.total_width = total_width
		
		%CenterLeftTrack.total_width = total_width
		%CenterRightTrack.total_width = total_width

		%RangeSelectionLeftTrack.total_width = total_width
		%RangeSelectionCenterTrack.total_width = total_width
		%RangeSelectionRightTrack.total_width = total_width
		child_init_attr_data = child_init_attr_data.duplicate(true)
		child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = total_width+8
		_init_flag = true
		
@export var total_tick_count = 0:
	set(val):
		total_tick_count = val
		if not is_inside_tree():
			await ready
		%NoCenterLeftTrack.total_tick_count = total_tick_count
		%NoCenterRightTrack.total_tick_count = total_tick_count
		
		%CenterLeftTrack.total_tick_count = total_tick_count
		%CenterRightTrack.total_tick_count = total_tick_count

		%RangeSelectionLeftTrack.total_tick_count = total_tick_count
		%RangeSelectionCenterTrack.total_tick_count = total_tick_count
		%RangeSelectionRightTrack.total_tick_count = total_tick_count


@export var max_value = 100:
	set(val):
		max_value = val
		if not is_inside_tree():
			await ready
		%NoCenterLeftTrack.max_value = max_value
		%NoCenterRightTrack.max_value = max_value
		%NoCenterRightTrack.right_value = max_value

		%CenterLeftTrack.max_value = max_value
		%CenterRightTrack.max_value = max_value
		%CenterRightTrack.right_value = max_value

		%RangeSelectionLeftTrack.max_value = max_value
		%RangeSelectionCenterTrack.max_value = max_value
		%RangeSelectionRightTrack.max_value = max_value
		%RangeSelectionRightTrack.right_value = max_value

@export var min_value = 0:
	set(val):
		min_value = val
		if not is_inside_tree():
			await ready
		%NoCenterLeftTrack.min_value = min_value
		%NoCenterRightTrack.min_value = min_value
		%NoCenterLeftTrack.left_value = min_value
		
		%CenterLeftTrack.min_value = min_value
		%CenterRightTrack.min_value = min_value
		%CenterLeftTrack.left_value = min_value

		%RangeSelectionLeftTrack.min_value = min_value
		%RangeSelectionCenterTrack.min_value = min_value
		%RangeSelectionRightTrack.min_value = min_value
		%RangeSelectionLeftTrack.left_value = min_value

@export var now_value = 50:
	set(val):
		now_value = val
		if not is_inside_tree():
			await ready
		%NoCenterLeftTrack.right_value = now_value
		%NoCenterRightTrack.left_value = now_value
		%NoCenterControl1.custom_minimum_size.x = %NoCenterLeftTrack.get_real_width()+6
		%NoCenterControl1.size.x = 0
		%NoCenterControl2.custom_minimum_size.x = %NoCenterRightTrack.get_real_width()+6
		%NoCenterControl2.size.x = 0
		
		%NoCenterLeftTrack._init_flag = true
		%NoCenterLeftTrack._update_flag = true
		%NoCenterRightTrack._init_flag = true
		%NoCenterRightTrack._update_flag = true
		%NoCenterValue.label_text = str(now_value)

		%CenterLeftTrack.right_value = now_value
		%CenterRightTrack.left_value = now_value
		%CenterControl1.custom_minimum_size.x = %CenterLeftTrack.get_real_width()+6
		%CenterControl1.size.x = 0
		%CenterControl2.custom_minimum_size.x = %CenterRightTrack.get_real_width()+6
		%CenterControl2.size.x = 0
		
		%CenterLeftTrack._init_flag = true
		%CenterLeftTrack._update_flag = true
		%CenterRightTrack._init_flag = true
		%CenterRightTrack._update_flag = true
		%CenterValue.label_text = str(now_value)


@export var now_left_value = 50:
	set(val):
		now_left_value = val
		if not is_inside_tree():
			await ready
		update_left_right_value()

@export var now_right_value = 50:
	set(val):
		now_right_value = val
		if not is_inside_tree():
			await ready
		update_left_right_value()


func update_left_right_value():

	var cur_min_value = min(now_left_value, now_right_value)
	var cur_max_value = max(now_left_value, now_right_value)
	
	if now_left_value>now_right_value:
		now_left_value = cur_min_value
		now_right_value = cur_max_value

		if %RangeSelectionLeftHandle.is_pressed():
			%RangeSelectionLeftHandle.finish_press()
			#%RangeSelectionLeftHandle.button_pressed = false

			#%RangeSelectionLeftHandle.finish_focus()
			%RangeSelectionRightHandle.start_press()
			#%RangeSelectionRightHandle.button_pressed = true
			%RangeSelectionRightHandle.grab_focus()
		else:
			%RangeSelectionRightHandle.finish_press()
			%RangeSelectionLeftHandle.start_press()
			%RangeSelectionLeftHandle.grab_focus()
	%RangeSelectionLeftTrack.right_value = cur_min_value
	%RangeSelectionCenterTrack.left_value = cur_min_value
	%RangeSelectionCenterTrack.right_value = cur_max_value
	%RangeSelectionRightTrack.left_value = cur_max_value
	
	%RangeSelectionControl1.custom_minimum_size.x = %RangeSelectionLeftTrack.get_real_width()+6
	%RangeSelectionControl1.size.x = 0
	%RangeSelectionControl2.custom_minimum_size.x = %RangeSelectionCenterTrack.get_real_width()+6+6
	%RangeSelectionControl2.size.x = 0
	
	%RangeSelectionControl3.custom_minimum_size.x = %RangeSelectionRightTrack.get_real_width()+6
	%RangeSelectionControl3.size.x = 0
	
	%RangeSelectionLeftTrack._init_flag = true
	%RangeSelectionLeftTrack._update_flag = true
	%RangeSelectionCenterTrack._init_flag = true
	%RangeSelectionCenterTrack._update_flag = true
	%RangeSelectionRightTrack._init_flag = true
	%RangeSelectionRightTrack._update_flag = true
	%RangeSelectionLeftValue.label_text = str(cur_min_value)
	%RangeSelectionRightValue.label_text = str(cur_max_value)

@export var step = 1.0:
	set(val):
		step = val

func _on_handle_change_handle_1_pos():
	var new_value = 0
	
	if show_mode == ShowMode.NORMAL:
		new_value = ((%NoCenterHandle.last_pos - %NoCenterHandle.begin_pos).x/total_width)*(max_value-min_value) + %NoCenterLeftTrack.right_value
	elif show_mode == ShowMode.CENTER:
		new_value = ((%CenterHandle.last_pos - %CenterHandle.begin_pos).x/total_width)*(max_value-min_value) + %CenterLeftTrack.right_value

	
	new_value = min(new_value,max_value)
	new_value = max(new_value,min_value)
	new_value = round((new_value - min_value)/step)*step+min_value
	if num_mode == NumMode.DISCRETE and total_tick_count>=2:
		update_discrete_value(new_value)
	else:
		now_value = new_value

func _on_handle_change_range_handle_1_pos():
	var new_value = 0
	new_value = ((%RangeSelectionLeftHandle.last_pos - %RangeSelectionLeftHandle.begin_pos).x/total_width)*(max_value-min_value) + %RangeSelectionLeftTrack.right_value
	
	new_value = min(new_value,max_value)
	new_value = max(new_value,min_value)
	new_value = round((new_value - min_value)/step)*step+min_value
	if num_mode == NumMode.DISCRETE and total_tick_count>=2:
		update_discrete_left_value(new_value)
	else:
		now_left_value = new_value
		

func _on_handle_change_range_handle_2_pos():
	var new_value = 0

	new_value = ((%RangeSelectionRightHandle.last_pos - %RangeSelectionRightHandle.begin_pos).x/total_width)*(max_value-min_value) + %RangeSelectionCenterTrack.right_value
	
	new_value = min(new_value,max_value)
	new_value = max(new_value,min_value)
	new_value = round((new_value - min_value)/step)*step+min_value
	if num_mode == NumMode.DISCRETE and total_tick_count>=2:
		update_discrete_right_value(new_value)
	else:
		now_right_value = new_value

func change_handle_1_is_pressed():
	var cur_handle_is_pressed = false
	if show_mode == ShowMode.NORMAL:
		cur_handle_is_pressed = %NoCenterHandle.is_pressed() or %NoCenterHandle.is_focused()
		%NoCenterLeftTrack.handle_is_pressed = cur_handle_is_pressed
		%NoCenterRightTrack.handle_is_pressed = cur_handle_is_pressed
	elif show_mode == ShowMode.CENTER:
		cur_handle_is_pressed = %CenterHandle.is_pressed() or %CenterHandle.is_focused()
		%CenterLeftTrack.handle_is_pressed = cur_handle_is_pressed
		%CenterRightTrack.handle_is_pressed = cur_handle_is_pressed


func change_range_handle_1_is_pressed():
	var cur_handle_is_pressed = false
	if show_mode == ShowMode.RANGE_SELECTION:
		cur_handle_is_pressed = %RangeSelectionLeftHandle.is_pressed() or %RangeSelectionLeftHandle.is_focused()
		%RangeSelectionLeftTrack.handle_is_pressed = cur_handle_is_pressed
		%RangeSelectionCenterTrack.handle_is_pressed = cur_handle_is_pressed

func change_range_handle_2_is_pressed():
	var cur_handle_is_pressed = false
	if show_mode == ShowMode.RANGE_SELECTION:
		cur_handle_is_pressed = %RangeSelectionRightHandle.is_pressed() or %RangeSelectionRightHandle.is_focused()
		%RangeSelectionCenterTrack.handle_is_pressed = cur_handle_is_pressed
		%RangeSelectionRightTrack.handle_is_pressed = cur_handle_is_pressed


func _on_control_1_resized():
	%NoCenterLeftTrack.anchors_preset = PRESET_CENTER_LEFT
	%CenterLeftTrack.anchors_preset = PRESET_CENTER_LEFT
	pass # Replace with function body.


func _on_control_2_resized():
	%NoCenterRightTrack.anchors_preset = PRESET_CENTER_LEFT
	%CenterRightTrack.anchors_preset = PRESET_CENTER_LEFT
	pass # Replace with function body.


func _on_handle_1_start_pressed():
	if show_mode == ShowMode.NORMAL:
		%NoCenterValue.set_value_visible(true)
		%NoCenterValue.anchors_preset = PRESET_CENTER_BOTTOM
	elif show_mode == ShowMode.CENTER:
		%CenterValue.set_value_visible(true)
		%CenterValue.anchors_preset = PRESET_CENTER_BOTTOM

func _on_range_handle_1_start_pressed():
	if show_mode == ShowMode.RANGE_SELECTION:
		%RangeSelectionLeftValue.set_value_visible(true)
		%RangeSelectionLeftValue.anchors_preset = PRESET_CENTER_BOTTOM

func _on_range_handle_2_start_pressed():
	if show_mode == ShowMode.RANGE_SELECTION:
		%RangeSelectionRightValue.set_value_visible(true)
		%RangeSelectionRightValue.anchors_preset = PRESET_CENTER_BOTTOM

func update_discrete_value(new_value):
	var cur_value = new_value
	var cur_step = (max_value-min_value)*1.0/(total_tick_count-1)
	var begin_value = min_value
	var end_value = begin_value + cur_step
	while true:
		if cur_value >= begin_value and cur_value <= end_value:
			break
		begin_value = end_value
		end_value = begin_value + cur_step
		if end_value>max_value:
			break
	
	if abs(cur_value-begin_value) > abs(cur_value-end_value):
		now_value =  end_value
	else:
		now_value =  begin_value

func update_discrete_left_value(new_value):
	var cur_value = new_value
	var cur_step = (max_value-min_value)*1.0/(total_tick_count-1)
	var begin_value = min_value
	var end_value = begin_value + cur_step
	while true:
		if cur_value >= begin_value and cur_value <= end_value:
			break
		begin_value = end_value
		end_value = begin_value + cur_step
		if end_value>max_value:
			break
	
	if abs(cur_value-begin_value) > abs(cur_value-end_value):
		now_left_value =  end_value
	else:
		now_left_value =  begin_value


func update_discrete_right_value(new_value):
	var cur_value = new_value
	var cur_step = (max_value-min_value)*1.0/(total_tick_count-1)
	var begin_value = min_value
	var end_value = begin_value + cur_step
	while true:
		if cur_value >= begin_value and cur_value <= end_value:
			break
		begin_value = end_value
		end_value = begin_value + cur_step
		if end_value>max_value:
			break
	
	if abs(cur_value-begin_value) > abs(cur_value-end_value):
		now_right_value =  end_value
	else:
		now_right_value =  begin_value

func _on_handle_1_finish_pressed():
	if show_mode == ShowMode.NORMAL:
		%NoCenterValue.set_value_visible(false)
	elif show_mode == ShowMode.CENTER:
		%CenterValue.set_value_visible(false)
		
	if num_mode == NumMode.DISCRETE and total_tick_count>=2:
		update_discrete_value(now_value)

func _on_range_handle_1_finish_pressed():
	if show_mode == ShowMode.RANGE_SELECTION:
		%RangeSelectionLeftValue.set_value_visible(false)
	if num_mode == NumMode.DISCRETE and total_tick_count>=2:
		update_discrete_left_value(now_left_value)

func _on_range_handle_2_finish_pressed():
	if show_mode == ShowMode.RANGE_SELECTION:
		%RangeSelectionRightValue.set_value_visible(false)
	if num_mode == NumMode.DISCRETE and total_tick_count>=2:
		update_discrete_right_value(now_right_value)


enum NumMode {CONTINUOUS, DISCRETE}
@export var num_mode:NumMode = NumMode.CONTINUOUS:
	set(val):
		num_mode = val
		if not is_inside_tree():
			await ready

		if show_mode == ShowMode.NORMAL:
			%NoCenterLeftTrack.num_mode = num_mode
			%NoCenterRightTrack.num_mode = num_mode
		elif show_mode == ShowMode.CENTER:
			%CenterLeftTrack.num_mode = num_mode
			%CenterRightTrack.num_mode = num_mode
		elif show_mode == ShowMode.RANGE_SELECTION:
			%RangeSelectionLeftTrack.num_mode = num_mode
			%RangeSelectionCenterTrack.num_mode = num_mode
			%RangeSelectionRightTrack.num_mode = num_mode



enum ShowMode {NORMAL, CENTER, RANGE_SELECTION}
@export var show_mode:ShowMode = ShowMode.NORMAL:
	set(val):
		show_mode = val
		if not is_inside_tree():
			await ready
		if show_mode == ShowMode.NORMAL:
			%NoCenterSlider.visible = true
			%RangeSelectionSlider.visible = false
			%CenterSlider.visible = false
		elif show_mode == ShowMode.CENTER:
			%NoCenterSlider.visible = false
			%RangeSelectionSlider.visible = false
			%CenterSlider.visible = true
		elif show_mode == ShowMode.RANGE_SELECTION:
			%NoCenterSlider.visible = false
			%RangeSelectionSlider.visible = true
			%CenterSlider.visible = false

func _on_range_control_1_resized():
	%RangeSelectionLeftTrack.anchors_preset = PRESET_CENTER_LEFT


func _on_range_control_2_resized():
	%RangeSelectionCenterTrack.anchors_preset = PRESET_CENTER_LEFT


func _on_range_control_3_resized():
	%RangeSelectionRightTrack.anchors_preset = PRESET_CENTER_LEFT

