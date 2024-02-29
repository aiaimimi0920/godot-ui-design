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
		UIDesignConstants.Attr.SHAPE_WIDTH:48,
		UIDesignConstants.Attr.SHAPE_HEIGHT:48,
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

@export var radius = 48:
	set(val):
		radius = val
		if not is_inside_tree():
			await ready
		%Track1.new_child_init_attr_data = %Track1.new_child_init_attr_data.duplicate(true)
		%Track1.new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = radius
		%Track1.new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT] = radius
		
		%Track2.new_child_init_attr_data = %Track2.new_child_init_attr_data.duplicate(true)
		%Track2.new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = radius
		%Track2.new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT] = radius
		
		child_init_attr_data = child_init_attr_data.duplicate(true)
		child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = radius
		child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT] = radius
		
		%Track1._init_flag = true
		%Track2._init_flag = true
		
		_init_flag = true

@export var ring_width = 4:
	set(val):
		ring_width = val
		if not is_inside_tree():
			await ready
		%Track1.new_child_init_attr_data = %Track1.new_child_init_attr_data.duplicate(true)
		%Track2.new_child_init_attr_data = %Track2.new_child_init_attr_data.duplicate(true)
		%Track1.new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH] = ring_width
		%Track2.new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH] = ring_width
		
		%Track1._init_flag = true
		%Track2._init_flag = true
		
@export var max_value = 100:
	set(val):
		max_value = val
		if not is_inside_tree():
			await ready
		%Track1.max_value = max_value
		%Track2.max_value = max_value
		%Track2.right_value = max_value

@export var min_value = 0:
	set(val):
		min_value = val
		if not is_inside_tree():
			await ready
		%Track1.min_value = min_value
		%Track1.left_value = min_value
		%Track2.min_value = min_value

var _update_left_right_value_flag = true
@export var now_left_value = 0:
	set(val):
		now_left_value = val
		if not is_inside_tree():
			await ready
		_update_left_right_value_flag = true

@export var now_right_value = 0:
	set(val):
		now_right_value = val
		if not is_inside_tree():
			await ready
		_update_left_right_value_flag = true


func update_left_right_value():
	if _update_left_right_value_flag == false:
		return 
	%Track1.left_value = now_left_value
	%Track1.right_value = now_right_value
	%Track2.left_value = now_right_value
	%Track2.right_value = now_left_value
	
	%Track1Polygon.polygon = %Track1.get_points()
	%Track2Polygon.polygon = %Track2.get_points()
	
	%Track1Polygon.visible = %Track1Polygon.polygon.size()>0
	%Track2Polygon.visible = %Track2Polygon.polygon.size()>0
	if show_mode == ShowMode.DATERMINATE and now_right_value >= max_value:
		emit_signal("finish_progress")
	
	_update_left_right_value_flag = false
	

enum ShowMode {DATERMINATE, INDATERMINATE}
@export var show_mode:ShowMode = ShowMode.DATERMINATE:
	set(val):
		show_mode = val
		if not is_inside_tree():
			await ready
		if show_mode == ShowMode.DATERMINATE:
			%Track1Polygon.visible = true
			%Track2Polygon.visible = true
			%Track1.active_track = true
			%Track2.active_track = false
		elif show_mode == ShowMode.INDATERMINATE:
			%Track1Polygon.visible = true
			%Track2Polygon.visible = false
			%Track1.active_track = true
			%Track2.active_track = false

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
	now_left_value = min_value
	tween.tween_method(set_now_right_value, min_value, max_value, time)

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
	update_left_right_value()
