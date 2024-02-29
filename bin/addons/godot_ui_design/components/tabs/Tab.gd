extends BaseComponent2
	
func trigger_init_shape():
	_trigger_init_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.Attr.SHAPE_TOKEN,
		UIDesignConstants.Attr.SHAPE_HEIGHT:UIDesignConstants.Attr.SHAPE_HEIGHT,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Attr.SHAPE_SHADOWCOLOR,
	})

func trigger_update_shape():
	_trigger_update_shape(%Container, {
		UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Attr.SHAPE_COLOR,
		UIDesignConstants.Attr.SHAPE_OPACITY:UIDesignConstants.Attr.SHAPE_OPACITY,
		UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.Attr.SHAPE_ELEVATION,
	})


enum ShowMode {PRIMARY, SECONDARY}
@export var show_mode: ShowMode=ShowMode.SECONDARY:
	set(val):
		show_mode = val
		update_item_list_flag = true
	get:
		return show_mode


@export var child_init_attr_data = {
		UIDesignConstants.Attr.SHAPE_TOKEN:UIDesignConstants.ShapeToken.NO_ROUNDING,
		UIDesignConstants.Attr.SHAPE_SHADOWCOLOR:UIDesignConstants.Role.SHADOW,
		UIDesignConstants.Attr.SHAPE_HEIGHT:56,
		
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_WIDTH:UIDesignConstants.focus_indicator_thickness,
		UIDesignConstants.Attr.FOCUS_INDICATOR_OUTLINE_OFFSET:UIDesignConstants.focus_indicator_outer_offset,
		
		UIDesignConstants.Attr.LABEL_TOKEN:UIDesignConstants.LabelToken.TITLE_LARGE,
	}
	
func get_init_attr_data():
	return child_init_attr_data

@export var child_update_attr_data = {
		UIDesignConstants.State.ENABLED:{
				UIDesignConstants.Attr.SHAPE_COLOR:UIDesignConstants.Role.SURFACE,
				UIDesignConstants.Attr.SHAPE_ELEVATION:UIDesignConstants.ElevationLevel.LEVEL_0,
				UIDesignConstants.Attr.SHAPE_OPACITY:1,
				
				
				UIDesignConstants.Attr.LABEL_COLOR:UIDesignConstants.Role.ON_SURFACE,
				UIDesignConstants.Attr.LABEL_OPACITY:1,
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

var update_item_list_flag = false
@export var item_list = []:
	set(val):
		item_list = val
		update_item_list_flag = true
	get:
		return item_list

func _process(delta):
	super._process(delta)
	update_item_list()


@export var secondary_tscn = preload("res://addons/godot_ui_design/components/tabs/SecondaryTabItem.tscn")
@export var primary_tscn = preload("res://addons/godot_ui_design/components/tabs/PrimaryTabItem.tscn")

func update_item_list():
	if update_item_list_flag == false:
		return 

	var childs = %ContentHBoxContainer.get_children()
	for child_node in childs:
		%ContentHBoxContainer.remove_child(child_node)
	
	var cur_tscn = null

	if show_mode == ShowMode.PRIMARY:
		cur_tscn = primary_tscn
	elif show_mode == ShowMode.SECONDARY:
		cur_tscn = secondary_tscn
	for i in range(len(item_list)):
		var cur_data = item_list[i]
		var cur_node = cur_tscn.instantiate()
		cur_node.set_meta("index", i)
		
		var cur_item_text = cur_data.get("item_text","item_text")
		var cur_icon_name = cur_data.get("icon_name","")
		var cur_badge_num = cur_data.get("badge_num","")
		%ContentHBoxContainer.add_child(cur_node)
		cur_node.item_text = cur_item_text
		cur_node.icon_name = cur_icon_name
		cur_node.badge_num = cur_badge_num
		cur_node.connect("show_tab",show_tab_func.bind(i))
	
	%ContentHBoxContainer.get_child(0)._on_pressed()
	update_item_list_flag = false

signal show_tab
func show_tab_func(index):
	emit_signal("show_tab",index)

func _on_resized():
	%BaseComponent.custom_minimum_size = size

func change_tab_badge_num(index, target_num):
	item_list[index]["badge_num"] = target_num
	%ContentHBoxContainer.get_child(index).badge_num = target_num
