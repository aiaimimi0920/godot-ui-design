extends BaseComponent2

func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
	})

	_trigger_init_shape(%StateLayer, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
	})
	
	_trigger_init_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_WIDTH:UIDesignConstants.Attr.SHAPE_WIDTH,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,

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
	})


@export var child_init_attr_data = {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.NO_ROUNDING,
		UIDesignConstants.Attr.SHAPE_WIDTH:40,
		UIDesignConstants.Attr.SHAPE_HEIGHT:40,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		UIDesignConstants.Attr.SHAPE_OUTLINE_WIDTH:1,
		UIDesignConstants.Attr.SHAPE_OUTLINE_OFFSET:0,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE,
				UIDesignConstants.Attr.SHAPE_OPACITY:0,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				
				UIDesignConstants.Attr.STATE_LAYER_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER_HIGHEST,
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,

				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
				
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

@export var item_heigth = 100
@export var no_item_width = 0
@export var small_item_width = 40
@export var medium_item_width = 60
@export var large_item_width = 120

enum ShowMode {NO, SMALL, MEDIUM, LARGE}

@export var layout_show_mode_dict = {
	LayoutShowMode.MULTI_BROWSE: [ShowMode.LARGE,ShowMode.MEDIUM,ShowMode.SMALL],
	LayoutShowMode.HERO: [ShowMode.LARGE,ShowMode.SMALL],
	LayoutShowMode.CENTER_HERO: [ShowMode.SMALL,ShowMode.LARGE,ShowMode.SMALL],
	LayoutShowMode.CUSTOM: [ShowMode.SMALL,ShowMode.SMALL,ShowMode.SMALL],
	
}
enum LayoutShowMode {MULTI_BROWSE, HERO, CENTER_HERO, CUSTOM}
@export var layout_show_mode:LayoutShowMode = LayoutShowMode.MULTI_BROWSE:
	set(val):
		layout_show_mode = val
		if not is_inside_tree():
			await ready
		update_carousel_items()

@export var carousel_item_tscn = preload("res://addons/godot_ui_design/components/carousel/CarouselItem.tscn")

func update_carousel_items():
	child_init_attr_data = child_init_attr_data.duplicate(true)
	var cur_layout_show_mode_array = layout_show_mode_dict[layout_show_mode].duplicate(true)
	var no_node_len = cur_layout_show_mode_array.size()-1
	for i in range(no_node_len):
		cur_layout_show_mode_array.push_front(ShowMode.NO)
		cur_layout_show_mode_array.push_back(ShowMode.NO)
	
	var target_width = 0
	var separation_num = 0
	
	for key in cur_layout_show_mode_array:
		separation_num+=1
		if key == ShowMode.NO:
			target_width += no_item_width
			separation_num-=1
		elif key == ShowMode.LARGE:
			target_width += large_item_width
		elif key == ShowMode.MEDIUM:
			target_width += medium_item_width
		elif key == ShowMode.SMALL:
			target_width += small_item_width

	target_width += separation_num*8
	child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = target_width + 24
	child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT] = item_heigth + 16
	
	
	_init_flag = true
	
	
	var childs = %CarouselHBoxContainer.get_children()
	for child_node in childs:
		%CarouselHBoxContainer.remove_child(child_node)
	
	await get_tree().process_frame
	for key in cur_layout_show_mode_array:
		var cur_node = carousel_item_tscn.instantiate()
		var cur_control = CenterContainer.new()
		%CarouselHBoxContainer.add_child(cur_control)
		cur_control.add_child(cur_node)
		cur_node.item_heigth = item_heigth
		cur_node.no_item_width = no_item_width
		cur_node.small_item_width = small_item_width
		cur_node.medium_item_width = medium_item_width
		cur_node.large_item_width = large_item_width
		cur_node.first_init = true
		cur_node.show_mode = key
		cur_node.connect("finish_pressed",drag_item.bind(cur_node))
		

var init_left_id = null
var init_right_id = null
var update_carousel_item_tscn_node = false

func set_left_id(cur_id):
	init_left_id = cur_id
	update_carousel_item_tscn_node = true
	pass

func set_right_id(cur_id):
	init_right_id = cur_id
	update_carousel_item_tscn_node = true
	pass

func _process(delta):
	super._process(delta)
	update_carousel_item_tscn()

func update_carousel_item_tscn():
	if update_carousel_item_tscn_node == false:
		return 
	
	if init_left_id != null:
		var cur_layout_show_mode_array = layout_show_mode_dict[layout_show_mode].duplicate(true)
		var no_node_len = cur_layout_show_mode_array.size()-1
		for i in range(cur_layout_show_mode_array.size()):
			var cur_tscn = get_id_tscn(init_left_id, i)
			%CarouselHBoxContainer.get_child(no_node_len+i).get_child(0).set_tscn(cur_tscn)
	elif init_right_id != null:
		var cur_layout_show_mode_array = layout_show_mode_dict[layout_show_mode].duplicate(true)
		var no_node_len = cur_layout_show_mode_array.size()-1
		for i in range(cur_layout_show_mode_array.size()):
			var cur_tscn = get_id_tscn(init_right_id, -i)
			%CarouselHBoxContainer.get_child(-no_node_len-i-1).get_child(0).set_tscn(cur_tscn)

	update_carousel_item_tscn_node = false
	pass

func drag_item(begin_pos, end_pos, cur_node):
	var index = 0
	var begin_index = 0 
	var end_index = null
	
	var cur_layout_show_mode_array = layout_show_mode_dict[layout_show_mode].duplicate(true)
	var no_node_len = cur_layout_show_mode_array.size()-1
	var left_id = %CarouselHBoxContainer.get_child(no_node_len).get_child(0).get_id()
	var right_id = %CarouselHBoxContainer.get_child(-no_node_len-1).get_child(0).get_id()
	
	for node in %CarouselHBoxContainer.get_children():
		if node.visible == true:
			if node.get_global_rect().has_point(begin_pos):
				begin_index = index
			elif node.get_global_rect().has_point(end_pos):
				end_index = index
		index += 1
		
	if end_index == null:
		if end_pos.x< %CarouselHBoxContainer.get_child(0).position.x:
			end_index = no_node_len
		elif end_pos.x > %CarouselHBoxContainer.get_child(-1).position.x+%CarouselHBoxContainer.get_child(-1).size.x:
			end_index = no_node_len*2
	
	if begin_index > end_index:
		for i in range(begin_index-end_index-1,-1,-1):
			%CarouselHBoxContainer.move_child(%CarouselHBoxContainer.get_child(i),-1)
			
		for i in range(0,begin_index-end_index):
			var cur_tscn = get_id_tscn(right_id,i+1)
			
			var item_node = %CarouselHBoxContainer.get_child(2*no_node_len+1-(begin_index-end_index)+i)
			item_node.get_child(0).set_tscn(cur_tscn)
		pass
	elif begin_index < end_index:
		for i in range(end_index-begin_index-1,-1,-1):
			%CarouselHBoxContainer.move_child(%CarouselHBoxContainer.get_child(-(i+1)),0)

		for i in range(0,end_index-begin_index):
			var cur_tscn = get_id_tscn(left_id,-(i+1))
			var item_node = %CarouselHBoxContainer.get_child(no_node_len+end_index-begin_index-i-1)
			item_node.get_child(0).set_tscn(cur_tscn)
	
	for i in range(no_node_len):
		cur_layout_show_mode_array.push_front(ShowMode.NO)
		cur_layout_show_mode_array.push_back(ShowMode.NO)
	
	var node_index = 0
	for node in %CarouselHBoxContainer.get_children():
		node.get_child(0).show_mode = cur_layout_show_mode_array[node_index]
		
		node_index += 1


var get_id_tscn_func :Callable

func trigger_get_id_tscn_func(cur_func):
	get_id_tscn_func = cur_func
	pass

func get_id_tscn(cur_id, offset):
	if get_id_tscn_func:
		var cur_tscn = get_id_tscn_func.call(cur_id, offset)
		return cur_tscn
	return null
