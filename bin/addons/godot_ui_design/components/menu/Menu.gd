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
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.EXTRA_SMALL_ROUNDING,
		UIDesignConstants.Attr.SHAPE_HEIGHT:48,
		UIDesignConstants.Attr.SHAPE_WIDTH:112,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE_CONTAINER,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_2,
				
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


@export var item_list=[]:
	set(val):
		item_list = val
		update_item_list_flag = true
	get:
		return item_list


var update_item_list_flag = true
func _process(delta):
	super._process(delta)
	update_item_list()
	update_now_hover()

@export var menu_item_tscn = preload("res://addons/godot_ui_design/components/menu/MenuItem.tscn")
@export var separator_tscn = preload("res://addons/godot_ui_design/components/separator/HSeparatorControl.tscn")



func update_item_list():
	if update_item_list_flag == false:
		return 
	var childs = %ContentVBoxContainer.get_children()
	for child_node in childs:
		%ContentVBoxContainer.remove_child(child_node)
	for i in range(len(item_list)):
		var cur_data = item_list[i]
		var cur_node = null
		if cur_data == null:
			continue
		if cur_data.get("type","") == "item":
			cur_node = menu_item_tscn.instantiate()
			cur_node.label_text = cur_data.get("label_text","")
			cur_node.leading_icon_name = cur_data.get("leading_icon_name","")
			cur_node.trailing_label_text = cur_data.get("trailing_label_text","")
			cur_node.trailing_icon_name = cur_data.get("trailing_icon_name","")
			var attach_data = cur_data.get("attach_data",[])
			if cur_node.trailing_icon_name=="" and len(attach_data)>0:
				cur_node.trailing_icon_name = "arrow-right"
			
			cur_node.connect("start_hovered", start_hovered_func.bind(i))
			cur_node.connect("finish_hovered", finish_hovered_func.bind(i))
			pass
		elif cur_data.get("type","") == "separator":
			cur_node = separator_tscn.instantiate()
		if cur_node:
			cur_node.set_meta("index",i)
			%ContentVBoxContainer.add_child(cur_node)
		
	update_item_list_flag = false

var update_now_hover_flag = false
var now_hover_index = -1
func start_hovered_func(index):
	now_hover_index = index
	update_now_hover_flag = true

func finish_hovered_func(index):
	if now_hover_index == index:
		now_hover_index = -1
		update_now_hover_flag = true


func update_now_hover():
	if update_now_hover_flag == false:
		return 

	if now_hover_index != -1:
		update_sub_menu()
	
	update_now_hover_flag = false

var sub_menu = null

func update_sub_menu():
	if sub_menu != null:
		if now_hover_index==-1:
			sub_menu.queue_free()
			return 
		elif sub_menu.get_meta("index") == now_hover_index:
			return 
		else:
			sub_menu.queue_free()
	
	var cur_data = item_list[now_hover_index]
	if len(cur_data.get("attach_data",[]))<=0:
		if sub_menu and sub_menu!=null:
			sub_menu.queue_free()
		return 
	
	var cur_menu_tscn = load("res://addons/godot_ui_design/components/menu/MenuControl.tscn")
	sub_menu = cur_menu_tscn.instantiate()
	var child_node = %ContentVBoxContainer.get_child(now_hover_index)
	var sub_child_node = child_node.get_node("BaseComponent/Content")
	sub_child_node.add_child(sub_menu)
	sub_menu.set_meta("index",now_hover_index) 
	sub_menu.anchors_preset = PRESET_TOP_RIGHT
	sub_menu.size_flags_horizontal = SIZE_SHRINK_END
	sub_menu.item_list = cur_data.get("attach_data",[])
