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
	})
	
	_trigger_init_shape(%FocusIndicator, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
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
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
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

				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
				
				UIDesignConstants.Attr.FOCUS_INDICATOR_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_COLOR:UIDesignConstants.Role.SECONDARY,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
			},
		UIDesignConstants.State.DISABLED:{
			},
		UIDesignConstants.State.HOVERED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
			},
		UIDesignConstants.State.FOCUSED:{
				UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
				UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OPACITY:0,
			},
		UIDesignConstants.State.ACTIVATED:{
			},
		UIDesignConstants.State.PRESSED:{
			UIDesignConstants.Attr.STATE_LAYER_OPACITY:0,
			},
		UIDesignConstants.State.DRAGGED:{
			},
	}

func get_update_attr_data():
	return child_update_attr_data


@export var density:int=0:
	set(val):
		density = val
		_init_flag = true

@onready var block_button_list = [%SegmentedBlockButton1,%SegmentedBlockButton2,%SegmentedBlockButton3,%SegmentedBlockButton4,%SegmentedBlockButton5]

func _ready():
	super._ready()
	var cur_len_block = len_block
	cur_len_block = max(2,cur_len_block)
	cur_len_block = min(5,cur_len_block)
	var len_target_index = len_map[cur_len_block][init_selected_index]
	for node in block_button_list:
		node.visible = false
	
	for i in len_map[cur_len_block]:
		var node = block_button_list[i]
		node.visible = true
		if i == len_target_index:
			node.button_pressed = true
			node._on_toggled(true)
		else:
			node.button_pressed = false
			node._on_toggled(false)
	_init_flag = true
	
@export var init_selected_index = 0


func _init_all():
	if _init_flag == false:
		return 
	child_init_attr_data = child_init_attr_data.duplicate(true)
	child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT] = 40 + density * 4
	var max_size_x = 0
	var all_size_len = 0
	for node in block_button_list:
		if node.visible:
			max_size_x = max(node.size.x, max_size_x)
			all_size_len += 1
	for node in block_button_list:
		node.new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT] = child_init_attr_data[UIDesignConstants.Attr.SHAPE_HEIGHT]
		node.new_child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = max_size_x
		node._init_flag = true
	
	child_init_attr_data[UIDesignConstants.Attr.SHAPE_WIDTH] = max_size_x * all_size_len
	super._init_all()


@export var text_list:PackedStringArray = ["hello","hi"]:
	set(val):
		text_list = val
		if block_button_list==null:
			await ready
		var cur_len_block = len_block
		cur_len_block = max(2,cur_len_block)
		cur_len_block = min(5,cur_len_block)
		var len_target_index = len(len_map[cur_len_block])
		
		for i in range(len_target_index):
			var target_index = len_map[cur_len_block][i]
			block_button_list[target_index].label_text = text_list[i%len(text_list)]
	get:
		return text_list

@export var icon_list:PackedStringArray = ["alert","alert"]:
	set(val):
		icon_list = val
		if block_button_list==null:
			await ready
		var cur_len_block = len_block
		cur_len_block = max(2,cur_len_block)
		cur_len_block = min(5,cur_len_block)
		var len_target_index = len(len_map[cur_len_block])
		for i in range(len_target_index):
			var target_index = len_map[cur_len_block][i]
			block_button_list[target_index].icon_name = icon_list[i%len(icon_list)]
	get:
		return icon_list

var len_block:
	get:
		return max(text_list.size(),icon_list.size())

var len_map={
	2:[0,4],
	3:[0,2,4],
	4:[0,1,2,4],
	5:[0,1,2,3,4],
}

@export var multiple_selected=false 

func _on_segmented_block_button_custom_toggled(toggled_on, node):
	if multiple_selected == false:
		if toggled_on:
			for cur_node in block_button_list:
				if cur_node!=node:
					cur_node.button_pressed = false
	
	var have_selected = false
	for cur_node in block_button_list:
		if cur_node.button_pressed:
			have_selected = true
	
	if not have_selected:
		node.button_pressed = true


func _on_container_resized():
	_init_flag = true

