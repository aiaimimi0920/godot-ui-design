extends BaseComponent2
signal finish_progress
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
		UIDesignConstants.Attr.SHAPE_HEIGHT:4,
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
		%LeftTrack.total_width = total_width
		%CenterTrack.total_width = total_width
		%RightTrack.total_width = total_width
		child_init_attr_data = child_init_attr_data.duplicate(true)
		child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = total_width
		_init_flag = true
		
@export var max_value = 100:
	set(val):
		max_value = val
		if not is_inside_tree():
			await ready
		%LeftTrack.max_value = max_value
		%CenterTrack.max_value = max_value
		%RightTrack.max_value = max_value
		%RightTrack.right_value = max_value

@export var min_value = 0:
	set(val):
		min_value = val
		if not is_inside_tree():
			await ready
		%LeftTrack.min_value = min_value
		%CenterTrack.min_value = min_value
		%RightTrack.min_value = min_value
		%LeftTrack.left_value = min_value

@export var now_value = 50:
	set(val):
		now_value = val
		if not is_inside_tree():
			await ready
		_update_value_flag = true

var _update_value_flag = true
func update_value():
	if _update_value_flag==false:
		return 
	%LeftTrack.right_value = now_value
	%RightTrack.left_value = now_value
	%LeftTrackControl.custom_minimum_size.x = %LeftTrack.get_real_width()+2
	%LeftTrackControl.size.x = 0
	%RightTrackControl.custom_minimum_size.x = %RightTrack.get_real_width()+2
	%RightTrackControl.size.x = 0
	
	%LeftTrack._init_flag = true
	%LeftTrack._update_flag = true
	%RightTrack._init_flag = true
	%RightTrack._update_flag = true
	
	if now_value >= max_value:
		emit_signal("finish_progress")
	_update_value_flag = false
		
var _update_left_right_value_flag = true
@export var now_left_value = 10:
	set(val):
		now_left_value = val
		if not is_inside_tree():
			await ready
		_update_left_right_value_flag = true

@export var now_right_value = 30:
	set(val):
		now_right_value = val
		if not is_inside_tree():
			await ready
		_update_left_right_value_flag = true


func update_left_right_value():
	if _update_left_right_value_flag == false:
		return 
	var cur_min_value = min(now_left_value, now_right_value)
	var cur_max_value = max(now_left_value, now_right_value)

	%LeftTrack.right_value = cur_min_value
	%CenterTrack.left_value = cur_min_value
	%CenterTrack.right_value = cur_max_value
	%RightTrack.left_value = cur_max_value
	
	%LeftTrackControl.custom_minimum_size.x = %LeftTrack.get_real_width()+2
	%LeftTrackControl.size.x = 0
	%CenterTrackControl.custom_minimum_size.x = %CenterTrack.get_real_width()+2+2
	%CenterTrackControl.size.x = 0
	
	%RightTrackControl.custom_minimum_size.x = %RightTrack.get_real_width()+2
	%RightTrackControl.size.x = 0

	%LeftTrack._init_flag = true
	%LeftTrack._update_flag = true
	%CenterTrack._init_flag = true
	%CenterTrack._update_flag = true
	%RightTrack._init_flag = true
	%RightTrack._update_flag = true
	_update_left_right_value_flag = false
	

enum ShowMode {DATERMINATE, INDATERMINATE}
@export var show_mode:ShowMode = ShowMode.DATERMINATE:
	set(val):
		show_mode = val
		if not is_inside_tree():
			await ready
		if show_mode == ShowMode.DATERMINATE:
			%LeftTrackControl.visible = true
			%LeftTrack.active_track = true
			%CenterTrackControl.visible = false
			%CenterTrack.active_track = true
			%RightTrackControl.visible = true
			%RightTrack.active_track = false
			%PointControl.visible = true
		elif show_mode == ShowMode.INDATERMINATE:
			%LeftTrackControl.visible = true
			%LeftTrack.active_track = false
			%CenterTrackControl.visible = true
			%CenterTrack.active_track = true
			%RightTrackControl.visible = true
			%RightTrack.active_track = false
			%PointControl.visible = false


func _on_left_track_control_resized():
	%LeftTrack.anchors_preset = PRESET_CENTER_LEFT


func _on_center_track_control_resized():
	%CenterTrack.anchors_preset = PRESET_CENTER_LEFT


func _on_right_track_control_resized():
	%RightTrack.anchors_preset = PRESET_CENTER_LEFT


func add_now_value(cur_add_value):
	var cur_value = max(max_value,now_value+cur_add_value)
	now_value = cur_value

func set_now_value(cur_value):
	cur_value = min(max_value,cur_value)
	now_value = cur_value

func add_now_left_value(cur_add_value):
	var cur_value = max(max_value,now_left_value+cur_add_value)
	now_left_value = cur_value

func set_now_left_value(cur_value):
	cur_value = min(max_value,cur_value)
	now_left_value = cur_value

func add_now_right_value(cur_add_value):
	var cur_value = max(max_value,now_right_value+cur_add_value)
	now_right_value = cur_value

func set_now_right_value(cur_value):
	cur_value = min(max_value,cur_value)
	now_right_value = cur_value

var time = 0
func begin_timer_progress(cur_time): 
	show_mode = ShowMode.DATERMINATE
	if cur_time<=0:
		cur_time=1
	time = cur_time
	var tween = self.get_meta("tween")
	if tween == null:
		pass
	else:
		tween.kill()

	tween = create_tween()
	self.set_meta("tween", tween)
	tween.tween_method(set_now_value, min_value, max_value, time)

var circulate_time = 0
func begin_circulate_timer_progress(cur_time):
	show_mode = ShowMode.INDATERMINATE
	if cur_time<=0:
		cur_time=1
	circulate_time = cur_time
	var tween = self.get_meta("tween")
	if tween == null:
		pass
	else:
		tween.kill()

	tween = create_tween()
	self.set_meta("tween", tween)
	tween.set_parallel(true)
	tween.tween_method(set_now_left_value, min_value, max_value, circulate_time).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD)
	tween.tween_method(set_now_right_value, min_value, max_value, circulate_time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	tween.set_loops()


func delay_begin_timer_progress(cur_time): 
	if show_mode == ShowMode.INDATERMINATE:
		var tween = self.get_meta("tween")
		if tween == null:
			pass
		else:
			if tween.is_running():
				var need_time = time-fmod(tween.get_total_elapsed_time(),circulate_time)
				cur_time = cur_time-need_time
				await tween.loop_finished
				begin_timer_progress(cur_time)
				return 

	begin_timer_progress(cur_time)


func _process(delta):
	super._process(delta)
	update_value()
	update_left_right_value()
